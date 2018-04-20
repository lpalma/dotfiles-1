;; Bootstrap `use-package'
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-enable-at-startup nil)
(package-initialize)

(unless
  (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Custom file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq *is-a-mac* (eq system-type 'darwin))
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )

;; Load modules
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(dolist (module '(init-mysetup
                   init-general-config
                   init-appearance
                   vim-mode
                   acklike
                   auto-complete
                   haskell
                   javascript
                   init-java
                   init-groovy
                   init-python
                   init-golang
                   init-typescript
                   scala
                   syntax-check
                   file-explorer
                   helm-fw
                   git
                   init-projectmanagement
                   markdown
                   yaml
                   compile-mode
                   rest
                   vimscript
                   clipboard
                   key-helper
                   el
                   sh))
  (require module))

(defun display-startup-echo-area-message ()
  (message (format "Emacs started in %s" (emacs-init-time))))

(provide 'init)
