# Changelog

All notable changes to the "qb64-language" extension will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

- Highlighting of InForm keywords
- Highlighting other files(like markdown, C/C++, Python, etc.)


## [1.1.3] - 2025-02-16

### Fixed
  - Updated to put .exe after qb64 and qb64pe for Windows to execute compiles properly.
  - Fixed the issue where the .vscode in workspace wasn't being recreated properly when extension changes.


## [1.1.2] - 2025-02-16

### Fixed missing workspace directory
  - Added code to estension.json to create the workspace .vscode directory with launch.json and tasks.json to enable QB64/QB64pe compiles.

## [1.1.1] - 2025-02-16

### Fixed language ID mismatches
  - package.json and tasks.json had different language ID's. Fixed them to match.


## [1.1.0] - 2025-02-16 

### Added
  - Added compile & run for both QB64 and QB64pe compilers
  - Updated ctrl-F5 to run either compiler (QB64/QB64pe)

## [1.0.0] - 2025-02-04

### Added
- QB64/QBasic/openGL keywords.
- Conforms to QB64 Phoenix Edition v4.0.0

[1.1.3]: https://github.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/pull/7
[1.1.2]: https://github.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/pull/5
[1.1.1]: https://github.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/pull/3
[1.1.0]: https://github.com/GeorgeMcGinn/QB64-QB64pe-VSCode-Extension/pull/2