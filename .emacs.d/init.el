
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(package-selected-packages (quote (evil))))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )

(require 'evil)
(evil-mode 1)

(require 'org)
(require 'org-latex)
(add-to-list 'org-latex-packages-alist '("" "tabularx"))
(setq org-export-latex-listings 'minted)
(setq org-export-latex-packages-alist '("" "minted"))
(setq org-src-fontify-natively t)
