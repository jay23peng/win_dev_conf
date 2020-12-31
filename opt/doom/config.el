;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jesse Peng"
      user-mail-address "jsp23@qq.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; personal setup
;; good example: 
;; https://github.com/dangirsh/.doom.d
;; https://zzamboni.org/post/my-doom-emacs-configuration-with-commentary/
;; https://github.com/rougier/elegant-emacs/issues/4
;; https://www.gtrun.org/custom/config.html
;; https://ladicle.com/post/config/#configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dummy function for doing nothing
(defun silence () (interactive))

 ;; background color
 (custom-set-faces
;;   '(default ((t (:background "#1c1c1c"))))
   '(hl-line ((t (:background "#282c34"))))
   '(minibuffer-prompt-inactive ((t (:background "282c34"))))
   '(mode-line-inactive ((t (:background "#282c34"))))
 )

 
;; (add-hook 'minibuffer-setup-hook
;;      (lambda ()
;;        (make-local-variable 'face-remapping-alist)
;;        (add-to-list 'face-remapping-alist '(default (:background "red")))))

;;(set-face-background 'minibuffer-prompt "red")

;; igonre bg on terminal
;; (defun on-after-init ()
;;   (unless (display-graphic-p (selected-frame))
;;     (set-face-background 'default "unspecified-bg" (selected-frame))
;;     (set-face-background 'hl-line "unspecified-bg" (selected-frame))
;;   ))
;;
;; (add-hook 'window-setup-hook 'on-after-init)


;; (unless window-system (set-frame-size (selected-frame) 80 24))

;; fonts
(setq doom-font (font-spec :family "FiraMono Nerd Font" :size 16)
      ;; doom-variable-pitch-font (font-spec :family "Libre Baskerville")
      ;; doom-serif-font (font-spec :family "Libre Baskerville")
)

;; ctrl -> cmd
(setq mac-command-modifier 'control)

;; mouse config
(unless window-system
  ;; (global-unset-key [mouse-2])
  (global-set-key (kbd "<mouse-2>") 'silence)
  ;; evil needs separate map definitions
  (define-key evil-normal-state-map (kbd "<mouse-2>") 'silence)
  (define-key evil-insert-state-map (kbd "<mouse-2>") 'silence)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line)
)

;; (when (file-exists-p "~/.doom.d/banners")
;;   (setq +doom-dashboard-banner-padding '(0 . 2)
;;        +doom-dashboard-banner-file "deepfield-window.png"
;;        +doom-dashboard-banner-dir "~/.doom.d/banners"))

;; (setq display-line-numbers-type nil)

;; Thin grey line separating windows
;; (set-face-background 'vertical-border "grey")
;; (set-face-foreground 'vertical-border (face-background 'vertical-border))

(when window-system (set-frame-size (selected-frame) 80 24))

;; org-mode
(add-hook! 'org-mode-hook #'doom-disable-line-numbers-h)

;; magit
(use-package! magit
  :config
  (set-default 'magit-stage-all-confirm nil)
  (set-default 'magit-unstage-all-confirm nil)

  ;; Restores "normal" behavior in branch view (when hitting RET)
  (setq magit-visit-ref-behavior '(create-branch checkout-any focus-on-ref))

  (setq git-commit-finish-query-functions nil)
  (setq magit-visit-ref-create 1)
  (setq magit-revision-show-gravatars nil)
  (setq magit-module-sections-nested nil)
       (magit-add-section-hook 'magit-status-sections-hook
                               'magit-insert-modules
                               'magit-insert-unpulled-from-pushremote
                               ;; looks option above will IGNORE status when case happen
                               ;; 'magit-insert-modules-unpulled-from-pushremote
                               ;; 'magit-insert-modules-unpushed-to-pushremote 
       )
)

;; magit
;; (after! magit
;;   (setq zz/repolist
;;         "~/.elvish/package-data/elvish-themes/chain-summary-repos.json")
;;   (defadvice! +zz/load-magit-repositories ()
;;     :before #'magit-list-repositories
;;     (setq magit-repository-directories
;;           (seq-map (lambda (e) (cons e 0)) (json-read-file zz/repolist))))
;;   (setq magit-repolist-columns
;;         '(("Name" 25 magit-repolist-column-ident nil)
;;           ("Status" 7 magit-repolist-column-flag nil)
;;           ("B<U" 3 magit-repolist-column-unpulled-from-upstream
;;            ((:right-align t)
;;             (:help-echo "Upstream changes not in branch")))
;;           ("B>U" 3 magit-repolist-column-unpushed-to-upstream
;;            ((:right-align t)
;;             (:help-echo "Local changes not in upstream")))
;;           ("Path" 99 magit-repolist-column-path nil))))


;; line wrap and truncation symbol
;; Or add a hook for the mode you are using (add-hook! <your-mode> visual-line-mode)
(global-visual-line-mode t)
(defun my-change-window-divider ()
    (set-display-table-slot standard-display-table 'wrap ?\u21b5) ;;/u23ce
    (set-display-table-slot standard-display-table 'truncation ?\u2192) ;;/u21e8
    (set-display-table-slot standard-display-table 'vertical-border (make-glyph-code ?│)) ; or ┃ │
    (let ((windows (doom-visible-windows)))
      (dolist (w windows)
        (set-window-display-table w standard-display-table))))
(add-hook 'window-configuration-change-hook 'my-change-window-divider)

;; (defun my-change-window-divider ()
;;   (let ((display-table (or buffer-display-table standard-display-table)))
;;     (set-display-table-slot display-table 'wrap ?\u21b5) ;;/u23ce
;;     (set-display-table-slot display-table 'truncation ?\u2192) ;;/u21e8
;;     (set-display-table-slot display-table 'vertical-border (make-glyph-code ?│)) ; or ┃ │
;;     (let ((windows (doom-visible-windows)))
;;       (dolist (w windows)
;;         (set-window-display-table w display-table)))))
;; (add-hook 'window-configuration-change-hook 'my-change-window-divider)

;; xwidget-webkit
;; https://github.com/fuxialexander/doom-emacs-private-xfu/blob/122fc444f3d564124df7fbf8e2be034a0d136317/%2Bbindings.el



(map! 
  ;; vinegar like behavior
  :n "-" #'dired-jump
  ;; xwidget-webit-browser entry
  (:leader
   :desc "Open URL in emacs-webkit"
   "o w" #'xwidget-webkit-browse-url)
  ;; org
  (:after evil-org
   (:map evil-org-mode-map
    :ni "C-RET" #'org-insert-subheading
    :ni "S-RET" #'+org/insert-item-below
    :ni [C-return] #'org-insert-subheading
    :ni [S-return] #'+org/insert-item-below)
   (:map org-mouse-map [mouse-2] #'silence))
;;      (:after evil-org
;;       :map (evil-org-mode-map)
;;       :nvime [M-return] #'org-meta-return
;;       :ni [C-return] #'org-insert-todo-heading
;;       :ni [C-S-return] #'org-insert-todo-subheading
;;       (:when IS-MAC
;;        [s-return]   nil
;;        [s-S-return] nil
;;        [s-M-return] nil))
;;      (:after xwidget
;;       :map xwidget-webkit-mode-map
;;       :n "q" #'quit-window
;;       :n "r" #'xwidget-webkit-reload
;;       :n "y" #'xwidget-webkit-copy-selection-as-kill
;;       :n "s-c" #'xwidget-webkit-copy-selection-as-kill
;;       :n "t" #'xwidget-webkit-browse-url
;;       :n "n" #'xwidget-webkit-forward
;;       :n "p" #'xwidget-webkit-back
;;       :n "G" #'xwidget-webkit-scroll-bottom
;;       :n "gg" #'xwidget-webkit-scroll-top
;;       :n "C-d" #'xwidget-webkit-scroll-down
;;       :n "C-u" #'xwidget-webkit-scroll-up
;;       :n "M-=" #'xwidget-webkit-zoom-in
;;       :n "M--" #'xwidget-webkit-zoom-out
;;       :n "j" #'xwidget-webkit-scroll-up-line
;;       :n "k" #'xwidget-webkit-scroll-down-line)
)

;;  ;; half page scroll - not sure why up func is using scroll-down
;;  (defun scroll-half-page-up ()
;;    "scroll down half the page"
;;    (interactive)
;;    (scroll-down (/ (window-body-height) 2)))
;;
;;  (defun scroll-half-page-down ()
;;    "scroll up half the page"
;;    (interactive)
;;    (scroll-up (/ (window-body-height) 2)))
;;
;;  (define-key evil-normal-state-map (kbd "J") 'scroll-half-page-down)
;;  (define-key evil-normal-state-map (kbd "K") 'scroll-half-page-up)

;; dired setup for mac
;; https://stackoverflow.com/questions/25125200/emacs-error-ls-does-not-support-dired
(when (string= system-type "darwin")
  (setq dired-use-ls-dired t
        insert-directory-program "/usr/local/bin/gls"
        dired-listing-switches "-aBhl --group-directories-first"))


;; Persist Emacs’ initial frame position, dimensions and/or full-screen state across sessions
(when-let (dims (doom-store-get 'last-frame-size))
  (cl-destructuring-bind ((left . top) width height fullscreen) dims
    (setq initial-frame-alist
          (append initial-frame-alist
                  `((left . ,left)
                    (top . ,top)
                    (width . ,width)
                    (height . ,height)
                    (fullscreen . ,fullscreen))))))

(defun save-frame-dimensions ()
  (doom-store-put 'last-frame-size
                  (list (frame-position)
                        (frame-width)
                        (frame-height)
                        (frame-parameter nil 'fullscreen))))

(add-hook 'kill-emacs-hook #'save-frame-dimensions)

;; doom-modeline height in gui 
;;(use-package doom-modeline
;;  :custom-face
;;  (mode-line ((t (:height 0.9))))
;;  (mode-line-inactive ((t (:height 0.9))))
;;)
;;
