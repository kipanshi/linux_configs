;;; package --- summary
;;; Commentary:
;;; Repositories

;; Maximize on start
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Disable backup
(setq backup-inhibited t)
;; Disable auto save
(setq auto-save-default nil)

;; Hide toolbar and scrollbar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Hide welcome screen
(setq inhibit-startup-message t)

;; Package management
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)

;; Indents
(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
(setq default-tab-width 4)

;; Column-number-mode
(column-number-mode)

;; Support for forward-word and backward-word in Cyrillic
(global-set-key (kbd "а") 'forward-word)
(global-set-key (kbd "и") 'backward-word)
(global-set-key (kbd "м") 'scroll-down)
(global-set-key (kbd "ц") 'copy-region-as-kill)
(global-set-key (kbd "в") 'kill-word)

;; Ido mode
(require 'ido)
(ido-mode t)

;; Colors in terminal emulator
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Jedi autocomplete
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
(setq flycheck-highlighting-mode 'lines)

;; `(flycheck-error-face
;;   ((((class color)) (:foreground "#FF6E64" :background "#FF6E64" :weight bold :underline t))))
;; `(flycheck-warning-face
;;   ((((class color)) (:foreground "#DEB542" :background "#7B6000" :weight bold :underline t))))


;; Autopair
(require 'autopair)
(autopair-global-mode)

;; Try the hack for theme loading
;; color themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(setq current-t43m3 nil)

(defun enab-theme (theme) 
  (if current-t43m3 (disable-theme current-t43m3))
  (setq current-t43m3 theme) 
  (load-theme theme t)) 

(defun disab-current-theme () 
  (if current-t43m3 (disable-theme current-t43m3))
  (setq current-t43m3 nil))

(global-set-key (kbd "C-c ltwo") '(lambda () (interactive) (enab-theme 'wombat)))

(global-set-key (kbd "C-c ltze") '(lambda () (interactive) (enab-theme 'zenburn)))

(global-set-key (kbd "C-c ltsd") '(lambda () (interactive) (enab-theme 'solarized-dark)))

(global-set-key (kbd "C-c ltsl") '(lambda () (interactive) (enab-theme 'solarized-light)))

(global-set-key (kbd "C-c ltne") '(lambda () (interactive) (enab-theme 'tomorrow-night-eighties)))

(global-set-key (kbd "C-c ltni") '(lambda () (interactive) (enab-theme 'tomorrow-night)))

(global-set-key (kbd "C-c ltnb") '(lambda () (interactive) (enab-theme 'tomorrow-night-bright)))

(global-set-key (kbd "C-c ltto") '(lambda () (interactive) (enab-theme 'tomorrow)))

(global-set-key (kbd "C-c ltta") '(lambda () (interactive) (enab-theme 'tango)))

(global-set-key (kbd "C-c ltdb") '(lambda () (interactive) (enab-theme 'deeper-blue)))

(global-set-key (kbd "C-c ltdi") '(lambda () (interactive) (enab-theme 'dichromacy)))

(global-set-key (kbd "C-c dct") '(lambda () (interactive) (disab-current-theme)))

(defun l0ad-theme (name) 
  (interactive
   (list
    (intern (completing-read "Load custom theme: "
                 (mapcar 'symbol-name (custom-available-themes))))))
  (enab-theme name))

(setq d3fault-theme (getenv "EMACS_DEFAULT_THEME"))

(when d3fault-theme
  (enab-theme (intern d3fault-theme)))

;; Load custom theme
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'tomorrow-night t)

;;; .emacs ends ffhere
