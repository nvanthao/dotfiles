#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update Homebrew recipes
brew update && brew upgrade

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle
brew cleanup

# Remove and symlinks dot files
to_be_symlink=(
  ".hstr_blacklist"
  ".hstr_favorites"
  ".zshrc"
  ".vimrc"
  ".tmux.conf"
  ".alacritty.yml"
)

for i in "${to_be_symlink[@]}"; do
  echo "Symlink $HOME/$i..."
  ln -sf $(pwd)/$i $HOME/$i
done 

# Set macOS preferences
# We will run this last because this will reload the shell
# source .macos

# Update CLI tools
softwareupdate --all --install --force

echo "Done!"
