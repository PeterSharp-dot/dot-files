;; Ustawienie katalogu dla pakietów
(setq user-emacs-directory "~/.vanilla-emacs/")

;; Ustawienie katalogu dla pakietów elpa
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))



(load-theme 'wombat t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-font "Inconsolata LGC Nerd Font-13" nil t)
(set-face-attribute 'default nil :font "Inconsolata LGC Nerd Font-13")
(set-face-attribute 'fixed-pitch nil :font "Inconsolata LGC Nerd Font-15")
(set-face-attribute 'variable-pitch nil :font "Inconsolata LGC Nerd Font-13")

;; Inicjalizacja pakietów
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Automatyczna instalacja use-package jeśli nie jest zainstalowany
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
;; Przykład konfiguracji dla pakietu `ivy`

;; (use-package ivy
;;   :ensure t
;;   :diminish
;;   :bind (("C-s" . swiper))
;;   :config
;;   (ivy-mode 1))
;; Składnia use-package
;; :ensure t: Automatycznie instaluje pakiet, jeśli nie jest zainstalowany.
;; :diminish: Usuwa nazwę pakietu z modeline, aby zachować porządek.
;; :bind: Przypisuje klawisze do poleceń pakietu.
;; :config: Sekcja, w której można umieścić kod konfigurujący pakiet po jego załadowaniu.
;; :init: Kod, który ma być uruchomiony przed załadowaniem pakietu.
;; :hook: Automatycznie dodaje funkcje do odpowiednich hooków.


;;M-x load-file RET ~/.vanilla-emacs/vanilla-emacs-init.el RET		

(use-package markdown-mode
  :ensure t
)
