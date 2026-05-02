# OpenCode TUI Installer for Alpine Linux

A bash script to easily install [OpenCode AI](https://opencode.ai) on Alpine Linux systems (like Acode).

## Features

- One-command installation for Alpine Linux
- Automatically installs all required dependencies (curl, nodejs, npm, git)
- Handles PATH configuration for bash
- Cleans up previous broken installations before fresh install

## Prerequisites

- Alpine Linux (Akode/DroidPorts)
- Root or sudo access

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/opencode-alpine-installer/main/opencode.sh -o opencode.sh
chmod +x opencode.sh
./opencode.sh
```

Or simply run:

```bash
./opencode.sh
```

The script will:
1. Update apk package index
2. Install dependencies (curl, bash, nodejs, npm, libc6-compat, git)
3. Clean any previous broken OpenCode installations
4. Download and run the official OpenCode installer
5. Configure your PATH in `~/.bashrc`

## Usage

After installation, restart your terminal or run:

```bash
source ~/.bashrc
opencode
```

## Uninstall

To remove OpenCode:

```bash
npm uninstall -g opencode-ai
rm -rf ~/.opencode
```

## License

MIT