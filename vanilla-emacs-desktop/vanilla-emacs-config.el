;; Ustawienie katalogu dla pakietów
(setq user-emacs-directory "~/.vanilla-emacs/")

;; Ustawienie katalogu dla pakietów elpa
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))


;;(load-theme 'modus-vivendi t)
(load-theme 'misterioso t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-font "Inconsolata LGC Nerd Font-9.5" nil t)
(set-face-attribute 'default nil :font "Inconsolata LGC Nerd Font-9.5")
(set-face-attribute 'fixed-pitch nil :font "Inconsolata LGC Nerd Font-9.5")
(set-face-attribute 'variable-pitch nil :font "Inconsolata LGC Nerd Font-9.5")

;; Ustaw hunspell jako domyślny program sprawdzania pisowni
(setq ispell-program-name "hunspell")
;; Dodaj polski i angielski słownik
(setq ispell-local-dictionary-alist
      '(("pl_en"
         "[[:alpha:]]"
         "[^[:alpha:]]"
         "[']"
         nil
         ("-d" "pl_PL,en_US")
         nil
         utf-8)))
;; Ustaw jako domyślny słownik dla buforów
(setq ispell-dictionary "pl_en")
;; Ustaw hunspell, aby używał wielu słowników
(setq ispell-hunspell-dict-paths-alist
      '(("pl_en" "/usr/share/hunspell/pl_PL.aff"
         "/usr/share/hunspell/en_US.aff")))
;; Włącz Flyspell dla tekstów
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(defun create-line-below ()
  "Tworzy pustą linię poniżej kursora"
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))
(global-set-key (kbd "M-o") 'create-line-below)

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

(use-package which-key
  :ensure t
  :config
      (which-key-mode)
)

(use-package org-superstar
  :ensure t
  :config
      (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
      ;; This is usually the default, but keep in mind it must be nil
      (setq org-hide-leading-stars nil)
      ;; This line is necessary.
      (setq org-superstar-leading-bullet ?\s)
      ;; If you use Org Indent you also need to add this, otherwise the
      ;; above has no effect while Indent is enabled.
      (setq org-indent-mode-turns-on-hiding-stars nil)
      (setq org-superstar-headline-bullets-list '("🞊" "🞚" "○" "🞍")))
