#!/bin/bash

# =================================================================
# OpenCode TUI Installer for Acode (Alpine Linux)
# =================================================================

echo "🚀 Starting OpenCode TUI setup..."

# 1. Update system and install dependencies
echo "📦 Installing system dependencies..."
apk update
apk add curl bash nodejs npm libc6-compat git

# 2. Clean up any previous broken installations
echo "🧹 Cleaning old paths..."
npm uninstall -g opencode-ai 2>/dev/null
rm -f /usr/local/bin/opencode
mkdir -p ~/.local/share/opencode/bin

# 3. Run official OpenCode installer
echo "📥 Downloading and installing OpenCode..."
curl -fsSL https://opencode.ai/install | bash

# 4. Configure Environment Path
echo "⚙️ Configuring PATH..."
PATH_LINE='export PATH=$HOME/.opencode/bin:$PATH'

# Check if the path is already in .bashrc to avoid duplicates
if ! grep -q ".opencode/bin" ~/.bashrc; then
    echo "$PATH_LINE" >> ~/.bashrc
    echo "✅ Path added to .bashrc"
else
    echo "ℹ️ Path already exists in .bashrc"
fi

# 5. Finalize
hash -r
export PATH=$HOME/.opencode/bin:$PATH

echo "----------------------------------------------------"
echo "🎉 Setup Complete!"
echo "👉 Run 'opencode' to start."
echo "----------------------------------------------------"