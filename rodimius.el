;;Boring initial setup stuff
;;Allows syntax highlighting to work, among other things
(global-font-lock-mode 1)
;;to set foreground color to white
(setq x-select-enable-clipboard t)
(set-foreground-color "white")
;;to set background color to black
(set-background-color "black")
;;set initial size and location
(setenv "CLICOLOR" nil)
(setq indent-tabs-mode nil) 
(setq load-path
      (append (list nil "~/emacs/")
              load-path))
;;show parens
(show-paren-mode t)
;;end boring

;; little languages
;; (add-to-list 'load-path "/usr/lib/erlang/lib/tools-2.5.5/emacs/")
;; (setq erlang-root-dir "/usr/lib/erlang")
;; (setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
;; (require 'erlang-start)
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'load-path "~/emacs/haskell-mode-2.4/")
(load "~/emacs/haskell-mode-2.4/haskell-site-file.el")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; end little languages

;; ;;rails-mode things.
;; ;These lines are required for ECB
;; (add-to-list 'load-path "~/emacs/cedet-1.0pre4/common")
;; (add-to-list 'load-path "~/emacs/cedet-1.0pre4/eieio")
;; (add-to-list 'load-path "~/emacs/cedet-1.0pre4/speedbar")
;; (add-to-list 'load-path "~/emacs/cedet-1.0pre4/semantic")
;; (require 'cedet)
;; (semantic-load-enable-code-helpers)
;; ; This installs ecb - it is activated with M-x ecb-activate
;; (add-to-list 'load-path "~/emacs/ecb-2.32/")
;; (require 'ecb-autoloads)
;; (require 'snippet)
;; (require 'find-recursive)
;; (require 'inf-ruby)
;; (setq load-path (cons "~/emacs/emacs-rails" load-path))
;; (require 'rails)
;; (setf rails-use-text-menu nil)
;; (autoload 'ruby-mode "ruby-mode" "load ruby-mode")
;; (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("\\.rhtml\\'" . html-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . html-mode))

(modify-coding-system-alist 'file "\\.rb$" 'utf-8)
(modify-coding-system-alist 'file "\\.rhtml$" 'utf-8)
(modify-coding-system-alist 'file "\\.erb$" 'utf-8)

;;IDO
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;rinari
(add-to-list 'load-path "~/emacs/rinari")
(require 'rinari)

;;Ruby
(require 'ruby-hacks)

(add-hook 'ruby-mode-hook
	  (lambda ()
	    (require 'ruby-electric)
	    (ruby-hs-minor-mode t)
	    (ruby-electric-mode t)))
(global-set-key (kbd "<M-left>") 'hs-hide-block)
(global-set-key (kbd "<M-right>") 'hs-show-block)
(global-set-key (kbd "<M-S-left>") 'hs-hide-level)
(global-set-key (kbd "<M-S-right>") 'hs-show-all)
(setq tramp-default-method "ssh")

(load "ruby-flymake.el")
;;nxml
(load "~/emacs/nxhtml/autostart.el")
(setq
 nxhtml-global-minor-mode t
 mumamo-chunk-coloring 'submode-colored
 nxhtml-skip-welcome t
 indent-region-mode t
 rng-nxml-auto-validate-flag nil
 nxml-degraded t)
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . eruby-nxhtml-mumamo-mode))

;; Pay no attention to the man behind the curtain.
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w"     'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\C-cb" 'ediff-buffers)
(global-set-key "\M-c" 'comment-or-uncomment-region)

(global-set-key (kbd "<M-S-down>") 'next-buffer)
(global-set-key (kbd "<M-S-up>") 'previous-buffer)
(global-set-key (kbd "<M-down>") 'next-multiframe-window)
(global-set-key (kbd "<M-up>") 'previous-multiframe-window)
(setq inhibit-splash-screen t)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; irc
(setq rcirc-default-nick "rodimius")

;; from http://geosoft.no/development/emacs.html

(setq make-backup-files nil)

;;; Final version: while
(defun count-words-region (beginning end)
  "Print number of words in the region."
  (interactive "r")
  (message "Counting words in region ... ")

;;; 1. Set up appropriate conditions.
  (save-excursion
    (let ((count 0))
      (goto-char beginning)

;;; 2. Run the while loop.
      (while (and (< (point) end)
                  (re-search-forward "\\w+\\W*" end t))
        (setq count (1+ count)))

;;; 3. Send a message to the user.
      (cond ((zerop count)
             (message
              "The region does NOT have any words."))
            ((= 1 count)
             (message
              "The region has 1 word."))
            (t
             (message
              "The region has %d words." count))))))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.32")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote (("~/rails" "rails"))))
 '(ecb-tip-of-the-day nil)
 '(nxhtml-minor-mode-modes (quote (nxhtml-mode nxml-mode html-mode sgml-mode xml-mode php-mode css-mode js2-mode java-mode image-mode dired-mode)))
 '(rails-ws:default-server-type "webrick"))
(set-variable 'truncate-lines 't)
