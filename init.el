;; バックアップファイルを作らないようにする
(setq make-backup-files nil)
;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; slime
(add-to-list 'load-path "~/.emacs.d/slime")
(setq inferior-lisp-program "/bin/sbcl")
(require 'slime-autoloads)
(slime-setup '(slime-repl))

;; 現在行のハイライト
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#66FB3F"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; 大文字小文字の区別をしない
(setq completion-ignore-case t)

;; processing
(add-to-list 'load-path "/home/nagu/.emacs.d/processing2-emacs/")
(autoload 'processing-mode "processing-mode" "Processing mode" t)
(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))

(setq processing-location "/opt/processing-2.1.1/processing-java")
(setq processing-application-dir "/opt/processing-2.1.1")
(setq processing-sketch-dir "/home/nagu/sketchbook")

;; auto-installのパッケージ追加
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; anything
(require 'anything-startup)
(global-set-key (kbd "C-x b") 'anything-for-files)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
(global-set-key (kbd "C-x M-x") 'anything-M-x)
(setq recentf-max-menu-items 10)        ;; 表示するファイルの数
(setq recentf-max-saved-items 30)       ;; 保存するファイルの数
(setq kill-ring-max 100)                ;; kill-ring で保存される最大値

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; rainbow-mode
(defun my-rainbow-mode-turn-on ()
   (rainbow-mode t))  
(add-hook 'css-mode-hook 'my-rainbow-mode-turn-on)
(add-hook 'html-mode-hook 'my-rainbow-mode-turn-on)

;; バッファ移動
(setq windmove-wrap-around t)
(windmove-default-keybindings)

;;expand +  multiple 
(require 'expand-region)
(require 'multiple-cursors)
(require 'smartrep)

(global-set-key (kbd "C-c C-s") 'er/expand-region)
(global-set-key (kbd "C-c C-a") 'er/contract-region)

(global-set-key (kbd "C-c C-e") 'mc/edit-lines)
(smartrep-define-key
 global-map "C-c" '(("C-f" . 'mc/mark-next-like-this)
                    ("C-d" . 'mc/mark-previous-like-this)
                    ("*"   . 'mc/mark-all-like-this)))



(require 'helm-open-github)
(global-set-key (kbd "C-c o f") 'helm-open-github-from-file)
(global-set-key (kbd "C-c o c") 'helm-open-github-from-commit)
(global-set-key (kbd "C-c o i") 'helm-open-github-from-issues)

;;theme
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/elisp/themes/"))
(load-theme 'charcoal-black t t)
(enable-theme 'charcoal-black)
