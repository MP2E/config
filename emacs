(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
 (unless (require 'el-get nil t)
  (with-current-buffer
    (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
 (end-of-buffer)
(eval-print-last-sexp))) 
(el-get 'sync)
(color-theme-solarized-dark)
(setq gdb-command-name "egdb")
(setq make-backup-files nil)
(evil-mode 1)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)
    (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)))
(require 're-builder)
(setq reb-re-syntax 'string)
(menu-bar-mode 0)
(tool-bar-mode 0)
(setenv "PATH"
  (concat
   "/opt/mingw/bin" ":"
   (getenv "PATH")))
(setq gnus-select-method '(nnimap "gmail"
				  (nnimap-address "imap.gmail.com")
				  (nnimap-server-port 993)
				  (nnimap-stream ssl)))
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "MP2E@archlinux.us" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq shm-program-name "/home/cray/.emacs.d/el-get/structured-haskell-mode/dist/build/structured-haskell-mode/structured-haskell-mode")
(require 'shm)
(add-hook 'haskell-mode-hook `structured-haskell-mode)
