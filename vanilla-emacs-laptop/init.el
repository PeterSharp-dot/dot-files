(setq user-emacs-directory "~/.vanilla-emacs/")

(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(setq package-native-compile t)
(native-compile-async "~/.vanilla-emacs/elpa/" 'recursively)

;;(load-theme 'deeper-blue t)
;;(setq inhibit-startup-message t)
;;(load-theme 'misterioso t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(setq visible-bell t)

(column-number-mode)
(global-display-line-numbers-mode t)
;; Set frame transparency
;; (set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
;; (add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))
;; (set-frame-parameter (selected-frame) 'fullscreen 'maximized)
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                elfeed-search-mode-hook
                elfeed-show-mode-hook
                eww-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(electric-pair-mode 1)

(save-place-mode 1)

;; (set-frame-font "Inconsolata LGC Nerd Font-15.5:spacing=50" nil t) 
 ;; (set-face-attribute 'default nil :font "Inconsolata LGC Nerd Font-15.5:spacing=50")
 ;; (set-face-attribute 'fixed-pitch nil :font "Inconsolata LGC Nerd Font-15.5:spacing=50")
 ;; (set-face-attribute 'variable-pitch nil :font "Inconsolata LGC Nerd Font-15.5:spacing=50")
 ;; (set-frame-font "JetBrains Mono Nerd Font-16" nil t) 
 ;; (set-face-attribute 'default nil :font "JetBrains Mono Nerd Font-16")
 ;; (set-face-attribute 'fixed-pitch nil :font "JetBrains Mono Nerd Font-16")
 ;; (set-face-attribute 'variable-pitch nil :font "JetBrains Mono Nerd Font-16")
(set-frame-font "EnvyCodeR Nerd Font Mono-18" nil t) 
(set-face-attribute 'default nil :font "EnvyCodeR Nerd Font Mono-18")
(set-face-attribute 'fixed-pitch nil :font "EnvyCodeR Nerd Font Mono-18")
(set-face-attribute 'variable-pitch nil :font "EnvyCodeR Nerd Font Mono-18")

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
;;(add-hook 'text-mode-hook 'flyspell-mode)
;;(add-hook 'prog-mode-hook 'flyspell-prog-mode)

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
    ;;(setq org-superstar-headline-bullets-list '(" " " " "" "")) )
    ;;(setq org-superstar-headline-bullets-list '(" " " " "" "")) )
    (setq org-superstar-headline-bullets-list '("󰐾" "" "○" "" "")) )
(setq org-hide-emphasis-markers t)

(custom-set-faces
'(org-level-1 ((t (:inherit default :weight bold :height 2.0 :family "JetBrains Mono" :foreground "#eeeeee"))))
'(org-level-2 ((t (:inherit default :weight bold :height 1.1 :family "JetBrains Mono" :foreground "#aaaaaa"))))
'(org-level-3 ((t (:inherit default :weight bold :height 1.0 :family "JetBrains Mono" :foreground "#aaaaaa"))))
'(org-level-4 ((t (:inherit default :weight bold :height 0.9 :family "JetBrains Mono" :foreground "#aaaaaa"))))
'(org-level-5 ((t (:inherit default :weight normal :slant italic :height 1.0 :family "JetBrains Mono" :foreground "#888888"))))
'(org-level-6 ((t (:inherit default :weight bold :height 1.0 :family "JetBrains Mono"))))
'(org-level-7 ((t (:inherit default :weight bold :height 1.0 :family "JetBrains Mono"))))
'(org-level-8 ((t (:inherit default :weight bold :height 1.0 :family "JetBrains Mono")))))

;; Tworzymy nową twarz dla cyfr
(defface my/org-number-face
  '((t (:foreground "#606060")))
  "Face for numbers in Org mode.")

;; Funkcja dodająca wyróżnianie cyfr w org-mode
(defun my/org-highlight-numbers ()
  "Highlight numbers in Org mode using a custom face."
  (font-lock-add-keywords
   nil
   '(("\\b[0-9]+\\b" . 'my/org-number-face))))

;; Dodajemy funkcję do hooka org-mode
(add-hook 'org-mode-hook 'my/org-highlight-numbers)

;; Twarz dla wybranych skrótów biblijnych, np. Ge, Eze
(defface my/org-bible-keyword-face
  '((t (:foreground "#698c73")))
  "Face for selected Bible keywords in Org mode.")

;; Funkcja dodająca wyróżnianie słów Ge i Eze w org-mode
(defun my/org-highlight-bible-keywords ()
  "Highlight selected Bible keywords in Org mode using a custom face."
  (font-lock-add-keywords
   nil
   '(("\\b\\(Ge\\|Je\\|Ex\\|Le\\|Nu\\|Dt\\|Jos\\|Jdg\\|Sa\\|Ki\\|Ch\\|Ezr\\|Ne\\|Es\\|Job\\|Ps\\|Pr\\|Ec\\|SoS\\|Da\\|Ho\\|Isa\\|Eze\\|Am\\|Mic\\|Jon|Na\\|Hab\\|Zep\\|Hag\\|Zec\\|Mal\\)\\b" . 'my/org-bible-keyword-face))))

;; Dodanie do hooka org-mode
(add-hook 'org-mode-hook 'my/org-highlight-bible-keywords)

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
;;  (global-set-key (kbd "C-l") 'ivy-alt-done)
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

;;  (use-package swiper
;;  :ensure t
;;  :after ivy
;;  :bind (("C-s" . swiper)))

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
  ;;  (load-theme 'doom-bluloco-dark t)
  (load-theme 'doom-city-lights t)
  ;;(load-theme 'doom-solarized-dark t)
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

;;M-x all-the-icons-install-fonts
(use-package all-the-icons
:if (display-graphic-p))
;; (use-package all-the-icons
;;   :demand t
;;   :ensure t)
;; (require 'all-the-icons)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
;;(require 'all-the-icons)
  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-set-file-icons t)
  (require 'dashboard)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-heading-icons '((recents   . "history")
                              (bookmarks . "bookmark")
                              (agenda    . "calendar")
                              (projects  . "rocket")
                              (registers . "database")))
    ; Set the title
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
    ;; Set the banner
  (setq dashboard-startup-banner 'logo)
    ;; Value can be:
    ;;  - 'official which displays the official emacs logo.
    ;;  - 'logo which displays an alternative emacs logo.
    ;;  - an integer which displays one of the text banners
    ;;    (see dashboard-banners-directory files).
    ;;  - a string that specifies a path for a custom banner
    ;;    currently supported types are gif/image/text/xbm.
    ;;  - a cons of 2 strings which specifies the path of an image to use
    ;;    and other path of a text file to use if image isn't supported.
    ;;    ("path/to/image/file/image.png" . "path/to/text/file/text.txt").
    ;;  - a list that can display an random banner,
    ;;    supported values are: string (filepath), 'official, 'logo and integers.

    ;; Content is not centered by default. To center, set
    (setq dashboard-center-content t)
    ;; vertically center content
    (setq dashboard-vertically-center-content t)

    ;; To disable shortcut "jump" indicators for each section, set
    ;;(setq dashboard-show-shortcuts nil)
    (setq dashboard-items '((recents   . 5)
			      (bookmarks . 5)
			      (projects  . 5)
			      (agenda    . 5)
			      (registers . 5)))
    (setq dashboard-startupify-list '(dashboard-insert-banner
					dashboard-insert-newline
					dashboard-insert-banner-title
					dashboard-insert-newline
					dashboard-insert-navigator
					dashboard-insert-newline
					dashboard-insert-init-info
					dashboard-insert-items
					dashboard-insert-newline
					dashboard-insert-footer))
    (setq dashboard-navigation-cycle t)
(dashboard-open)

(use-package company
  :ensure t
  :config
  ;; (add-hook 'after-init-hook 'global-company-mode)
  ;; :hook (after-init . global-company-mode)
  )
(global-company-mode 1)
(global-set-key (kbd "M-/") 'company-complete)

(use-package company-files
:ensure nil
:config
;; Dodaj company-files do listy backendów
(add-to-list 'company-backends 'company-files))

(use-package company-dabbrev
  :ensure nil
  :config
  ;; Dodaj company-dabbrev do listy backendów
(add-to-list 'company-backends 'company-dabbrev))

;; Konfiguracja company-mode
(setq company-idle-delay 0.2) ;; Czas oczekiwania na wyświetlenie podpowiedzi
(setq company-minimum-prefix-length 1) ;; Minimalna długość prefiksu do aktywacji autouzupełniania

(defun my-eww-visual-fill ()
      	  "Ustaw zawijanie tekstu w EWW do 80 znaków szerokości i centrowanie."
      (setq visual-fill-column-width 80
      	    visual-fill-column-center-text t)
      (visual-fill-column-mode 1)
      (visual-line-mode 1))
      (add-hook 'eww-after-render-hook #'my-eww-visual-fill)

      ;(defun my-eww-set-left-margin ()
       ; (setq left-margin-width 4)  ;; ustaw margines na 4 znaki (lub inna wartość)
        ;(set-window-buffer nil (current-buffer))) ;; przerysuj bufor z nowym marginesem
      ;(add-hook 'eww-after-render-hook 'my-eww-set-left-margin)

      (defun my-eww-remove-horizontal-rules ()
          "Usuń przerywane linie z bieżącego bufora EWW."
      	  (save-excursion
      	    (goto-char (point-min))
      	    (while (re-search-forward "^-\\{30,\\}$" nil t)
      	      (replace-match ""))))
      (add-hook 'eww-after-render-hook #'my-eww-remove-horizontal-rules)

      (defun my-eww-remove-facebook-buttons ()
  "Usuń przyciski Facebooka i inne SVG-ikony społecznościowe po renderowaniu w EWW."
  (save-excursion
    (goto-char (point-min))
    ;; Usuń linie z dużymi SVG
    (while (re-search-forward "<button[^>]*\\(w3\\|iconButton\\)[^>]*>.*?</button>" nil t)
      (replace-match ""))))

(add-hook 'eww-after-render-hook #'my-eww-remove-facebook-buttons)

(global-set-key (kbd "C-x w") 'elfeed)
(setq elfeed-search-title-max-width 140)  

(setq elfeed-feeds '(("http://nullprogram.com/feed/" emacs)
      ("https://planet.emacslife.com/atom.xml" emacs)
      ("https://www.archlinux.org/feeds/news/" arch)
      ("https://www.linuxjournal.com/node/feed" linux)
      ("http://www.dobreprogramy.pl/rss/rss_news.xml" it)
      ("https://geekweek.interia.pl/feed" it)
      ("https://wydarzenia.interia.pl/nauka/feed" news)
      ("https://www.computerworld.pl/news?rss" it)
      ("https://antyweb.pl/feed" it)
      ("https://itsfoss.com/feed" it linux)
      ("https://linux.com/feed" linux)
      ("https://lnwn.net/headlines/newrss" linux)
      ("https://www.kalilinux.in/feeds/posts/default" linux cyber)
      ("http://feeds.feedburner.com/wPolitycepl" news wpolityce)
      ("https://www.wykop.pl/rss/" news wykop)
      ("https://www.wp.pl/rss/" news wp)
      ("https://www.tvn24.pl/najnowsze.xml" news tvn)
      ("https://wydarzenia.interia.pl/feed" interia news)
      ("https://www.polsatnews.pl/rss/wszystkie.xml" news polsat)
      ("https://spidersweb.pl/api/post/feed/feed-gn" it spidersweb)
      ("http://wiadomosci.onet.pl/.feed" news onet)))

(setq browse-url-browser-function 'eww-browse-url)
;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "qutebrowser")
(global-set-key (kbd "C-c u") 'browse-url-at-point)
(global-set-key (kbd "C-c e") 'qutebrowser)

;; (use-package elfeed-goodies
;;   :ensure t
;;   )
;; (require 'elfeed)
;; (require 'elfeed-goodies)
;; (elfeed-goodies/setup)
;; (setq elfeed-goodies/entry-pane-size 0.5)

;;   :init
;;   (elfeed-goodies/setup)
;;   :config
;;   (setq elfeed-goodies/entry-pane-size 0.5))
;;You can customise some aspects of the package with M-x customize-group elfeed-goodies.

;; ;; Definicja nowego trybu major dla plików .leb
;; (define-derived-mode leb-mode fundamental-mode "LEB"
;;   "Major mode for editing LEB files.")

;; ;; Dodanie asocjacji rozszerzenia .leb z trybem leb-mode
;; (add-to-list 'auto-mode-alist '("\\.leb\\'" . leb-mode))

;; ;; Definiowanie własnej twarzy z kolorem #222222
;; (defface leb-mode-custom-face
;;   '((t (:foreground "#555555")))
;;   "Custom face for text between < and > in leb-mode.")

;; ;; Funkcja ustawień specjalnych dla trybu leb-mode
;; (defun my-leb-mode-setup ()
;;   ;; Przykład: ustawienie szerokości wcięcia na 4 spacje
;;   (setq tab-width 4)
;;   (setq indent-tabs-mode nil)
  
;;   ;; Kolorowanie cyfr
;;   (font-lock-add-keywords nil
;;     '(("\\b[0-9]+\\b" . font-lock-constant-face)))

;;    ;; Kolorowanie tekstu między '<' i '>'
;;   (font-lock-add-keywords nil
;;     `((,(rx "<" (group (0+ (not (any ">")))) ">") 0 'leb-mode-custom-face prepend)))
;;   )
;; ;; Dodanie funkcji ustawień do hooka trybu leb-mode
;; (add-hook 'leb-mode-hook 'my-leb-mode-setup)

(use-package avy
  :ensure t)
(global-set-key (kbd "C-\"") 'avy-goto-char-2)
(global-set-key (kbd "C-c s") 'avy-goto-char-2)

;; (use-package python-mode
;;   :ensure nil
;;   ;hook (python-mode . lap-deferred)
;;   :custom
;;   (python-shell-interpreter "python3"))

(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
             '("org-plain-latex"
               "\\documentclass{article}
           [NO-DEFAULT-PACKAGES]
           [PACKAGES]
           [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(use-package zen-mode
   :ensure t          )

(use-package yasnippet
  :ensure t
  :config
    (yas-global-mode 1)    
  )

(use-package yasnippet-snippets
  :ensure t )

(global-set-key (kbd "C-c f") 'find-file-at-point)

(use-package darkroom
     :ensure t)

;; Ustawienie maksymalnej szerokości linii na 80 znaków
(setq-default fill-column 80)
;; Włączenie auto-fill-mode dla tekstu
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; Włączenie auto-fill-mode dla org-mode
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(global-set-key (kbd "M-p") 'pop-global-mark)
;; (global-set-key (kbd "M-n") 'point-redo)

;; (add-hook 'org-mode-hook
;; 	  (lambda ()
;; 	    (when (string-equal (file-name-nondirectory buffer-file-name) "init.org")
;; 	      (add-hook 'after-save-hook
;; 			(lambda ()
;; 			  (org-babel-tangle)
;; 			  (message "Custom init.el loaded successfully!"))
;; 			'run-at-end 'only-this-buffer))))



;; Automatyczne tanglowanie i ewaluacja po zapisaniu pliku `init.org`
(defun my/org-babel-tangle-and-eval ()
  "Tangle pliku `init.org` i ewaluuje plik `init.el`."
  (when (string-equal (buffer-file-name)
			(expand-file-name "~/.vanilla-emacs/init.org"))
    (let ((org-confirm-babel-evaluate nil)) ;; Wyłącz potwierdzenie tanglowania
	(org-babel-tangle))
    (load-file (expand-file-name "~/.vanilla-emacs/init.el"))))

;; Dodaj hook, aby wywołać tę funkcję po zapisaniu pliku `init.org`
(add-hook 'after-save-hook #'my/org-babel-tangle-and-eval)
