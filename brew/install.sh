#!/bin/bash

# Ensure Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed. Updating Homebrew..."
  brew update
fi

# Install Scala and Coursier
echo "Installing Scala and Coursier..."
brew install scala
brew install coursier/formulas/coursier

# Install OpenJDK
echo "Installing OpenJDK..."
brew install openjdk

# Install pyenv and the latest Python version
echo "Installing pyenv and the latest Python version..."
brew install pyenv
pyenv install $(pyenv install --list | grep -v - | grep -v b | tail -1)
pyenv global $(pyenv versions --bare)

# Install nodenv and the latest stable Node version
echo "Installing nodenv and the latest stable Node version..."
brew install nodenv
nodenv install $(nodenv install -l | grep -v - | grep -v b | tail -1)
nodenv global $(nodenv versions --bare)

# Install rbenv and the latest Ruby version
echo "Installing rbenv and the latest Ruby version..."
brew install rbenv
rbenv install $(rbenv install -l | grep -v - | grep -v b | tail -1)
rbenv global $(rbenv versions --bare)

# Install Rust
echo "Installing Rust..."
brew install rust

# Install Go
echo "Installing Go..."
brew install go

# Install Clojure
echo "Installing Clojure..."
brew install clojure/tools/clojure

# Install dependencies for C++
echo "Installing dependencies for C++..."
brew install gcc

echo "All requested installations are complete."

# Add initialization for pyenv, nodenv, and rbenv to shell startup file
shell_startup_file="$HOME/.bash_profile"
if [[ -f "$HOME/.zshrc" ]]; then
  shell_startup_file="$HOME/.zshrc"
elif [[ -f "$HOME/.bashrc" ]]; then
  shell_startup_file="$HOME/.bashrc"
fi

# Initialize pyenv
if ! grep -q 'pyenv init' "$shell_startup_file"; then
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >>"$shell_startup_file"
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >>"$shell_startup_file"
  echo 'if command -v pyenv 1>/dev/null 2>&1; then' >>"$shell_startup_file"
  echo '  eval "$(pyenv init --path)"' >>"$shell_startup_file"
  echo 'fi' >>"$shell_startup_file"
fi

# Initialize nodenv
if ! grep -q 'nodenv init' "$shell_startup_file"; then
  echo 'export NODENV_ROOT="$HOME/.nodenv"' >>"$shell_startup_file"
  echo 'export PATH="$NODENV_ROOT/bin:$PATH"' >>"$shell_startup_file"
  echo 'if command -v nodenv 1>/dev/null 2>&1; then' >>"$shell_startup_file"
  echo '  eval "$(nodenv init --path)"' >>"$shell_startup_file"
  echo 'fi' >>"$shell_startup_file"
fi

# Initialize rbenv
if ! grep -q 'rbenv init' "$shell_startup_file"; then
  echo 'export RBENV_ROOT="$HOME/.rbenv"' >>"$shell_startup_file"
  echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >>"$shell_startup_file"
  echo 'if command -v rbenv 1>/dev/null 2>&1; then' >>"$shell_startup_file"
  echo '  eval "$(rbenv init --path)"' >>"$shell_startup_file"
  echo 'fi' >>"$shell_startup_file"
fi

echo "Initialization for pyenv, nodenv, and rbenv added to $shell_startup_file."

echo "Script execution complete. Please restart your terminal or source your shell startup file to apply changes."