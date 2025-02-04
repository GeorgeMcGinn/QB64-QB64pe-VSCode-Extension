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

    // Register any commands or other functionality here
    // For example:
    // let disposable = vscode.commands.registerCommand('qb64-language.helloWorld', function () {
    //     vscode.window.showInformationMessage('Hello World from QB64/QB64PE!');
    // });
    // context.subscriptions.push(disposable);
}

function deactivate() {
    // Cleanup code (if needed)
}

module.exports = {
    activate,
    deactivate
};
