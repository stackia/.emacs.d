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

(defun init-company-mode ()
  "Initialize company-mode."
  (global-company-mode 1))

(defun init-flycheck-mode ()
  "Initialize flycheck mode."
  (global-flycheck-mode 1))

(defun init-helm-mode ()
  "Initialize helm mode."
  (helm-mode 1))


;; Execute init functinos

(init-emacs)
(init-company-mode)
(init-flycheck-mode)
(init-helm-mode)


;; Customize variables

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(solarized-distinct-fringe-background t)
 '(solarized-high-contrast-mode-line t)
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(make-backup-files nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
