;; Ustawienie katalogu dla pakietów
(setq user-emacs-directory "~/.vanilla-emacs/")

;; Ustawienie katalogu dla pakietów elpa
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))



(load-theme 'deeper-blue t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; (set-frame-font "Inconsolata LGC Nerd Font-11.5" nil t)
;; (set-face-attribute 'default nil :font "Inconsolata LGC Nerd Font-11.5")
;; (set-face-attribute 'fixed-pitch nil :font "Inconsolata LGC Nerd Font-11.5")
;; (set-face-attribute 'variable-pitch nil :font "Inconsolata LGC Nerd Font-11.5")
(set-frame-font "Source Code Pro-11.5" nil t)
(set-face-attribute 'default nil :font "Source Code Pro-11.5")
(set-face-attribute 'fixed-pitch nil :font "Source Code Pro-11.5")
(set-face-attribute 'variable-pitch nil :font "Source Code Pro-11.5")

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

;;Zwiększ lub zmniejsz wcięcie
(global-set-key (kbd "C-c >") (lambda (start end) (interactive "r") (indent-rigidly start end 4)))
(global-set-key (kbd "C-c <") (lambda (start end) (interactive "r") (indent-rigidly start end -4)))

;;(defun my-set-text-mode-keyword-color ()
  ;;"Set the color of keywords in all text modes."
;;;;  (set-face-foreground 'font-lock-keyword-face "#969184"))
  ;;(set-face-foreground 'font-lock-keyword-face "red"))
;;(add-hook 'text-mode-hook 'my-set-text-mode-keyword-color)

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

;; (use-package org-modern
;;   :ensure t

;;   :config
;;     (package-initialize)
;;     (menu-bar-mode -1)
;;     (tool-bar-mode -1)
;;     (scroll-bar-mode -1)
;;     ;;x(modus-themes-load-operandi)

;;     ;; Choose some fonts
;;     ;; (set-face-attribute 'default nil :family "Iosevka")
;;     ;; (set-face-attribute 'variable-pitch nil :family "Iosevka Aile")
;;     ;; (set-face-attribute 'org-modern-symbol nil :family "Iosevka")

;;     ;; Add frame borders and window dividers
;;     (modify-all-frames-parameters
;;      '((right-divider-width . 40)
;;        (internal-border-width . 40)))
;;     (dolist (face '(window-divider
;; 		    window-divider-first-pixel
;; 		    window-divider-last-pixel))
;;       (face-spec-reset-face face)
;;       (set-face-foreground face (face-attribute 'default :background)))
;;     (set-face-background 'fringe (face-attribute 'default :background))

;;     (setq
;;      ;; Edit settings
;;      org-auto-align-tags nil
;;      org-tags-column 0
;;      org-catch-invisible-edits 'show-and-error
;;      org-special-ctrl-a/e t
;;      org-insert-heading-respect-content t

;;      ;; Org styling, hide markup etc.
;;      org-hide-emphasis-markers t
;;      org-pretty-entities t

;;      ;; Agenda styling
;;      org-agenda-tags-column 0
;;      org-agenda-block-separator ?─
;;      org-agenda-time-grid
;;      '((daily today require-timed)
;;        (800 1000 1200 1400 1600 1800 2000)
;;        " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
;;      org-agenda-current-time-string
;;      "◀── now ─────────────────────────────────────────────────")

;;     ;; Ellipsis styling
;;     (setq org-ellipsis "…")
;;     (set-face-attribute 'org-ellipsis nil :inherit 'default :box nil)
;;     ;; Option 1: Per buffer
;;     (add-hook 'org-mode-hook #'org-modern-mode)
;;     (add-hook 'org-agenda-finalize-hook #'org-modern-agenda))
    
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
      (setq org-superstar-headline-bullets-list '("" "" "" "")) )

(use-package org
  :ensure t
  :config
  (setq org-hide-emphasis-markers t))

    



