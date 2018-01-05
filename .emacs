;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; File name: ` ~/.emacs '
;;; ---------------------
;;;
;;; If you need your own personal ~/.emacs
;;; please make a copy of this file
;;; an placein your changes and/or extension.
;;;
;;; Copyright (c) 1997-2002 SuSE Gmbh Nuernberg, Germany.
;;;
;;; Author: Werner Fink, <feedback@suse.de> 1997,98,99,2002
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Test of Emacs derivates
;;; -----------------------
(if (string-match "XEmacs\\|Lucid" emacs-version)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;; XEmacs
  ;;; ------
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (progn
     (if (file-readable-p "~/.xemacs/init.el")
        (load "~/.xemacs/init.el" nil t))
  )
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;; GNU-Emacs
  ;;; ---------
  ;;; load ~/.gnu-emacs or, if not exists /etc/skel/.gnu-emacs
  ;;; For a description and the settings see /etc/skel/.gnu-emacs
  ;;;   ... for your private ~/.gnu-emacs your are on your one.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (if (file-readable-p "~/.gnu-emacs")
      (load "~/.gnu-emacs" nil t)
    (if (file-readable-p "/etc/skel/.gnu-emacs")
	(load "/etc/skel/.gnu-emacs" nil t)))

  ;; Custom Settings
  ;; ===============
  ;; To avoid any trouble with the customization system of GNU emacs
  ;; we set the default file ~/.gnu-emacs-custom
;;;
)
;;;

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(add-hook 'after-init-hook (lambda () (load-theme 'monokai)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("53f97243218e8be82ba035ae34c024fd2d2e4de29dc6923e026d5580c77ff702" "0c387e27a3dd040b33c6711ff92e13bd952369a788eee97e4e4ea2335ac5528f" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "28130127bbf3072c1bbc7652fca7245f186bb417b3b385a5e4da57b895ffe9d8" default)))
 '(delete-selection-mode nil)
 '(package-selected-packages
   (quote
	(hy-mode mode-icons evil-nerd-commenter autopair auto-complete bubbleberry-theme flatland-theme multiple-cursors molokai-theme fiplr evil monokai-theme neotree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Tabs x spaces
(setq electric-ident-mode -1)
(setq-default ident-tabs-mode nil)
(setq-default tab-width 4)
(setq-default ident-tabs-mode nil)
 
;; Algumas coisas importantes...
(global-linum-mode 1)
(tool-bar-mode -1)
(ac-config-default)
(require 'autopair)
(autopair-global-mode)
(mode-icons-mode)

;; Atalhos p/ modes
(global-set-key (kbd "<f5>") 'python-mode)
(global-set-key (kbd "<f6>") 'html-mode)
(global-set-key (kbd "<f7>") 'javascript-mode)
(global-set-key (kbd "<f8>") 'css-mode)

;; Nao salvar backup
(setq make-backup-files nil)

;; Neotree config
(require 'neotree)
(global-set-key [f9] 'neotree-toggle)

;; Evil config
(require 'evil)
(evil-mode t)

;; Evil neotree
(add-hook 'neotree-mode-hook
    (lambda ()
        (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter-horizontal-split)
        (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
        (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
        (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; Multiple cursors
(global-set-key (kbd "C-c .") 'mc/mark-next-line-this)
(global-set-key (kbd "C-c ,") 'mc/mark-previous-line-this)
(global-set-key (kbd "C-c C-,")'mc/mark-all-like-this)

;; Encoding
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "en.UTF-8")
(prefer-coding-system 'utf-8)
(setq utf-translate-cjk-mode nil)

