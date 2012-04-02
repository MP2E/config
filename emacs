(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
 (unless (require 'el-get nil t)
  (with-current-buffer
    (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
 (end-of-buffer)
(eval-print-last-sexp))) 
(el-get 'sync)
(eval-after-load "color-theme" '(color-theme-twilight))
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
(set-default-font "-unknown-Droid Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
(setenv "PATH"
  (concat
   "/opt/mingw/bin" ":"
   "/home/cray/gohg/bin" ":"
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
(c-add-style "openbsd"
	     '("bsd"
	       (indent-tabs-mode . t)
	       (defun-block-intro . 8)
	       (statement-block-intro . 8)
	       (statement-case-intro . 8)
	       (substatement-open . 4)
	       (substatement . 8)
	       (arglist-cont-nonempty . 4)
	       (inclass . 8)
	       (knr-argdecl-intro . 8)))
