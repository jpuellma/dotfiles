if is_darwin; then
  SHELL=/usr/local/bin/bash
  export SHELL
  defaults delete -g ApplePressAndHoldEnabled          # If necessary, reset global default
  defaults write com.apple.dock no-bouncing -bool TRUE # Dock icon bouncing is annoying af.
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false            # For VS Code
  defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false    # For VS Code Insider
  defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false       # For VS Codium
  defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false # For VS Codium Exploration users
fi
 
