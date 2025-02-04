_TITLE "Hamurabi - King of Babylon and Ruler of the Ancient Kingdom of Sumeria"
'$DYNAMIC

REM This should highlight

' *** Choose your console/screen type below
'$CONSOLE:ONLY
'SCREEN 0
SCREEN _NEWIMAGE(800, 600, 32)

RANDOMIZE TIMER

' ***
' *** DISPLAY INTRODUCTION TO THE GAME
' ***
PRINT TAB(32); "HAMURABI"
PRINT
PRINT "You are the ruler of the ancient kingdom of Sumeria."
PRINT "Your people call you 'Hamurabi the Wise'."
PRINT
PRINT "Your task is for the next 10 years is to develop"
PRINT "a stable economy by the wise management of your"
PRINT "resources. You will be beset from time to time"
PRINT "by natural events."
PRINT
PRINT "The only help I can give you is the fact that it"
PRINT "takes 1 bushel of grain as seed to plant two acres."
PRINT
PRINT "May you judge well, alknowing Hamurabi!"
PRINT
PRINT "***********HAMURABI IS HERE***********"
PRINT
_DELAY 5

HamurabiInit:
    DIM AS DOUBLE STARVED, PEOPLE_DIED, PCT_STARVED, YEAR, POPULATION, BUSHELS, HARVESTED
    DIM AS DOUBLE RATS_ATE, PESTILENCE, PRICE, ACRES, IMMIGRATED, C
    DIM AS DOUBLE PI
    DIM AS INTEGER PLAGUE_PCT, PLAGUE, ACRES_BUY, ACRES_SELL, ACRES_PLANTED, BUSHELS_FEED

    STARVED = 0 ' *** D=0 
    PEOPLE_DIED = 0 ' *** D1=0
    PCT_STARVED = 0 ' *** P1=0
    YEAR = 0 '*** Z=0
    POPULATION = 95 '*** P=95
    BUSHELS = 2800 '*** S=2800
    HARVESTED = 3000 '*** H=3000
    RATS_ATE = HARVESTED - BUSHELS '*** E=H-S
    PESTILENCE = 0 '*** NEW FIELD
    PRICE = 3 '*** Y=3
    ACRES = HARVESTED / PRICE '*** A=H/Y
    IMMIGRATED = 5 '*** I=5
    C = 1 '*** C=1  VARIABLE USED FOR ALL RANDOM NUMBER GENERATORS
    PI = 0
    NEWBORN = 0
    PLANTERS = 0 '*** The number of people able to plant fields (Excludes New Borns) 


PlayGame: 
    CLS 
    PRINT: PRINT 
    PRINT "HAMURABI, I beg to report to you!"
    PRINT
    YEAR = YEAR + 1
    PRINT "In year "; YEAR; ", "; STARVED; " People starved, "; NEWBORN; " New Borns, and "; IMMIGRATED; " migrated into the city."
    POPULATION = POPULATION + IMMIGRATED + NEWBORN
    IF YEAR = 1 THEN PLANTERS = POPULATION ELSE PLANTERS = PLANTERS + IMMIGRATED

CheckForPlague: 
' *** check for plague and if found, reduce population by 1/2. (15% chance of plague)
    PLAGUE_PCT = (10 * RND(1))
    DISASTER_PCT = (10 * RND(1))
    PRINT
    IF PLAGUE_PCT >= 8.5 AND YEAR > 1 THEN
        PLAGUE = INT(POPULATION / 2)
        POPULATION = PLAGUE
        PLANTERS = INT(PLANTERS / 2)
        PRINT "A horrible plague struck! Half the people died."
        PRINT "Half ("; PLAGUE; ") died of the plague."
        PRINT
    END IF

    PRINT
    IF DISASTER_PCT >= 8.5 AND YEAR > 1 THEN
        PLAGUE = INT(POPULATION / 3)
        POPULATION = PLAGUE
        PLANTERS = INT(PLANTERS / 3)
        PRINT "A horrible disaster struck! One-Third the people died."
        PRINT "Half ("; PLAGUE; ") died from the disaster."
        PRINT
    END IF

