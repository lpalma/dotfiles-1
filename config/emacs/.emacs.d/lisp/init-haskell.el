(require 'init-programming-mode)

(defun haskell/prettify ()
  (prettify
    '(
      ("forall" . ?∀)
      ("exists" . ?∃)

      ("->" . ?→)
      ("<-" . ?←)
      ("=>" . ?⇒)

      ("|->" . ?↦)
      ("<-|" . ?↤)

      ("~>" . ?⇝)
      ("<~" . ?⇜)

      (">->" . ?↣)
      ("<-<" . ?↢)

      ("not" . ?¬)
      ("&&" . ?∧)
      ("||" . ?∨)

      ("==" . ?≡)
      ("/=" . ?≠)
      ("<=" . ?≤)
      (">=" . ?≥)

      ("elem" . ?∈)
      ("notElem" . ?∉)
      ("member" . ?∈)
      ("notMember" . ?∉)
      ("union" . ?∪)
      ("intersection" . ?∩)
      ("isSubsetOf" . ?⊆)
      ("isProperSubsetOf" . ?⊂)

      ("<<" . ?≪)
      (">>" . ?≫)
      ("undefined" . ?⊥)
      ("\\" . ?λ))))

(use-package
  haskell-mode
  :ensure t
  :mode "\\.hs$"
  :defer t
  :config

  (use-package company-ghci :ensure t)
  (use-package lsp-mode :ensure t)
  (use-package lsp-haskell :ensure t)
  (use-package lsp-ui :ensure t)

  (custom-set-variables '(haskell-stylish-on-save t))
  (set-compile-for 'haskell-mode-hook "stack test")
  (set-company-backend-for 'haskell-mode-hook 'company-ghci)

  (add-hook 'haskell-mode-hook 'programming-mode)
  (add-hook 'haskell-mode-hook 'haskell/prettify)
  (add-hook 'haskell-mode-hook 'hs-doc)
  (add-hook 'haskell-mode-hook 'lsp-ui-mode)
  (add-hook 'haskell-mode-hook #'lsp-haskell-enable))

(defun hs-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Haskell")))

(provide 'init-haskell)
