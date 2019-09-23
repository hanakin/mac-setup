#!/usr/bin/env bash


source ./scripts/lib.sh

bot "Lets install some nessecary atom packages"

running "checking atom is installed"
# Install if we don't have it
if test ! $(which atom); then
  running "Installing atom..."
  require_brew atom
  require_brew atom-beta
fi

running "Installing atom packages"

require_apm Sublime-Style-Column-Selection@1.7.4
require_apm atom-alignment@0.13.0
require_apm atom-css-unit-converter@1.1.1
require_apm atom-material-syntax@1.0.8
require_apm atom-material-ui@2.1.3
require_apm atom-twig@4.2.0
require_apm auto-indent@0.5.0
require_apm autoclose-html@0.23.0
require_apm busy-signal@1.4.3
require_apm color-picker@2.3.0
require_apm editorconfig@2.2.2
require_apm emmet@2.4.3
require_apm highlight-selected@0.14.0
require_apm intentions@1.1.5
require_apm language-jade@0.7.3
require_apm language-markdown@0.26.0
require_apm language-twig@1.6.3
require_apm language-vue@0.23.1
require_apm linter@2.2.0
require_apm linter-php@1.5.1
require_apm linter-stylelint@4.3.2
require_apm linter-ui-default@1.7.1
require_apm linter-xo@0.26.0
require_apm markdown-document@0.2.1
require_apm markdown-folding@0.3.1
require_apm markdown-preview-enhanced@0.15.6
require_apm markdown-preview-plus@3.6.3
require_apm markdown-writer@2.9.0
require_apm minimap@4.29.8
require_apm minimap-highlight-selected@4.6.1
require_apm minimap-pigments@0.2.2
require_apm multi-cursor@2.1.5
require_apm multi-cursor-plus@1.2.0
require_apm pandoc@0.2.2
require_apm php-twig
require_apm pigments@0.40.2
require_apm postcss-sorting@2.10.0
require_apm seti-icons@1.5.4
require_apm seti-ui@1.11.0
require_apm stylefmt@5.0.1
require_apm toggle-markdown-task@0.6.0
require_apm tool-bar@1.1.10
require_apm tool-bar-markdown-writer@0.4.0

ok "all packages instlled!"
