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
        // Correct way to execute another command
        await vscode.commands.executeCommand('basic.run');
    });

    // Push all commands to subscriptions
    context.subscriptions.push(runCommand, runQB64Command, runQB64peCommand, runWithSelectionCommand);
}

function deactivate() {}

module.exports = {
    activate,
    deactivate
};
