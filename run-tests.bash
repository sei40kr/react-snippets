#!/usr/bin/env bash

set -euo pipefail

init="(progn
  (require 'package)
  (push '(\"melpa\" . \"https://melpa.org/packages/\") package-archives)
  (package-initialize)
  (package-refresh-contents))"

# Check using package-lint
emacs -Q --batch \
      --eval "$init" \
      --eval "(progn
(unless (package-installed-p 'package-lint)
  (package-install 'package-lint))
(require 'package-lint)
(package-lint-batch-and-exit))" \
      react-snippets.el

# Test the byte-compile exits successfully
emacs -Q --batch \
      --eval "$init" \
      --eval "(progn
(unless (package-installed-p 'f)
  (package-install 'f))
(unless (package-installed-p 'json)
  (package-install 'json))
(unless (package-installed-p 's)
  (package-install 's))
(setq byte-compile-error-on-warn t)
(batch-byte-compile))" \
      react-snippets.el
