# dotfiles

My macOS development setup, managed with [GNU Stow](https://www.gnu.org/software/stow/). Kitty + tmux + zsh.

## What's included

| Package | Config |
|---------|--------|
| kitty | `~/.config/kitty/kitty.conf` |
| tmux | `~/.tmux.conf` |
| zsh | `~/.zshrc` |
| git | `~/.gitconfig` |
| vim | `~/.vimrc` |
| mise | `~/.config/mise/config.toml` |
| claude | `~/.claude/{CLAUDE.md,settings.json,skills/,plugins/installed_plugins.json}` |

## Install

```
git clone <repo-url>
cd dotfiles
./install.sh
```

This installs brew packages, kitty, tmux, oh-my-zsh + plugins, TPM, mise tools, and symlinks all configs.
