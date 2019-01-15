(use-package
  purescript-mode
  :diminish purescript-indentation-mode
  :mode "\\.purs\\'"
  :ensure t
  :defer t
  :config
  (add-hook 'purescript-mode-hook
            (lambda ()
              (psc-ide-mode)
              (company-mode)
              (flycheck-mode)
              (turn-on-purescript-indentation)))
  (add-hook 'purescript-mode-hook 'programming-mode))

;(use-package psc-ide
;  :diminish psc-ide-mode
;  :ensure t
;  :defer t
;  :config
;  (setq psc-ide-use-npm-bin t)
;  (setq psc-ide-output-directory "build/")
;  (setq browse-url-browser-function 'eww-browse-url)
;  (customize-set-variable 'psc-ide-rebuild-on-save t))
;
;(use-package psci :ensure t :defer t)
;(use-package flycheck-purescript :ensure t :defer t)

(provide 'init-purescript)
