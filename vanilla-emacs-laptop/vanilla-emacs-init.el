;; Ustawienie katalogu dla pakietów
(setq user-emacs-directory "~/.vanilla-emacs/")

;; Ustawienie katalogu dla pakietów elpa
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))



(load-theme 'wombat t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-font "Inconsolata LGC Nerd Font-10.5" nil t)
(set-face-attribute 'default nil :font "Inconsolata LGC Nerd Font-10.5")
(set-face-attribute 'fixed-pitch nil :font "Inconsolata LGC Nerd Font-10")
(set-face-attribute 'variable-pitch nil :font "Inconsolata LGC Nerd Font-10.5")

;; Inicjalizacja pakietów
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; package-refresh-contents

(use-package markdown-mode
  :ensure t
  :config
    (autoload 'markdown-mode "markdown-mode"
      "Major mode for editing Markdown files" t)
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.mkd\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.mdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.mkdn\\'" . markdown-mode))
    :hook
         ((markdown-mode . flyspell-mode)
          (markdown-mode . visual-line-mode))
)

(use-package flycheck
  :ensure t
  :hook (after-init . global-flycheck-mode)
)

(use-package dot-mode
  :ensure t
  :hook (find-file . dot-mode-on)
  :bind
      ("C-." . dot-mode-execute)
      ("C-M-." . dot-mode-override))
