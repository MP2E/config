(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
(require 'magit)
(require 'magit-svn)
(require 'rebox2)
(global-set-key [(meta q)] 'rebox-dwim)
(global-set-key [(shift meta q)] 'rebox-cycle)
(setq make-backup-files nil)
(add-to-list 'load-path "~/.emacs.d/icicles")
(require 'icicles)
(require 'lacarte)
(global-set-key [?\e ?\M-x] 'lacarte-execute-command)
(global-set-key [?\M-`] 'lacarte-execute-command)
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(add-to-list 'load-path
    "~/.emacs.d/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet/snippets")
(add-to-list 'load-path "~/.emacs.d")
(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode))
   auto-mode-alist))
(require 'go-mode-load)
(autoload 'gtags-mode "gtags.el" "" t)
(defun djcb-gtags-create-or-update ()
  "create or update the gnu global tag file"
  (interactive)
  (if (not (= 0 (call-process "global" nil nil nil " -p"))) ; tagfile doesn't exist?
    (let ((olddir default-directory)
          (topdir (read-directory-name  
                    "gtags: top of source tree:" default-directory)))
      (cd topdir)
      (shell-command "gtags && echo 'created tagfile'")
      (cd olddir)) ; restore   
    ;;  tagfile already exists; update it
    (shell-command "global -u && echo 'updated tagfile'")))
(add-hook 'gtags-mode-hook 
  (lambda()
    (local-set-key (kbd "M-.") 'gtags-find-tag)   ; find a tag, also M-.
    (local-set-key (kbd "M-,") 'gtags-find-rtag)))  ; reverse tag
(add-hook 'c-mode-common-hook
  (lambda ()
    (require 'gtags)
    (gtags-mode t)
    (djcb-gtags-create-or-update)))
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
