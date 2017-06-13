;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs config based on redguardtoo/emacs.d
;;
;; put line below to init.el
;; (add-to-list 'load-path ( concat ( getenv "DEV_HOME" ) "/emacs" ) )
;;   (require 'init-personalization)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; use melpa for all packages in this configuration
(setq package-filter-function nil)

; Fast open files
(setq recentf-keep '(file-remote-p file-readable-p))

;;no #F#
(setq auto-save-default nil)
;; No Temporary File
(setq-default make-backup-files nil)

;;Short key to truncate
(global-set-key [f2] 'rename-buffer)
(global-set-key [f3] 'company-complete)
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [f5] 'untabify)
(global-set-key [f11] 'toggle-menu-bar-mode-from-frame)
(global-set-key [f12] 'toggle-truncate-lines)

;; hide menubar
(menu-bar-mode -1) 

;; ace-jump-buffer
(require-package 'ace-jump-buffer)
(global-set-key (kbd "M-.") 'ace-jump-buffer) 
(define-key evil-normal-state-map ( kbd "M-." ) 'ace-jump-buffer )
(define-key evil-normal-state-map ( kbd "." ) 'ace-jump-buffer )


;;  sqlplus-mode:
(require-package 'sqlplus)
(require 'sqlplus)
  (add-to-list 'auto-mode-alist '("\\.sqp\\'" . sqlplus-mode))
  (setq  sql-oracle-program "Z:/scripts/run_sqlplus10.bat")
  (setq  sqlplus-command "Z:/scripts/run_sqlplus10.bat")

;;  reuse buffer in dired mode
(require 'dired+)
  (toggle-diredp-find-file-reuse-dir 1)
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
 ))

;; cdb-gud
;;(load "cdb-gud")
;;(global-set-key [f5]    'gud-cont)
;;  (global-set-key [f7]    'gud-tbreak)
;;  (global-set-key [f8]    'gud-step)
;;  (global-set-key [f9]    'gud-break)
;;  (global-set-key [f10]   'gud-next)
;;  (global-set-key [f11]   'gud-finish)

;; Below configuration is not required now but still keep it for future
;; set up unicode -- 12/30/2014 not required when use unicad
;; 01/05/2014 -- we still need below even we have unicad, or else some public buffer
;; will pop up warning like *session*
(require 'unicad)
(prefer-coding-system 'cp950)
(prefer-coding-system 'gb2312)
(prefer-coding-system 'cp936)
(prefer-coding-system 'gb18030)
(prefer-coding-system 'utf-16le-with-signature)
(prefer-coding-system 'utf-16)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-16)
(set-keyboard-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq path-name-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; mac font setting
(when *is-a-mac*
  (set-face-attribute 'default nil :font "Monaco 14") 
  ;; Chinese Font 
  (dolist (charset '(kana han symbol cjk-misc bopomofo)) 
    (set-fontset-font (frame-parameter nil 'font) 
                      charset 
                      (font-spec :family "PingFang SC" :size 14)))

  ;; For emacs shell 
  (setenv "LANG" "zh_CN.UTF-8")

  ;; browesr
  (setq browse-url-generic-program 'browse-url-default-macosx-browser)
)

(when *win64*
  (set-w32-system-coding-system 'utf-8) 
  ;; MS Windows clipboard is UTF-16LE 
  (set-clipboard-coding-system 'utf-16le-dos)

  ;; try to improve slow performance on windows.
  (setq w32-get-true-file-attributes nil)
  (set-face-attribute 'default nil :height 150)

  ;; emacs server ( singleton mode )
  (require 'server)
  (and (>= emacs-major-version 23)
     (defun server-ensure-safe-dir (dir) "Noop" t))
  (setq server-auth-dir "~/server")  ;;Server file location
  (setq server-name "main_server")   ;;Server mutex file name
  (server-start)

  ;; browser
  (setq browse-url-browser-function 'browse-url-default-windows-browser)

  ;; external ls
  (setq ls-lisp-use-insert-directory-program t)      ;; use external ls
     (setq insert-directory-program "c:/cygwin64/bin/ls") ;; ls program name

)

;; truncate from a sub-shell automatically
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

;; Enable useful disabled commands
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; evil clipbord workaround
;; NOTE: There is still a limitation in paste that, if copy from emacs, the
;; paste command from clipboard ("+/"*) is not going to work.
(fset 'evil-visual-update-x-selection 'ignore)

;; workaround for org link. Or else default setting will load w3m
(ad-disable-advice 'org-open-at-point 'around 'org-open-at-point-choose-browser )
(ad-activate 'org-open-at-point )

;; overwrite evil setting with colemak key mapping
;; NOTE: default unname register in evil is "
(define-key evil-normal-state-map (kbd "h") 'evil-previous-visual-line)
(define-key evil-motion-state-map "h" 'evil-previous-line)
(define-key evil-window-map "h" 'evil-window-up)

(define-key evil-normal-state-map (kbd "k") 'evil-next-visual-line)
(define-key evil-motion-state-map "k" 'evil-next-line)
(define-key evil-window-map "k" 'evil-window-down)

(define-key evil-normal-state-map (kbd "j") 'evil-backward-char)
(define-key evil-motion-state-map "j" 'evil-backward-char)
(define-key evil-window-map "j" 'evil-window-left)

(define-key evil-normal-state-map (kbd "l") 'evil-forward-char)
(define-key evil-window-map "l" 'evil-window-right)
(define-key evil-motion-state-map "l" 'evil-forward-char)

;; theme
;;(require-package 'color-theme-modern)
(require-package 'tangotango-theme)
(require-package 'leuven-theme)
(require-package 'minimal-theme)
(require-package 'darkokai-theme)
(require-package 'darkburn-theme)
(require-package 'solarized-theme)
(setq darkokai-mode-line-padding 1)
(load-theme 'darkokai t)

;; dired-quick-sort
(require-package 'dired-quick-sort)
(require 'dired-quick-sort) 
(defun cycle-dired-quick-sort-js (*n)
  "Cycle background color among a preset list. If `universal-argument' is called first, cycle n steps. Default is 1 step. URL `http://ergoemacs.org/emacs/elisp_toggle_command.html' Version 2015-12-17"
  (interactive "p")
  (let* (
         (-values ["none" "time" "size" "version" "extension"])
         (-index-before
          (if (get 'cycle-dired-quick-sort-js 'state)
              (get 'cycle-dired-quick-sort-js 'state)
            0))
         (-index-after (% (+ -index-before (length -values) *n) (length -values)))
         (-next-value (aref -values -index-after)))

    (put 'cycle-dired-quick-sort-js 'state -index-after)

    (dired-quick-sort -next-value nil ?y nil)
    (dired-quick-sort--sort-by-last -next-value)
    (message "sort by %s" -next-value)))

(define-key dired-mode-map "s" 'cycle-dired-quick-sort-js)
(define-key dired-mode-map "S" 'cycle-dired-quick-sort-js)

(provide 'init-personalization)
