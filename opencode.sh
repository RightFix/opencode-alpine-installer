#!/bin/bash

set -euo pipefail

echo "🚀 Starting OpenCode TUI setup..."

main() {
    echo "📦 Installing system dependencies..."
    apk update || { echo "❌ Failed to update package index" >&2; return 1; }
    apk add curl bash nodejs npm libc6-compat git || { echo "❌ Failed to install dependencies" >&2; return 1; }

    echo "🧹 Cleaning old paths..."
    npm uninstall -g opencode-ai 2>/dev/null || true
    rm -f /usr/local/bin/opencode
    mkdir -p ~/.local/share/opencode/bin

    echo "📥 Downloading and installing OpenCode..."
    curl -fsSL https://opencode.ai/install | bash || { echo "❌ OpenCode installation failed" >&2; return 1; }

    echo "⚙️ Configuring PATH..."
    local path_line='export PATH=$HOME/.opencode/bin:$PATH'
    
    if [[ -f ~/.bashrc ]] && grep -q ".opencode/bin" ~/.bashrc; then
        echo "ℹ️ Path already exists in .bashrc"
    else
        echo "$path_line" >> ~/.bashrc
        echo "✅ Path added to .bashrc"
    fi

    hash -r 2>/dev/null || true

    echo "----------------------------------------------------"
    echo "🎉 Setup Complete!"
    echo "👉 Run 'opencode' to start."
    echo "----------------------------------------------------"
}

main "$@"
