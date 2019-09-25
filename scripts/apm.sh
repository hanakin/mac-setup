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

require_apm Sublime-Style-Column-Selection
require_apm atom-alignment
require_apm atom-css-unit-converter
require_apm atom-discord
require_apm atom-easy-jsdoc
require_apm atom-silverstripe
require_apm atom-material-syntax
require_apm atom-material-ui
require_apm atom-twig
require_apm auto-indent
require_apm autoclose-html
require_apm autocomplete-jsdoc
require_apm browser-plus
require_apm busy-signal
require_apm color-picker
require_apm editorconfig
require_apm emmet
require_apm highlight-selected
require_apm intentions
require_apm language-jade
require_apm language-markdown
require_apm language-sphinx
require_apm language-twig
require_apm language-vue
require_apm linter
require_apm linter-jsonlint
require_apm linter-php
require_apm linter-stylelint
require_apm linter-ui-default
require_apm linter-xo
require_apm markdown-document
require_apm markdown-folding
require_apm markdown-preview-plus
require_apm markdown-writer
require_apm minimap
require_apm minimap-highlight-selected
require_apm minimap-pigments
require_apm multi-cursor
require_apm multi-cursor-plus
require_apm pandoc
require_apm php-twig
require_apm pigments
require_apm postcss-sorting
require_apm rst-preview-pandoc
require_apm rst-snippets
require_apm seti-icons
require_apm sphinx-preview
require_apm seti-ui
require_apm stylefmt
require_apm toggle-markdown-task
require_apm tool-bar
require_apm tool-bar-markdown-writer

ok "all packages instlled!"
