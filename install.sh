#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle
brew cleanup

# Remove and symlinks dot files to $HOME
to_be_symlink=(
  ".hstr_blacklist"
  ".hstr_favorites"
  ".zshrc"
  ".vimrc"
  ".tmux.conf"
  ".alacritty.yml"
  ".yabairc"
  ".skhdrc"
)

for i in "${to_be_symlink[@]}"; do
  echo "Symlink $HOME/$i..."
  ln -sf $(pwd)/$i $HOME/$i
done 

# Update CLI tools
# softwareupdate --all --install --force

echo "Done!"
