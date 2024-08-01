;; Ustawienie katalogu dla pakietów
(setq user-emacs-directory "~/.vanilla-emacs/")

;; Ustawienie katalogu dla pakietów elpa
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))


;;(load-theme 'deeper-blue t)
;;(setq inhibit-startup-message t)
;(load-theme 'misterioso t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)

(setq visible-bell t)

;;numbers
(column-number-mode)
(global-display-line-numbers-mode t)
;; Set frame transparency
;; (set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
;; (add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))
;; (set-frame-parameter (selected-frame) 'fullscreen 'maximized)
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

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

;;Zwiększ lub zmniejsz wcięcie
(global-set-key (kbd "C->") (lambda (start end) (interactive "r") (indent-rigidly start end 4)))
(global-set-key (kbd "C-<") (lambda (start end) (interactive "r") (indent-rigidly start end -4)))

;; Inicjalizacja pakietów
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; package-refresh-contents

(eval-when-compile
  (require 'use-package))

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
      ;;(setq org-superstar-headline-bullets-list '("🞊" "🞚" "○" "🞍")))
      (setq org-superstar-headline-bullets-list '(" " " " "" "")) )

(use-package org
  :ensure t
  :config
  (setq org-hide-emphasis-markers t))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "C-l") 'ivy-alt-done)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibufferst t)
)

(use-package counsel
  :ensure t
  :after ivy
  :config  (counsel-mode 1)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c j" . counsel-git-grep)
         ("C-c k" . counsel-ag)
         ("C-c g" . counsel-git)
         ("C-c l" . counsel-locate)
         ;;("C-S-o" . counsel-rhythmbox)
	 )
)

(use-package swiper
  :ensure t
  :after ivy
  :bind (("C-s" . swiper)))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)) 

;; dokumentacja w minibuffer w momencie M-x
(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))

(use-package helpful
  :ensure t
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;;(load-theme 'doom-tokyo-night t)
  (load-theme 'doom-Iosvkem t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;;(doom-themes-neotree-config)
  ;; or for treemacs users
  ;;(setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  ;;(doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(require 'doom-modeline)
(doom-modeline-mode)