Display_Population:
    PRINT "Our Population is now "; POPULATION
    PRINT "Able-bodied people to plant the fields is now "; PLANTERS
    PRINT "The city owns "; ACRES; " acres, "
    PRINT "You havested "; PRICE; " bushels per acre"
    PRINT "Rats destroyed "; RATS_ATE; " bushels. "
    PRINT "Insects destroyed "; PESTILENCE; " bushels."
    PRINT "You have "; BUSHELS; " bushels in storage."
    PRINT
    IF YEAR = 11 THEN GOTO PlayEvaluation
    C = INT(10 * RND(1))
    PRICE = C + 17
    PRINT "Land is trading at "; PRICE; " bushels per acre."

BuyLand:
    INPUT "How much land (in acres) do you wish to buy "; ACRES_BUY
    IF ACRES_BUY < 0 THEN GOTO FedUp
    IF PRICE * ACRES_BUY <= BUSHELS THEN
        IF ACRES_BUY = 0 THEN GOTO SellLand
        ACRES = ACRES + ACRES_BUY
        BUSHELS = BUSHELS - PRICE * ACRES_BUY
        C = 0
        GOTO FeedPopulation
    END IF
    GOSUB NotEnoughGrain
    GOTO BuyLand

SellLand:
    INPUT "How many acres of land do you wish to sell "; ACRES_SELL
    IF ACRES_SELL < 0 THEN GOTO FedUp
    IF ACRES_SELL < ACRES THEN
        ACRES = ACRES - ACRES_SELL
        BUSHELS = BUSHELS + PRICE * ACRES_SELL
        C = 0
        GOTO FeedPopulation
    END IF
    GOSUB NotEnoughAcres
    GOTO SellLand

FeedPopulation:
    INPUT "How many bushels do you wish to set aside for food "; BUSHELS_FEED
    IF BUSHELS_FEED < 0 THEN GOTO FedUp
    IF BUSHELS_FEED = 0 THEN
        GOSUB NotEnoughGrain
        GOTO FeedPopulation
    END IF
' *** TRYING TO USE MORE GRAIN THAN IS IN SILOS?
    IF BUSHELS_FEED <= BUSHELS THEN
        BUSHELS = BUSHELS - BUSHELS_FEED
        C = 1
        GOTO AcresToPlant
    END IF
    GOSUB NotEnoughGrain
    GOTO FeedPopulation

AcresToPlant:
    INPUT "How many acres do you wish to plant "; ACRES_PLANTED
' *** TRYING TO PLANT MORE ACRES THAN YOU OWN?
    IF ACRES_PLANTED = 0 THEN GOTO HarvestCrops
    IF ACRES_PLANTED < 0 THEN GOTO FedUp
' *** ENOUGH GRAIN FOR SEED (TWO BUSHELS PER ACRE)?
    IF ACRES_PLANTED <= ACRES THEN
        IF INT(ACRES_PLANTED / 2) <= BUSHELS THEN
' *** ENOUGH PEOPLE TO TEND THE CROPS?
            IF ACRES_PLANTED < 10 * PLANTERS + 1 THEN
                BUSHELS = BUSHELS - INT(ACRES_PLANTED / 2)
                GOTO HarvestCrops
            ELSE
                PRINT "But you only have "; PLANTERS; " people to tend the fields!, Now then, "
                GOTO AcresToPlant
            END IF
        ELSE
            GOSUB NotEnoughGrain
            GOTO AcresToPlant
        END IF
    END IF
    GOSUB NotEnoughAcres
    GOTO AcresToPlant

HarvestCrops:
' *** A BOUNTIFUL HARVEST!
    GOSUB Randomizer
    PRICE = C
    HARVESTED = ACRES_PLANTED * PRICE

' *** Provides a 50-50 chance of no damage due to Rats and Insects
    GOSUB Randomizer
    IF C MOD 2 = 0 THEN
        BUSHELS = BUSHELS + HARVESTED
        GOTO PopulationControl
    END IF

' *** Rats eat the existing store of Bushels, before the harvest is added
    RATS_ATE = 0
    RATS_ATE = INT(BUSHELS / C)


' *** Insects eat at the crops in the field, and reduce the harvest
    GOSUB Randomizer
    PESTILENCE = 0
    INSECTS_PCT = (10 * RND(1))
    IF INSECTS_PCT >= 6 THEN PESTILENCE = INT(HARVESTED / C)

    BUSHELS = BUSHELS + HARVESTED - (RATS_ATE + PESTILENCE)
    IF BUSHELS < 0 THEN BUSHELS = 0

