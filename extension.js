const vscode = require('vscode');
const fs = require('fs');
const path = require('path');

function activate(context) {
    console.log('QB64/QB64PE extension is now active');

    // Initialize globalStorage
    const globalStoragePath = context.globalStorageUri.fsPath;

    // Create the directory if it doesn't exist
    if (!fs.existsSync(globalStoragePath)) {
        fs.mkdirSync(globalStoragePath, { recursive: true });
    }

    // Now you can safely use globalStorage
    // For example, to store a value:
    context.globalState.update('myKey', 'myValue');

    // Helper function to run tasks
    async function runTask(buildLabel, runLabel) {
        const tasks = await vscode.tasks.fetchTasks();
        console.log('Available tasks:', tasks.map(task => task.name)); // Debugging
        const buildTask = tasks.find(task => task.name === buildLabel);
        const runTask = tasks.find(task => task.name === runLabel);
        
        if (buildTask && runTask) {
            console.log(`Executing ${buildLabel} task...`);
            await vscode.tasks.executeTask(buildTask); // Compile first
            console.log(`Executing ${runLabel} task...`);
            await vscode.tasks.executeTask(runTask);   // Then run
        } else {
            vscode.window.showErrorMessage(`Either "${buildLabel}" or "${runLabel}" task not found.`);
        }
    }

    // Function to create .vscode folder and configuration files if they don't exist or if they need updating
    const setupWorkspace = async () => {
        try {
            const workspaceFolders = vscode.workspace.workspaceFolders;
            if (!workspaceFolders) {
                vscode.window.showInformationMessage('No workspace folder open. Open a folder to use this extension.');
                return;
            }

            const workspacePath = workspaceFolders[0].uri.fsPath;
            const vscodeDir = path.join(workspacePath, '.vscode');

            if (!fs.existsSync(vscodeDir)) {
                fs.mkdirSync(vscodeDir);
            }

            const tasksPath = path.join(vscodeDir, 'tasks.json');
            const launchPath = path.join(vscodeDir, 'launch.json');

            const tasksContent = {
                "version": "2.0.0",
                "tasks": [
                    // QB64 build task
                    {
                        "label": "buildQB64",
                        "type": "shell",
                        "command": "qb64",
                        "args": [
                            "-x",
                            "${file}",
                            "-o",
                            "${fileBasenameNoExtension}"
                        ],
                        "windows": {
                            "command": "qb64.exe",
                            "args": [
                                "-x",
                                "${file}",
                                "-o",
                                "${fileBasenameNoExtension}.exe"
                            ]
                        },
                        "problemMatcher": [],
                        "group": {
                            "kind": "build"
                        }
                    },
                    // QB64 run task
                    {
                        "label": "runQB64",
                        "type": "shell",
                        "command": "${fileDirname}/${fileBasenameNoExtension}",
                        "windows": {
                            "command": "${fileDirname}/${fileBasenameNoExtension}.exe"
                        },
                        "options": {
                            "cwd": "${fileDirname}"
                        },
                        "problemMatcher": [],
                        "dependsOn": "buildQB64",
                        "group": {
                            "kind": "test"
                        }
                    },
                    // QB64pe build task
                    {
                        "label": "buildQB64pe",
                        "type": "shell",
                        "command": "qb64pe",
                        "args": [
                            "-x",
                            "${file}",
                            "-o",
                            "${fileBasenameNoExtension}"
                        ],
                        "windows": {
                            "command": "qb64pe.exe",
                            "args": [
                                "-x",
                                "${file}",
                                "-o",
                                "${fileBasenameNoExtension}.exe"
                            ]
                        },
                        "problemMatcher": [],
                        "group": {
                            "kind": "build"
                        }
                    },
                    // QB64pe run task
                    {
                        "label": "runQB64pe",
                        "type": "shell",
                        "command": "${fileDirname}/${fileBasenameNoExtension}",
                        "windows": {
                            "command": "${fileDirname}/${fileBasenameNoExtension}.exe"
                        },
                        "options": {
                            "cwd": "${fileDirname}"
                        },
                        "problemMatcher": [],
                        "dependsOn": "buildQB64pe",
                        "group": {
                            "kind": "test"
                        }
                    }
                ],
                "extensionVersion": context.extension.packageJSON.version // Add this to track the extension version
            };

            if (fs.existsSync(tasksPath)) {
                const existingTasks = JSON.parse(fs.readFileSync(tasksPath, 'utf8'));
                if (existingTasks.extensionVersion !== tasksContent.extensionVersion) {
                    fs.writeFileSync(tasksPath, JSON.stringify(tasksContent, null, 4));
                    vscode.window.showInformationMessage('Updated workspace configuration files to match extension version.');
                } else {
                    console.log('Tasks.json is up to date with the current extension version.');
                }
            } else {
                fs.writeFileSync(tasksPath, JSON.stringify(tasksContent, null, 4));
                vscode.window.showInformationMessage('Workspace configuration files created.');
            }

            if (!fs.existsSync(launchPath)) {
                fs.writeFileSync(launchPath, JSON.stringify({
                    "version": "0.2.0",
                    "configurations": [
                        {
                            "type": "node",
                            "request": "launch",
                            "name": "Run QB64/QB64pe BASIC Program",
                            "preLaunchTask": "${command:basic.runWithSelection}"
                        }
                    ]
                }, null, 4));
            }

        } catch (error) {
            vscode.window.showErrorMessage(`Error setting up workspace: ${error.message}`);
        }
    };

    // Command for running BASIC programs with compiler selection
    let runCommand = vscode.commands.registerCommand('basic.run', async () => {
        const choices = ['QB64', 'QB64 Phoenix Edition'];
        const selectedCompiler = await vscode.window.showQuickPick(choices, {
            placeHolder: 'Select the BASIC compiler to use'
        });

        if (!selectedCompiler) {
            vscode.window.showInformationMessage('No compiler selected.');
            return;
        }

        if (selectedCompiler === 'QB64') {
            await runTask('buildQB64', 'runQB64');
        } else if (selectedCompiler === 'QB64 Phoenix Edition') {
            await runTask('buildQB64pe', 'runQB64pe');
        }
    });

    // Command for running QB64 programs directly from the menu
    let runQB64Command = vscode.commands.registerCommand('basic.runQB64', async () => {
        await runTask('buildQB64', 'runQB64');
    });

    // Command for running QB64 Phoenix Edition programs directly from the menu
    let runQB64peCommand = vscode.commands.registerCommand('basic.runQB64pe', async () => {
        await runTask('buildQB64pe', 'runQB64pe');
    });

    // Command to be used in launch.json for dynamic compiler selection
    let runWithSelectionCommand = vscode.commands.registerCommand('basic.runWithSelection', async () => {
        await vscode.commands.executeCommand('basic.run');
    });

    // Register a command to manually trigger setup if needed
    context.subscriptions.push(vscode.commands.registerCommand('basic.setupWorkspace', setupWorkspace));

    // Automatically setup when extension activates
    setupWorkspace();

    // Push all commands to subscriptions
    context.subscriptions.push(runCommand, runQB64Command, runQB64peCommand, runWithSelectionCommand);
}

function deactivate() {}

module.exports = {
    activate,
    deactivate
};