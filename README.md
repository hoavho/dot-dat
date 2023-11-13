# dotfiles and more
Hoa Ho's .dotfiles, config files, and util scripts

# References
- https://dotfiles.github.io/

# Prerequisites
- GNU `stow`
- fzf to reverse search zsh history

# Install
You will need `git` and GNU `stow`

Run stow to symlink everything or just select what you want

**Note**:
- Depends on where you clone this repo, you may have to set --dir=DIR and --target=DIR accordingly
  - --dir = stow dir = default is current dir
  - --target = default is parent of stow dir

**Example 1**
If you clone to your home `~`, you can run stow without setting --dir and --target, to it will use default dir instead, meaning --dir will be `dot-dat` dir and --target will be your home `~` dir

```
stow */ # Everything (the '/' ignores the README)
```

```
stow zsh # Just my zsh config
```

**Example 2**
If you clone to `~/workspace` dir
```
stow --dir=/Users/hoavho/workspace/dot-dat --target=/Users/hoavho zsh
stow --dir=${PWD} --target=$HOME zsh
```

# Uninstall

Unstow / uninstall a package
```
stow --target=$HOME --delete zsh
stow --target=$HOME --delete nvim
```