PopulationControl:
' *** Determine births and those who moved to the city

' *** LET'S HAVE SOME BABIES (Change to a random-generated number from 0-20)
'   NEWBORN = INT(C * (20 * ACRES + BUSHELS) / POPULATION / 100 + 1)
'    GOSUB Randomizer
    NEWBORN = INT(10 * RND(1)) ' *** No more than 10 newborns in a year

' *** LET'S HAVE SOME IMMIGRATION
    GOSUB Randomizer
    IMMIGRATED = INT(C * (20 * ACRES + BUSHELS) / POPULATION / 100 + 1)

' *** HOW MANY PEOPLE HAD FULL TUMMIES?
    C = INT(BUSHELS_FEED / 20)
    IF POPULATION < C THEN
        STARVED = 0
        GOTO PlayGame
    END IF

' *** STARVED ENOUGH FOR IMPEACHMENT (Greater than 45% of population)?
    STARVED = POPULATION - C
    IF STARVED > .45 * POPULATION THEN GOTO StarvedMSG
    PCT_STARVED = ((YEAR - 1) * PCT_STARVED + STARVED * 100 / POPULATION) / YEAR
    POPULATION = C
    PEOPLE_DIED = PEOPLE_DIED + STARVED '*** D1=D1+D
    GOTO PlayGame

' ***
' *** Game processing routines
' ***

StarvedMSG:
    PRINT
    PRINT "You starved "; STARVED; " people in this year!!!"

ExtremeMismangement:
    PRINT "Due to extreme mismanagement you have been impeached and thrown out of office."
    PRINT "You have failed to honor your promise or lacked courage or commitment."
    PRINT "The people have declared you a National Fink!!!!"
    GOTO endProg

FedUp:
    PRINT
    PRINT "HAMURABI: I cannot do what you wish."
    PRINT "Get yourself another steward!!!!!"
    GOTO endProg

PlayEvaluation:
    PRINT USING "In your 10-year term of office, ##.##"; PCT_STARVED;
    PRINT " percent of the population"
    PRINT "starved per year on average,";
    PRINT USING " or a total of ###"; PEOPLE_DIED;
    PRINT " people died!!"
    PRINT

DeterminePlay:
    LAND_PER_PERSON = ACRES / POPULATION
    PRINT USING "You started with 10 acres per person and ended with ##.##"; LAND_PER_PERSON;
    PRINT " arces per person."
    PRINT
    IF PCT_STARVED > 33 THEN GOTO ExtremeMismangement
    IF LAND_PER_PERSON < 7 THEN GOTO ExtremeMismangement
    IF PCT_STARVED > 10 THEN GOTO HeavyHanded
    IF LAND_PER_PERSON < 9 THEN GOTO HeavyHanded
    IF PCT_STARVED > 3 THEN GOTO MediocurePlay
    IF LAND_PER_PERSON < 10 THEN GOTO MediocurePlay
    PRINT "A fantastic performance! Charlemange, Disraeli, and"
    PRINT "Jefferson combined could not have done better!"
    GOTO endProg

HeavyHanded:
    PRINT "Your heavy-handed performance smacks of Nero and Ivan IV."
    PRINT "The remaining people find you an unpleasant ruler, and,"
    PRINT "frankly, hate your guts!!"
    GOTO endProg

MediocurePlay:
    PRINT "Your performance could have been somewhat better, but"
    PRINT "really wasn't too bad at all. "; INT(POPULATION * .8 * RND(1)); " people"
    PRINT "would dearly like to see you assassinated but we all have our"
    PRINT "trivial problems."
    GOTO endProg

NotEnoughGrain:
    PRINT " HAMURABI: Think again. You have only"
    PRINT BUSHELS; " bushels of grain. Now then,"
    RETURN

NotEnoughAcres:
    PRINT "HAMURABI: Think again. You own only "; ACRES; " acres. Now Then,"
    RETURN

Randomizer:
    C = INT(RND(1) * 5) + 1
    RETURN

endProg:
    PRINT
    FOR N = 1 TO 10
        PRINT CHR$(7);
    NEXT N
    PRINT "So long, for now."
    PRINT
    END

