## dotfiles

---

## TODO

- [ ] .zshrc + sources ./aliases (alias to print all aliases)
- [ ] .zprofile
- [ ] .gitconfig
- [ ] .gitignore + global one?
- [ ] .macos https://macos-defaults.com/
- [ ] brew.sh
- [ ] symlink script
- [ ] .extra for private git credentials linked to ./gitconfig
- [ ] 1Password ssh config? .ssh/config ``git config --global gpg.ssh.allowedSignersFile ~/.config/git/allowed_signers``?
  - maybe .gitallowedsigners file? or organize all git stuff in dotfiles/git/allowed_signers
- [ ] .claude / general AGENT.md symlink stuff?
- [ ] Warp config

Maybe change structure to:
```aiignore
dotfiles/
  zsh/
    .zshrc
    .zprofile
    .aliases
    .functions
  git/
    .gitconfig
    allowed_signers
  ssh/
    config
```