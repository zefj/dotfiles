#!/bin/bash
set -e

echo "==> Installing Homebrew (if needed)"
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> Installing brew formulae"
brew install git-absorb stow tmux mise

echo "==> Installing brew casks"
brew install --cask kitty font-jetbrains-mono-nerd-font visual-studio-code

echo "==> Installing mise tools"
mise install

echo "==> Installing Oh My Zsh (if needed)"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "==> Installing zsh plugins"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
[ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] || git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
[ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

echo "==> Installing TPM (tmux plugin manager)"
[ -d "$HOME/.tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

echo "==> Stowing dotfiles"
DOTFILES="$(cd "$(dirname "$0")" && pwd)"
packages=(kitty tmux zsh git vim mise claude)
for pkg in "${packages[@]}"; do
  echo "    Stowing $pkg"
  stow -t ~ -d "$DOTFILES" --adopt "$pkg"
done
git checkout -- .

echo "==> Installing tmux plugins"
"$HOME/.tmux/plugins/tpm/bin/install_plugins"

echo "==> Done! Open a new shell to pick up changes."
