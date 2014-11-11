;;; init.el --- Emacs customize entrance

;; Copyright (C) 2014  Stackia

;; Author: Stackia <jsq2627@gmail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Emacs initialize file.

;;; Code:

;; Set up MELPA package repository

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(setq package-enable-at-startup nil)
(package-initialize)


;; Define init functions

(defun init-emacs ()
  "Initialize Emacs with custom configuration."

  ;; Set my personal information
  (setq user-mail-address "jsq2627@gmail.com")
  (setq user-full-name "Stackia")

  ;; Disable tool bar
  (tool-bar-mode 0)

  ;; Show line number
  (global-linum-mode 1)

  ;; Set font to Source Code Pro
  (set-frame-font "-*-Source Code Pro-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))

(defun source-env-variables-from-shell ()
  "Retrive environment variables from the shell when started as GUI application on OS X."
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(defun init-company-mode ()
  "Initialize company-mode."
  (global-company-mode 1))

(defun init-flycheck-mode ()
  "Initialize flycheck mode."
  (global-flycheck-mode 1))

(defun init-helm-mode ()
  "Initialize helm mode."
  (helm-mode 1)
  (global-set-key (kbd "C-M-i") 'helm-company))

(defun init-go-env ()
  "Initialize Golang programming environment."
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (add-hook 'before-save-hook 'gofmt-before-save))


;; Execute init functinos

(init-emacs)
(source-env-variables-from-shell)
(init-company-mode)
(init-flycheck-mode)
(init-helm-mode)
(init-go-env)


;; Customize variables

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends
   (quote
	(company-bbdb company-nxml company-css company-eclim company-go company-clang company-xcode company-ropemacs company-cmake company-capf
				  (company-dabbrev-code company-gtags company-etags company-keywords)
				  company-oddmuse company-files company-dabbrev)))
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 2)
 '(company-tooltip-limit 15)
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
	("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(gofmt-command "goimports")
 '(make-backup-files nil)
 '(require-final-newline (quote ask))
 '(show-trailing-whitespace t)
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
