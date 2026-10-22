;; -*- lexical-binding: t; -*-
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu t)
 '(ac-auto-start t)
 '(ac-candidate-limit 20)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9"
    "white"])
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-replace-to-string-separator " => ")
 '(anzu-search-threshold 1000)
 '(auth-source-save-behavior nil)
 '(auto-insert-query nil)
 '(auto-save-interval 50)
 '(backup-directory-alist '(("tramp-file-name-regexp" . "nil")))
 '(browse-url-browser-function 'browse-url-firefox)
 '(browse-url-firefox-arguments '("-p" "html" "--private-window"))
 '(comint-input-ring-size 10000)
 '(comint-terminfo-terminal "xterm-256color")
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 3)
 '(company-show-numbers ''t)
 '(company-show-quick-access ''t)
 '(company-tooltip-idle-delay 0)
 '(company-transformers
   '(company-sort-by-occurrence
     ;; company-sort-by-statistics
     company-sort-prefer-same-case-prefix))
 '(compilation-ask-about-save nil)
 '(create-lockfiles nil)
 '(custom-enabled-themes '(deeper-blue-extend))
 '(custom-safe-themes
   '("5ae1dd318a1b1bb419205e495a28d59c22c91c2d5a305ee5519acb206225e505"
     "3263bd17a7299449e6ffe118f0a14b92373763c4ccb140f4a30c182a85516d7f"
     "ad11b347480bd8d45b6a93eefe8ddbff920cd672b451ab357e30ff90e387f9e9"
     "ce2e6a4ae7d02696b2523c9a10fac76f3faee27e7a00321fec75a86765518449"
     "fd3b62454dcfc17e5a1e17fa900a297fc252419020d9a12776268ed98ad46990"
     "f47c21a20ac1922fa023c9829f15bc704321c539bcffb845704f431ff6434e01"
     "9b0bb41fca3089eb8c203f0b08eae327cea348b422869c91178c45b80bcd3edb"
     "e87eaf798d30479c0d317c539a072a4302fc884a7859564bcd20c84edd5a40c9"
     "4913883e5bf8407e4c072ad9af52286906bbabc3eba007012f78d2491687e71e"
     "e308c23c31b28576456c56f446f3535717c52a8fe00274889059b188265926c5"
     "1f29991e791ec6c846c246b616190014bd092de48235decf023650907dca95df"
     "4cd8992cb77a53dff0acd80c327b3aefe5999f73cf7ed12f637189b17d451dbb"
     "1b2f9db465b84b82546f3a37a060a93f337bf1bca9c7ea3683de5174eb0774ae"
     "1a41a7cd7a924ea0992c2199e0a24ba04e1174c98bb96fe67364c33e1113a2a7"
     "12ed2214b467689cb4a2a50a77f70c0bd196f1486547a26153e5f0cd4094530e"
     "e68501b27f776ce4067ce1afb6d438b807f86a219347629962eb77d74ce05e6b"
     "1547ef6650b077ddc7a32c3a70485d2191ce1ae95e135bab0fb535682d090c61"
     "b86cf9c72124814b22faf8a1931d0af5d4db6211641e00dcec18a6aae89b39a5"
     "afac6d442861c017ecadebedc5f5f00b5946f46c2ed862eed3656b26f44d534a"
     "c6c132afa1fe408f74672d91ca61ff949316ff29174876ecdf3e0e43fcee452a"
     "910046ff7ad883471b71f2307efdc6e78f03d5212bebc9222e46e9132cd3380e"
     "67f9c6682cf243ca130bffb1888b177500f3e557ca21dbe64545b03ea82c3397"
     "9817893e677466ff9687cf17d63a2cec08088a384d5589c5a14585e756b14983"
     "916e4ee8a6be1e006ba8f11ebbb0643a32a059f91ffa5970d6bad84fd0d9f9a2"
     "2fa0b3b5090f06cefaae3308a227c8420432bfee0c79d49006a8345784654205"
     "74919b76a1c4504d7809a1bbee280dea1e0439ac82c59da93d814f051f043fad"
     "245215809306cb5bf691e7a610e6b64fd06fdd63c51c6bc49b4ae8272d7f2fad"
     "f3e3e43ca2e1ed186ddc3d3833aa0a848a2824163d5247b2369a891175228977"
     "f6c12dbfc0628df57deabcf17e538e4adf2dc97152bb5de38b3247265926e3a7"
     "6695f1c6af09f18f72faf914ed7ac1a21d290ad474bba06e5a94c9ee2e43491d"
     "4cc0a696d4c92fc064dc9f3679e655319763aad5568c440b99e8bd6a22dac9dc"
     "4acaa9373f492f5f0fdd9f154fa0e9bfdc2894ccd360f64e6424e6a18a35f4a7"
     "52e1f442edd08c5801d692925f7b323284cea94d36fff4efa5a4476c3b8e8dc9"
     "e5c7c8a321835bbb93f8de68077247789c88725635323bfc75dd9458c3531d63"
     "8759b1ab5405cf8f11ea5ce72c96563d1edd4cd5b21344e6f42862129b9223cd"
     "4629080229707bad592e70d6a8c9b9e6121678af0344530c0b4bf4fee8f8461a"
     "21dac8377069a59c7f657a1fa3e5c721640a5253ba04f51d091e8ffc26642883"
     "e2b812bd0e551e1b021bb0f9c2c6cb569868ea6153b3fbc793365eba8393f56a"
     "0b48b0da949e88e9d3cbe7afee3c66b8b2d5a3384bbeabf2724557ca0889701f"
     "ae3e90550ba4b93fb6580b944bbde72bb35a540b2cfc4260ae9896b09708c634"
     "52431a3cef7b4ac54c77e583501b2ab3b65265800cd02f7a3b70fbcaa01533df"
     "2f8173127025f0ae650b040ad7d4ce0a2353f6b57567f2fda6cb25a858fc5369"
     "53bc3612ebb8acf20d2dd6c885fdb6b811b61101869d9081b840c074134e4472"
     default))
 '(delete-by-moving-to-trash t)
 '(desktop-save t)
 '(dired-auto-revert-buffer 'dired-directory-changed-p)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(edit-server-url-major-mode-alist '(("github" . markdown-mode)))
 '(eglot-confirm-server-edits nil)
 '(eglot-confirm-server-initiated-edits nil)
 '(eglot-events-buffer-size 0)
 '(erc-auth-source-server-function nil)
 '(erc-hide-list '("JOIN" "NICK" "PART" "QUIT"))
 '(erc-modules
   '(autojoin completion notifications hl-nicks netsplit fill button
	      match track readonly networks ring autojoin noncommands
	      irccontrols move-to-prompt stamp menu list))
 '(erc-track-enable-keybindings nil)
 '(exec-path
   '("~/.local/bin" "/usr/local/sbin"
     "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin"
     "/snap/bin" "~/.ghcup/bin"
     "~/.nvm/versions/node/v22.19.0/bin/"))
 '(fancy-dabbrev-expansion-context 'almost-everywhere)
 '(flycheck-display-errors-delay 0.4)
 '(flycheck-keymap-prefix "\3f")
 '(global-display-line-numbers-mode t)
 '(gnus-summary-line-format "%U%R%z%I%(%[%16&user-date;: %-23,23f%]%) %s %4L\12")
 '(gnus-thread-sort-functions '((not gnus-thread-sort-by-date)))
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN"
     "_darcs" "{arch}" "node_modules"))
 '(haskell-compile-command
   "HASKELL_PATH=%s; ghc -Wall -ferror-spans -fforce-recomp -c $HASKELL_PATH ; time runghc $HASKELL_PATH")
 '(haskell-compile-stack-build-command
   "stack build --fast --verbosity error;stack exec $(basename %s)-exe")
 '(history-length 500)
 '(hs-minor-mode 1 t)
 '(ibuffer-project-use-cache t)
 '(icomplete-compute-delay 0)
 '(icomplete-delay-completions-threshold 0)
 '(indent-bars-pattern " .")
 '(indent-bars-width-frac 0.1)
 '(inf-mongo-command "/usr/bin/mongo 127.0.0.1:27017")
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings nil)
 '(menu-bar-mode nil)
 '(mode-line-format
   '("%e" mode-line-front-space
     (:propertize
      ("" mode-line-mule-info mode-line-client mode-line-modified
       mode-line-remote)
      display (min-width (5.0)))
     mode-line-frame-identification mode-line-buffer-identification
     "   " mode-line-position (vc-mode vc-mode) "  "
     mode-line-misc-info mode-line-end-spaces "   " mode-line-modes))
 '(org-M-RET-may-split-line nil)
 '(org-agenda-current-time-string "← now ────────────────────────────────────")
 '(org-agenda-time-grid
   '((daily today require-timed) (800 1000 1200 1400 1600 1800 2000 2200)
     " ┄┄┄┄" "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄"))
 '(org-babel-load-languages '((emacs-lisp . t) (shell . t)))
 '(org-clock-idle-time 1)
 '(org-columns-default-format
   "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM(Total Time Spent){:} %PRIORITY")
 '(org-html-preamble-format
   '(("en"
      "<p class=\\\"author\\\">Author: %a (%e)</p>\12<p class=\\\"date\\\">Date: %d</p>\12<p class=\\\"creator\\\">%c</p>\12<p class=\\\"validation\\\">%v</p>")))
 '(org-journal-file-type 'weekly)
 '(org-log-done 'time)
 '(org-log-into-drawer t)
 '(org-return-follows-link t)
 '(org-show-notification-timeout 7)
 '(org-startup-indented t)
 '(outline-minor-mode-cycle t)
 '(outline-minor-mode-highlight t)
 '(package-selected-packages
   '(@ ace-jump-mode ace-link add-node-modules-path afternoon-theme aio
       anzu async auto-rename-tag auto-yasnippet bluetooth bongo burly
       closql company company-prescient crontab-mode csv-mode dash
       desktop+ diff-hl dired-git-info dired-imenu dired-toggle-sudo
       docker-compose-mode dockerfile-mode doct doom-modeline
       edit-indirect elfeed-dashboard elfeed-org emacs-everywhere
       emmet-mode erc-hl-nicks esh-autosuggest
       eshell-syntax-highlighting exec-path-from-shell exotica-theme
       expand-region eyuml fancy-dabbrev flow-minor-mode flycheck
       flycheck-pos-tip frame-tabs gh git-link git-modes gited
       github-explorer gitignore-templates gnus-desktop-notify
       golden-ratio gptel guix hackernews haskell-mode
       haskell-snippets ibuffer-git ibuffer-project imenu-anywhere
       imenu-list impatient-mode indent-bars indent-guide inf-mongo
       js2-mode js2-refactor json-navigator le-thesaurus
       link-hint loccur logview magit markdown-mode minuet move-dup
       multi-term nodejs-repl npm npm-mode orderless org-brain
       org-bullets org-cliplink org-drill org-preview-html
       outline-magic paradox paredit pdf-tools pdf-view-restore
       plantuml-mode polymode popup-kill-ring prettier prettier-js
       project-explorer rainbow-delimiters react-snippets reddigg
       restclient rjsx-mode sass-mode scss-mode shell-pop simpleclip
       sqlup-mode stumpwm-mode tagedit toggle-test transient tree-mode
       tree-sitter-langs treemacs treepy twittering-mode
       typescript-mode use-package vertico vlf webpaste which-key
       why-this xref-js2 xterm-color yafolding yaml yasnippet
       yasnippet-snippets))
 '(package-vc-selected-packages
   '((ecb :vc-backend Git :url "https://github.com/tec-leo/ecb")
     (minuet-ai :vc-backend Git :url
		"https://github.com/milanglacier/minuet-ai.el")
     (transient-showcase :url
			 "https://github.com/positron-solutions/transient-showcase.git")))
 '(paradox-github-token t)
 '(pdf-view-incompatible-modes
   '(linum-mode linum-relative-mode helm-linum-relative-mode nlinum-mode
		nlinum-hl-mode nlinum-relative-mode yalinum-mode))
 '(pdf-view-midnight-colors '("gray80" . "gray9"))
 '(pe/width 25)
 '(plantuml-default-exec-mode 'executable)
 '(plantuml-indent-level 3)
 '(project-switch-commands
   '((project-find-file "Find file" nil)
     (project-find-regexp "Find regexp" nil)
     (project-find-dir "Find directory" nil)
     (project-vc-dir "VC-Dir" nil) (project-eshell "Eshell" nil)
     (project-eshell "Shell" 115)))
 '(project-vc-ignores '("/tmp/"))
 '(recentf-exclude
   '("/git-rebase-todo\\'"
     "/\\(\\(\\(COMMIT\\|NOTES\\|PULLREQ\\|MERGEREQ\\|TAG\\)_EDIT\\|MERGE_\\|\\)MSG\\|\\(BRANCH\\|EDIT\\)_DESCRIPTION\\)\\'"
     ".*/\\.cache/.*"
     ".*/\\.emacs\\.d/elpa/.*" ".*/media/.*" "/tmp/"
     "/usr/local/share/emacs/.*"
     "/node_modules/"))
 '(recentf-max-menu-items 1500)
 '(recentf-max-saved-items 1500)
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(shell-pop-shell-type
   '("shell" "*shell*" (lambda nil (shell shell-pop-term-shell))))
 '(show-paren-mode t)
 '(show-paren-when-point-in-periphery t)
 '(shr-indentation 2 t)
 '(shr-use-colors nil)
 '(shr-width 70)
 '(size-indication-mode t)
 '(sql-electric-stuff 'semicolon)
 '(sql-mode-hook '(sqlup-mode sqlind-minor-mode electric-indent-mode) t)
 '(sqlup-blacklist '("name"))
 '(sr-speedbar-default-width 20)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-skip-other-window-p t)
 '(tab-bar-mode t)
 '(tab-bar-new-tab-choice "*scratch*")
 '(tab-bar-select-tab-modifiers '(meta))
 '(tab-bar-tab-hints t)
 '(tab-bar-tab-name-function 'tab-bar-tab-name-truncated)
 '(tgt-open-in-new-window nil)
 '(tgt-projects
   '(((:root-dir "~/dev/experiment/testing/") (:src-dirs "src")
      (:test-dirs "test" "integration")
      (:test-suffixes ".test" "_test"))))
 '(tool-bar-mode nil)
 '(trash-directory "~/trash")
 '(tree-widget-space-width 1.5)
 '(twittering-fill-column 70)
 '(vc-annotate-background-mode nil)
 '(vc-diff-switches "-u -w")
 '(vc-git-diff-switches nil)
 '(view-read-only t))

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'cl-lib)
(when (cl-some (lambda (pkg) (not (package-installed-p pkg))) package-selected-packages)
  (message "First-time boot: installing missing packages from MELPA...")
  (package-refresh-contents)
  (package-install-selected-packages t))

(when (fboundp 'yas-global-mode)
  (yas-global-mode 1))
(fringe-mode 0)
(toggle-frame-fullscreen)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(require 'js2-refactor nil t)
(require 'xref-js2 nil t)

(global-set-key (kbd "C-c r") 'replace-regexp)
(global-set-key (kbd " C-c i") 'imenu)
(global-set-key (kbd "C-c .") 'imenu-list)
(global-set-key (kbd "C-c \"") 'imenu-anywhere)

(add-hook 'after-init-hook 'global-company-mode)
(when (fboundp 'global-diff-hl-mode)
  (global-diff-hl-mode))
;; (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
;; (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(require 'company-yasnippet nil t)

;;(push '(company-semantic :with company-yasnippet) company-backends)
;;(setq lsp-completion-provider :none)


(global-set-key (kbd "C-c [") 'yas-insert-snippet)
;;(global-set-key (kbd "<menu>") 'company-yasnippet)
;; (imenu-list-minor-mode)
;; (global-set-key (kbd "C-c '") #'imenu-list-smart-toggle)
;; (setq imenu-list-auto-resize t)
;; (setq imenu-list-focus-after-activation t)
;; (setq imenu-list-after-jump-hook nil)

;;(require 'popup-switcher)
;; (global-set-key [f4] 'psw-switch-buffer)
;; (global-set-key (kbd "C-c z") 'psw-switch-function)
;; (setq psw-popup-menu-max-length 15)
;; (setq psw-enable-single-dot-to-navigate-files t)
;; (global-set-key (kbd "C-c d ") 'psw-navigate-files)

(global-set-key (kbd "C-Y ") 'popup-kill-ring)
(global-set-key (kbd "M-s f") 'find-library)
(global-set-key (kbd "M-s s") 'shortdoc)
;;(require 'sr-speedbar)
;; (global-set-key (kbd "C-`") 'sr-speedbar-toggle)
(global-set-key (kbd "C-c C-b") 'bookmark-set)
(global-set-key (kbd "C-c b") 'bookmark-jump)
(global-set-key (kbd "C-c j") 'bookmark-jump-other-window)

;; (doom-modeline-mode)
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
	    (defun custom-dired (arg1 &rest args)
	      (interactive "GDired (directory):")
	      (unless (ignore-errors (apply 'dired (list arg1)))
		(let ((input (completing-read "Directory nil! Create one? " '("no" "yes"))))
		  (if (string= input "yes")
		      (progn (dired-create-directory arg1) (dired arg1))))))
	    (global-set-key (kbd "C-x d") 'custom-dired)))
;; (add-hook 'dired-mode-hook
;;           (lambda ()
;;             ;; Set dired-x buffer-local variables here.  For example:
;;             ;; (dired-omit-mode 1)
;; 	    (dired-hide-details-mode)
;;             ))
;;(require 'desktop)
;;  (require 'nameses)
;; ;; (require 'ido) 
;;  (global-set-key (kbd "<f8>")     'nameses-load)
;;  (global-set-key (kbd "C-<f8> p")   'nameses-prev)
;;  (global-set-key (kbd "C-<f8> s") 'nameses-save)
;;   (global-set-key (kbd "C-<f8> r") 'nameses-reset)

;;(require 'win-switch)
;; (win-switch-setup-keys-ijkl "\C-xo")
;; (global-set-key (kbd "C-x o") nil)
;; (global-set-key (kbd "C-x o f") 'win-switch-right)
;; (global-set-key (kbd "C-x o b") 'win-switch-left)
;; (global-set-key (kbd "C-x o p") 'win-switch-up)
;; (global-set-key (kbd "C-x o n") 'win-switch-down)
;; (global-set-key (kbd "C-x o o") 'win-switch-dispatch)
;; (global-set-key (kbd "C-x o c") 'win-switch-previous-window)
;; (global-set-key (kbd "C-x o v") 'win-switch-next-window)
;; (global-display-line-numbers-mode)

(global-set-key (kbd "M-p") 'move-dup-move-lines-up)
(global-set-key (kbd "M-n") 'move-dup-move-lines-down)
(global-set-key (kbd "C-c C-p") 'move-dup-duplicate-up)
(global-set-key (kbd "C-c C-n") 'move-dup-duplicate-down)

(which-function-mode 1)

(global-set-key (kbd "C-c t") 'tgt-toggle)
;;(require 'scss-mode)
;;(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(eval-after-load 'sass-mode
  '(progn
     (add-hook 'sass-mode-hook #'add-node-modules-path)))


(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))       

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))
(use-package docker-compose-mode)

;; (global-set-key (kbd "<f1>")     'mode-line-other-buffer)
;; (global-set-key (kbd "<C-f1>")     'buffer-menu-other-window)

;;(exec-path-from-shell-initialize)

;; (require 'projectile)
;; ;; Recommended keymap prefix on macOS
;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; ;; Recommended keymap prefix on Windows/Linux
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; (projectile-mode +1)
;; (setq projectile-sort-order 'modification-time) 

;;(ido-mode t)
;;(require 'projectile-git-autofetch)
;;(projectile-git-autofetch-mode 1)






;; (helm-mode)
;; (require 'helm-xref)
;; (define-key global-map [remap find-file] #'helm-find-files)
;; (define-key global-map [remap execute-extended-command] #'helm-M-x)
;; (define-key global-map [remap switch-to-buffer] #'helm-mini)
(which-key-mode)
;;(add-hook 'prog-mode-hook #'lsp)
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      ;; company-idle-delay 0.0
      ;; company-minimum-prefix-length 1
      ;; create-lockfiles nil
      ) ;; lock files will kill `npm start'
;; (with-eval-after-load 'lsp-mode
;;   (require 'dap-chrome)
;;   (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
;;   (yas-global-mode))

;;(global-set-key (kbd "<menu>")  'helm-mini)
;; (global-set-key (kbd "C-x p q")  'treemacs-display-current-project-exclusively)

;; (use-package treemacs
;;   :ensure t
;;   :defer t
;;   :init
;;   (with-eval-after-load 'winum
;;     (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
;;   :config
;;   (progn
;;     (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
;;           treemacs-deferred-git-apply-delay      0.5
;;           treemacs-directory-name-transformer    #'identity
;;           treemacs-display-in-side-window        t
;;           treemacs-eldoc-display                 t
;;           treemacs-file-event-delay              5000
;;           treemacs-file-extension-regex          treemacs-last-period-regex-value
;;           treemacs-file-follow-delay             0.2
;;           treemacs-file-name-transformer         #'identity
;;           treemacs-follow-after-init             t
;;           treemacs-expand-after-init             t
;;           treemacs-git-command-pipe              ""
;;           treemacs-goto-tag-strategy             'refetch-index
;;           treemacs-indentation                   2
;;           treemacs-indentation-string            " "
;;           treemacs-is-never-other-window         nil
;;           treemacs-max-git-entries               5000
;;           treemacs-missing-project-action        'ask
;;           treemacs-move-forward-on-expand        nil
;;           treemacs-no-png-images                 nil
;;           treemacs-no-delete-other-windows       t
;;           treemacs-project-follow-cleanup        nil
;;           treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
;;           treemacs-position                      'left
;;           treemacs-read-string-input             'from-child-frame
;;           treemacs-recenter-distance             0.1
;;           treemacs-recenter-after-file-follow    nil
;;           treemacs-recenter-after-tag-follow     nil
;;           treemacs-recenter-after-project-jump   'always
;;           treemacs-recenter-after-project-expand 'on-distance
;;           treemacs-litter-directories            '("/node_modules" "/.venv" "/.cask")
;;           treemacs-show-cursor                   nil
;;           treemacs-show-hidden-files             t
;;           treemacs-silent-filewatch              nil
;;           treemacs-silent-refresh                nil
;;           treemacs-sorting                       'alphabetic-asc
;;           treemacs-space-between-root-nodes      t
;;           treemacs-tag-follow-cleanup            t
;;           treemacs-tag-follow-delay              1.5
;;           treemacs-user-mode-line-format         nil
;;           treemacs-user-header-line-format       nil
;;           treemacs-width                         35
;;           treemacs-width-is-initially-locked     t
;;           treemacs-workspace-switch-cleanup      nil)

;;     ;; The default width and height of the icons is 22 pixels. If you are
;;     ;; using a Hi-DPI display, uncomment this to double the icon size.
;;     ;;(treemacs-resize-icons 44)

;;     (treemacs-follow-mode t)
;;     (treemacs-filewatch-mode t)
;;     (treemacs-fringe-indicator-mode 'always)
;;     (pcase (cons (not (null (executable-find "git")))
;;                  (not (null treemacs-python-executable)))
;;       (`(t . t)
;;        (treemacs-git-mode 'deferred))
;;       (`(t . _)
;;        (treemacs-git-mode 'simple))))
;;   :bind
;;   ;; (:map global-map
;;   ;;       ("M-0"       . treemacs-select-window)
;;   ;;       ("C-x t 1"   . treemacs-delete-other-windows)
;;   ;;       ("C-x t t"   . treemacs)
;;   ;;       ("C-x t B"   . treemacs-bookmark)
;;   ;;       ("C-x t C-t" . treemacs-find-file)
;;   ;;       ("C-x t M-t" . treemacs-find-tag)
;;   ;;        :map treemacs-mode-map
;;   ;;        ("v" . treemacs-peek))
;;   )

;; (use-package treemacs-icons-dired
;;   :after (treemacs dired)
;;   :ensure t
;;   :config (treemacs-icons-dired-mode))

;; (use-package treemacs-magit
;;   :after (treemacs magit)
;;   :ensure t)

;; (use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
;;   :after (treemacs persp-mode) ;;or perspective vs. persp-mode
;;   :ensure t
;;     :config (treemacs-set-scope-type 'Perspectives))


(require 'anzu)
(global-anzu-mode +1)

(set-face-attribute 'anzu-mode-line nil
                    :foreground "yellow" :weight 'bold)



(global-set-key (kbd "C-c r") 'anzu-query-replace)
(global-set-key (kbd "C-c C-r r") 'anzu-query-replace-at-cursor)
(global-set-key (kbd "C-c C-r x") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c C-r b") 'anzu-replace-at-cursor-thing)

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("STARTED" . "yellow")
        ("CANCELED" . (:foreground "blue" :weight bold))))


(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-x C-a") 'calendar)
;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))



;; (add-to-list 'load-path(expand-file-name "~/.emacs.d/hydra-configs"))
;; (load-library "hydra-org-agenda")
;; ;;(load-library "hydra-dired")
;; (load-library "hydra-yasnippet")
;; (load-library "hydra-smartparens")	
;; (load-library "hydra-multi-cursors")	
;; (load-library "hydra-tabbar")
;; (load-library "hydra-hs")	
;; (load-library "hydra-smerge")	
;; ;; (load-library "hydra-projectile")		
;; (load-library "hydra-js2-refactor")		


(setq org-confirm-elisp-link-function nil)


(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; (defhydra hydra-zoom (global-map "<f3>")
;;   "zoom"
;;   ("g" text-scale-increase "in")
;;   ("l" text-scale-decrease "out"))

(require 'multiple-cursors)
(global-set-key (kbd "C-c C-x C-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-x {") 'mc/insert-letters)
(global-set-key (kbd "C-c C-x }") 'mc/insert-numbers)
(global-set-key (kbd "C-c C-x C-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-x C-a") 'mc/mark-all-dwim)
(global-set-key (kbd "C-c C-x C-d") 'mc/mark-next-like-this-word)
(global-set-key (kbd "C-c C-x C-s") 'mc/mark-next-like-this-symbol)
(global-set-key (kbd "C-c C-x C-p") 'mc/mark-pop)

(defun hello ()
  "Hello World and you can call it via M-x hello."
  (interactive)
  (message "Hello World!"))
(defun hello2 (someone)
  "Say hello to SOMEONE via M-x hello."
  (interactive "sWho do you want to say hello to? ")
  (message "Hello %s!" someone))      
(defun multiple-hello (someone num)
  "Say hello to SOMEONE via M-x hello, for NUM times."
  (interactive "sWho do you want to say hello to? \nnHow many times? ")
  (dotimes (i num)
    (insert (format "Hello %s!\n" someone))))

(global-set-key (kbd "C-c = c") #'aya-create)
(global-set-key (kbd "C-c = e") #'aya-expand)
(global-set-key (kbd "C-c = o") #'aya-create-one-line)
(global-set-key (kbd "C-c = p") #'aya-persist-snippet)


;; https://emacs.stackexchange.com/a/68421/34424

;; (defun my-C-w-dwim (&optional arg)
;;   "`delete-backward-char`, but if region is active then kill region.
;; With prefix arg N, delete backward to the start of the Nth word."
;;   (interactive "P")
;;   (cond (arg
;;          (my-backward-delete-word (prefix-numeric-value arg)))
;;         ((use-region-p)
;;          (kill-region (region-beginning) (region-end)))
;;         (t (delete-backward-char 1))))


;; (defun my-backward-delete-word (arg)
;;   "Like `backward-kill-word`, but just delete."
;;   (interactive "p")
;;   (delete-region (point) (progn (backward-word arg) (point))))


;; (global-set-key (kbd "C-M-w") 'my-C-w-dwim) 
;; (global-set-key (kbd "C-w") 'my-backward-delete-word) 


;;

(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; These two lines are just examples

;;(add-to-list 'load-path(expand-file-name "~/.emacs.d/configs/main"))
(load "~/.emacs.d/configs/main" nil t)
;; (load "~/.emacs.d/configs/orgjournal" nil t)
;; (load "~/.emacs.d/configs/org-super-agenda" nil t)
(load "~/.emacs.d/configs/yas-company" nil t)
(load "~/.emacs.d/configs/elfeed" nil t)
(load "~/.emacs.d/configs/persp-config" nil t)
(load "~/.emacs.d/configs/gnus-config" nil t)
(load "~/.emacs.d/configs/pcomplete/shell-commands" nil t)
(load "~/.emacs.d/configs/gpt-minuet.el" nil t)

;; https://www.emacswiki.org/emacs/DiredSortBySizeAndExtension
(load "~/.emacs.d/configs/dired-fixups" nil t)
;; (company-prescient-mode)

;;https://emacs.stackexchange.com/questions/2764/elisp-added-one-key-binding-to-dired-mode-and-lost-basic-dired-functionality
(defun dc/dired-mode-keys ()
  "User defined keys for dired mode."
  (interactive)
  (local-set-key (kbd "b") 'dired-up-directory)
  (local-set-key (kbd ",") 'dired-create-empty-file)
  (local-set-key (kbd "/") 'dired-create-directory)
  (local-set-key (kbd "r") 'dired-do-rename)
  (local-set-key (kbd "c") 'dired-do-copy)
  (local-set-key (kbd "{") 'grep-find)
  (local-set-key (kbd "}") 'find-lisp-find-dired)
  (local-set-key (kbd "C") 'dired-do-compress)
  (local-set-key (kbd "K") 'dired-kill-subdir)
  )
(add-hook 'dired-mode-hook 'dc/dired-mode-keys)
(global-set-key (kbd "C-&") 'org-mark-ring-goto) 
(global-set-key (kbd "C-c C-SPC") 'shell-pop) 
(global-set-key (kbd "C-c SPC") 'shell) 
;;(setq lsp-completion-provider :none)

;; customized shell-pop functions
;; all of this editing to remove `cd` line in comint history
(with-eval-after-load 'shell-pop
  (defun shell-pop--cd-to-cwd-shell (cwd)
    (goto-char (point-max))
    (comint-kill-input)
    ;; doesn't goes into the bash history variable
    (insert (concat "  cd " (shell-quote-argument cwd)))

    ;; directly modify cd withou typing in the prompt
    ;; (comint-redirect-send-command-to-process
    ;;  (concat "cd " (shell-quote-argument cwd)) nil (get-buffer-process (current-buffer)) nil t)
    
    (let ((comint-process-echoes t))
      (comint-send-input))
    (recenter 0))
  (defun shell-pop--cd-to-cwd-term (cwd)
    ;; (term-send-raw-string (concat "cd " (shell-quote-argument cwd) "\n"))
    (comint-redirect-send-command-to-process
     (shell-quote-argument cwd) nil (get-buffer-process (current-buffer)) nil t)
    (comint-send-input)
    (term-send-raw-string "\C-l")
    )
  (defun shell-pop-up (index)
    (run-hooks 'shell-pop-in-hook)
    (let ((w (if (listp index)
		 (let ((ret (shell-pop-get-unused-internal-mode-buffer-window)))
                   (setq index (car ret))
                   (cdr ret))
               (shell-pop-get-internal-mode-buffer-window index)))
          (cwd (replace-regexp-in-string "\\\\" "/" default-directory)))
      (when (shell-pop--full-p)
	(setq shell-pop-window-configuration
              (list (current-window-configuration) (point-marker)))
	(delete-other-windows))
      (if w
          (select-window w)
	;; save shell-pop-last-buffer and shell-pop-last-window to return
	(setq shell-pop-last-buffer (buffer-name)
              shell-pop-last-window (selected-window))
	(when (and (not (= shell-pop-window-height 100))
                   (not (shell-pop--full-p)))
          (let ((new-window (shell-pop-split-window)))
            (select-window new-window)))
	(when (and shell-pop-default-directory (file-directory-p shell-pop-default-directory))
          (cd shell-pop-default-directory))
	(shell-pop--switch-to-shell-buffer index))
      ;; (when (and shell-pop-autocd-to-working-dir
      ;;            (not (string= cwd default-directory)))
      ;;   (shell-pop--cd-to-cwd cwd))
      (shell-pop--cd-to-cwd cwd)
      (run-hooks 'shell-pop-in-after-hook))))

;; (shell-pop-set-internal-mode "ansi-term")
;; (shell-pop-set-internal-mode-shell "/bin/zsh")
					;https://tuhdo.github.io/helm-projectile.html
;; (setq projectile-other-file-alist '(("cpp" "h" "hpp" "ipp")
;;   ("tsx" "css")
;;   ("css" "tsx")
;;   ("jsx" "css")
;;   ("css" "jsx")
;;   ("html" "js" "css")
;;   ("ipp" "h" "hpp" "cpp")
;;   ("hpp" "h" "ipp" "cpp")
;;   ("cxx" "hxx" "ixx")
;;   ("ixx" "cxx" "hxx")
;;   ("hxx" "ixx" "cxx")
;;   ("c" "h")
;;   ("m" "h")
;;   ("mm" "h")
;;   ("h" "c" "cpp" "ipp" "hpp" "m" "mm")
;;   ("cc" "hh")
;;   ("hh" "cc")
;;   ("vert" "frag")
;;   ("frag" "vert")
;;   (nil "lock" "gpg")
;;   ("lock" "")
;;   ("gpg" ""))
;;   )

;; (add-to-list 'projectile-other-file-alist '("html" "js" "css")) ;; switch from html -> js
;;(add-to-list 'company-backends 'company-capf 'company-yasnippet)


;;emacs.stackexchange.com/a/10520
;; to include yasnippets in completion popup

;;

;; (setq company-backends
;;       '((company-capf :with company-yasnippet)))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "RET") nil))

;; (setq lsp-completion-provider (company-dabbrev :with company-yasnippet) ) 
;;(company-dabbrev :with company-yasnippet)        

;;https://stackoverflow.com/a/18685171/8495763
;; (set-face-attribute 'region nil :background "#333")



(git-mode)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


;; Capitalize keywords in SQL mode
;; (add-hook 'sql-mode-hook 'sqlup-mode)
;; Capitalize keywords in an interactive session (e.g. psql)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)
;; Set a global keyword to use Sqlup on a region
;; (global-set-key (kbd "C-c u") 'sqlup-capitalize-keywords-in-region)
(load-file "~/.emacs.d/configs/mysql.el")

(add-hook
 'sql-interactive-mode-hook
 (lambda ()
   ;; (defun sql-custom-cmd (ab)
   ;;   (interactive "P")
   ;;   (call-interactively 'my-sql-magic-semicolon)
   ;;   )
   ;; custom function, `:' behaves like pressing `;' in sql mode
   (define-key sql-interactive-mode-map (kbd "RET") 'sql-accumulate-and-indent)
   (define-key sql-interactive-mode-map (kbd "C-j") 'fancy-dabbrev-expand)
   (define-key sql-interactive-mode-map (kbd "M-RET") (lambda (a) (interactive "P") (call-interactively 'my-sql-magic-semicolon)))
   (setq-local company-backends '(company-mysql-backend))
   
   ;; (define-key sql-interactive-mode-map (kbd ":") sql-custom-cmd )
   ))

;;activate modes in term
;; (setq value 0)

;; (global-set-key (kbd "C-<menu>") 
;;  (lambda ()
;;           (interactive)
;;           (cond ((eq value 0) value

;;        (term-line-mode)
;;         (setq value 1))

;;       ((eq value 1) value
;;        (term-char-mode)
;;        (setq value 0))
;;       (t "Should not be here"))
;;           )
;; ) 

;;https://www.reddit.com/r/emacs/comments/4p0yx7/how_to_handle_warning_terminal_is_not_fully/
(setenv "PAGER" "cat")

(global-set-key (kbd "C-<f3>") 
		(lambda ()
		  (interactive)
		  ;;(async-shell-command "xterm -bc -e emacs -Q -nw -l ~/.emacs-term")) )
		  (async-shell-command "xterm -e screen -p +")) )


;; ? (put 'scroll-left 'disabled nil)

;;https://stackoverflow.com/a/45363946/
(define-key global-map [(meta up)] '(lambda() (interactive) (scroll-other-window -1)))
(define-key global-map [(meta down)] '(lambda() (interactive) (scroll-other-window 1)))

;;https://stackoverflow.com/questions/19907939/how-can-one-quickly-browse-through-lots-of-files-in-emacs#comment65240681_19933337
;;START
;; little modification to dired-mode that let's you browse through lots of files
(add-hook 'dired-mode-hook
	  (lambda()
	    (define-key dired-mode-map (kbd "C-o") 'dired-view-current)     ; was dired-display-file
	    (define-key dired-mode-map (kbd "C-n")   'dired-view-next)           ; was dired-next-line
	    (define-key dired-mode-map (kbd "C-p")   'dired-view-previous)
	    (define-key dired-mode-map (kbd "C-c C-f")   (lambda () (interactive) (find-file-literally (dired-filename-at-point)) (view-mode)))
	    (define-key dired-mode-map (kbd "I")   '(lambda ()
						      (interactive)
						      (dired-do-shell-command "fim")))
	    )) ; was dired-previous-line

(defun dired-view-next ()

  (interactive)
  (dired-next-line 1)
  (dired-view-current))

(defun dired-view-previous ()

  (interactive)
  (dired-previous-line 1)
  (dired-view-current))

(defun dired-view-current ()

  (interactive)
  (if (not (window-parent))
      (split-window))                                  
  (let ((file (dired-get-file-for-visit))
        (dbuffer (current-buffer)))
    (other-window 1)                                   
    (unless (equal dbuffer (current-buffer))              
      (if (or view-mode (equal major-mode 'dired-mode))   
          (kill-buffer)))                                                    
    (let ((filebuffer (get-file-buffer file)))
      (if filebuffer                        
          (switch-to-buffer filebuffer)     
        (view-file file))                   
      (other-window -1))))                  

;;END      

;;https://emacs.stackexchange.com/a/16470
(setq smerge-command-prefix "\C-cv")

;;https://www.emacswiki.org/emacs/DiredOmitMode
(setq my-dired-ls-switches "-alh --ignore=.* --ignore=\\#* --ignore=*~")
(setq my-dired-switch 1)

(add-hook 'dired-mode-hook
          (lambda ()
            "Set the right mode for new dired buffers."
            (when (= my-dired-switch 1)
              (dired-sort-other my-dired-ls-switches))))

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "M-.")
			(lambda ()
			  "Toggle between hide and show."
			  (interactive)
			  (setq my-dired-switch (- my-dired-switch))
			  (if (= my-dired-switch 1)
			      (dired-sort-other my-dired-ls-switches)
			    (dired-sort-other "-alh"))))))


;; https://www.emacswiki.org/emacs/DiredSortDirectoriesFirst
(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header 
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))

(defadvice dired-readin
    (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))


;;https://stackoverflow.com/a/19049715/
;;(define-key dired-mode-map (kbd "s") 'dired-do-symlink)

(with-eval-after-load 'dired
  (define-key dired-mode-map ")" 'dired-git-info-mode))
(setq dgi-auto-hide-details-p nil)
;; (add-hook 'dired-after-readin-hook 'dired-git-info-auto-enable)

(defadvice dired-next-line (around dired-next-line+ activate)
  "Replace current buffer if file is a directory."
  ad-do-it
  (while (and  (not  (eobp)) (not ad-return-value))
    (forward-line)
    (setq ad-return-value(dired-move-to-filename))
    )
  (when (eobp)
    (forward-line -1)
    (setq ad-return-value(dired-move-to-filename))
    )
  )


(defadvice dired-next-line (around dired-next-line+ activate)
  "Replace current buffer if file is a directory."
  ad-do-it
  (while (and  (not  (eobp)) (not ad-return-value))
    (forward-line)
    (setq ad-return-value(dired-move-to-filename))
    )
  (when (eobp)
    (forward-line -1)
    (setq ad-return-value(dired-move-to-filename))
    )
  )

;;https://www.emacswiki.org/emacs/DiredLineCommands
(defadvice dired-previous-line (around dired-previous-line+ activate)
  "Replace current buffer if file is a directory."
  ad-do-it
  (while (and  (not  (bobp)) (not ad-return-value))
    (forward-line -1)
    (setq ad-return-value(dired-move-to-filename))
    )
  (when (bobp)
    (call-interactively 'dired-next-line)
    )
  )
(defmacro ap/elfeed-search-at-entry (entry &rest body)
  "Eval BODY with point at ENTRY."
  (declare (indent defun))
  `(when-let* ((n (cl-position ,entry elfeed-search-entries)))
     (elfeed-goto-line (+ elfeed-search--offset n))
     ,@body))

(defun ap/elfeed-search-excerpt-toggle-selected ()
  "Toggle excerpts on selected entries."
  (interactive)
  (--each (elfeed-search-selected)
    (ap/elfeed-search-at-entry it
      (ap/elfeed-excerpt-toggle))))

(defun ap/elfeed-excerpt-toggle ()
  (interactive)
  (or (ap/elfeed-excerpt-hide)
      (ap/elfeed-excerpt-insert)))

(defun ap/elfeed-excerpt-hide ()
  (interactive)
  (when-let ((pos (1+ (line-end-position)))
             (overlay (car (ov-in 'type 'excerpt pos pos))))
    (delete-overlay overlay)
    t))

(defun ap/elfeed-wrap-string (string length)
  "Wrap STRING to LENGTH."
  (if (<= (length string) length)
      string
    (s-trim (with-temp-buffer
              (insert string)
              (let ((fill-column length))
                (fill-region (point-min) (point-max))
                (buffer-string))))))


;;; vertico-mode
(load "~/.emacs.d/configs/vertico-config.el" nil t)
;; (icomplete-vertical-mode)
;; (defun my-icomplete-styles ()
;;   ;; (setq-local completion-styles '(initials flex)))
;;   (setq-local completion-styles '(flex))
;;   (define-key icomplete-minibuffer-map (kbd "TAB") 'icomplete-force-complete))
;; (add-hook 'icomplete-minibuffer-setup-hook 'my-icomplete-styles)
;; (fido-vertical-mode)

;;; shortcuts
;;; multi-cursor
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;;; org-brain
;;(require 'org-brain)
;; (require 'polymode)
(use-package org-brain :ensure t
  :init
  (setq org-brain-child-linebreak-sexp 0)
  
  :config
  (bind-key "C-c b" 'org-brain-prefix-map org-mode-map)
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
  (add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates)
  (global-set-key (kbd "C-c w") '(lambda () (interactive) (org-brain-visualize "index")))
  ;; (setq org-brain-visualize-default-choices 'all)
  ;; (setq org-brain-title-max-length 12)
  ;; (setq org-brain-include-file-entries nil
  ;;       org-brain-file-entries-use-title nil)
  (add-hook
   'org-brain-visualize-mode-hook
   (lambda ()
     (define-key org-brain-visualize-mode-map (kbd "j") 'org-brain-pin)
     (define-key org-brain-visualize-mode-map (kbd "p") 'backward-button)
     (define-key org-brain-visualize-mode-map (kbd "C-M-i") 'backward-button)
     (define-key org-brain-visualize-mode-map (kbd "[") 'org-brain-add-parent)
     (define-key org-brain-visualize-mode-map (kbd "[") 'org-brain-add-parent)
     (define-key org-brain-visualize-mode-map (kbd "{") 'org-brain-remove-parent)
     (define-key org-brain-visualize-mode-map (kbd "n") 'forward-button)
     (define-key org-brain-visualize-mode-map (kbd "x") 'org-brain-switch-brain)
     (define-key org-brain-visualize-mode-map (kbd "C-c C-h") 'org-brain-hide-descendant-level)
     ))
  )

;;(define-key org-brain-prefix-map (kbd "C-c f") 'org-brain-visualize)
;;(use-package polymode
;;  :config
;;  (add-hook 'org-brain-visualize-mode-hook #'org-brain-polymode))

;;; eww
(global-set-key (kbd "C-c e") 'eww )
;;; Lisp specific defuns
;; http://emacsrocks.com/e13.html
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
(global-set-key (kbd "C-x C-1") 'eval-and-replace)
;; (global-set-key (kbd "C-x C-q") 'read-only-mode)
(global-set-key (kbd "C-x C-M-i") 'eval-print-last-sexp)

;; outline mode
(add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
(add-hook 'outline-minor-mode-hook
          (lambda ()
            (define-key outline-minor-mode-map (kbd "C-c C-c") 'outline-cycle)))

;;; security
(epa-file-enable)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
;; GPG key to use for encryption
;; Either the Key ID or set to nil to use symmetric encryption.
(setq org-crypt-key nil)

;;; ace-link
(ace-link-setup-default)
(define-key org-mode-map (kbd "M-o") 'ace-link-org)
(define-key elfeed-show-mode-map (kbd "o") 'ace-link-eww)

;;; org-clip-link
(global-set-key (kbd "C-x p i") 'org-cliplink)
(setq org-capture-templates
      '(("K" "Cliplink capture task" entry (file "")
	 "* TODO %(org-cliplink-capture) \n  SCHEDULED: %t\n" :empty-lines 1)))

;;; pdf-tools
(when (display-graphic-p)
  (pdf-tools-install t))
(setq pdf-view-midnight-enabled t)
;; (setq pdf-view-midnight-enabled nil)
(defun pdf-enable-darktheme ()
  (define-key pdf-view-mode-map (kbd "b") 'pdf-view-scroll-down-or-previous-page)
  (if pdf-view-midnight-enabled (pdf-view-midnight-minor-mode))
  ;; (display-line-numbers-mode)
  )
(add-hook 'pdf-view-mode-hook 'pdf-enable-darktheme)

(use-package pdf-view-restore
  :after pdf-tools
  :config
  (add-hook 'pdf-view-mode-hook 'pdf-view-restore-mode))
(setq pdf-view-restore-filename "~/.emacs.d/.pdf-view-restore")
;;(eval-after-load "pdf-view-mode"
:;   '(define-key pdf-view-mode-map (kbd "b") 'pdf-view-scroll-down-or-previous-page))

;;; xterm
;; (load "~/.emacs.d/el_packages/xterm" nil t)
(defun open-term-in-frame ()
  (interactive)
  (let* ((cwd (string-trim-left (pwd) "^\\w+ "))
	(frame (make-frame))
	(shell-mode-p (string= mode-name "Shell"))
	(str (if shell-mode-p (buffer-substring (point-at-bol) (point-at-eol)))))
    (with-selected-frame frame
      (setenv "PWD" cwd)
      (ansi-term "/bin/bash")
      (toggle-frame-fullscreen)
      (if shell-mode-p
	  (term-send-raw-string str)))))
;; (global-set-key (kbd "C-c M-e") 'open-term-in-frame)
(defun open-xterm ()
    "DOCSTRING"
    (interactive)
    ;; (async-shell-command (concat "xterm -e " (string-trim-left (pwd) "^\\w+ ")))
    (async-shell-command "xterm")
  )
;; (global-set-key (kbd "C-c M-e") 'open-term-in-frame)
(global-set-key (kbd "C-c M-e") 'open-xterm)
;; (define-key shell-mode-map (kbd "C-c M-e") 'open-term-in-frame)

;;; tagedit
(defun test1 ()
  (search-forward-regexp "\\(}\\|\"\\)")
  (when (te/point-inside-string?)
    (forward-char -1)
    (te/forward-sexp))
  (set-mark (point))
  (te/backward-sexp)
  (search-backward " ")
  (forward-char 1))

(defun tagedit-test ()
  (interactive)
  (when (and (te/point-inside-tag-innards?)
             (not (looking-at ">")))
    (test1)
    (kill-region (1- (region-beginning)) (region-end))
    (just-one-space)
    (when (looking-at ">")
      (delete-char -1))))
(eval-after-load 'sgml-mode
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'sgml-mode-hook (lambda () (tagedit-mode 1)

				 (define-key sgml-mode-map (kbd "C-c C-t") 'nil)
				 (define-key sgml-mode-map (kbd "C-c C-t b") 'tagedit-forward-barf-tag)
				 (define-key sgml-mode-map (kbd "C-c C-t u") 'tagedit-forward-slurp-tag)
				 (define-key sgml-mode-map (kbd "C-c C-t r") 'tagedit-raise-tag)
				 (define-key sgml-mode-map (kbd "C-c C-t c") 'tagedit-splice-tag)
				 (define-key sgml-mode-map (kbd "C-c C-t j") 'tagedit-join-tags)
				 (define-key sgml-mode-map (kbd "C-c C-t s") 'tagedit-split-tag)
				 (define-key sgml-mode-map (kbd "C-c C-t o") 'tagedit-convolute-tags)
				 (define-key sgml-mode-map (kbd "C-c C-k") 'tagedit-kill)
				 (define-key sgml-mode-map (kbd "C-c C-t k ") 'tagedit-test)
				 (define-key sgml-mode-map (kbd "C-c C-t i") 'tagedit-goto-tag-content)
				 (define-key sgml-mode-map (kbd "C-j") 'fancy-dabbrev-expand)
				 ))))

;;; comment
(global-set-key (kbd "C-x :") 'comment-line)
(global-set-key (kbd "C-x ;") 'comment-line)
;;(global-set-key (kbd "C-x ;") 'comment-set-column)

;;; js2 paraedit quotes
;;(define-key js2-mode-map (kbd "M-\"") 'paredit-meta-doublequote)
(require 'paredit)
(global-set-key (kbd "M-\"") 'paredit-meta-doublequote)

;;; persp-mode
;; (with-eval-after-load "persp-mode-autoloads"
;; ;;  (setq wg-morph-on nil) ;; switch off animation
;;   (setq persp-autokill-buffer-on-remove 'kill-weak)
;; ;;  (setq persp-auto-resume-time 0.1)
;;   (add-hook 'window-setup-hook #'(lambda () (persp-mode 1))))

;;; bongo
(add-hook 'bongo-mode-hook
	  (lambda ()
	    (define-key bongo-mode-map (kbd "=")
			(lambda () (interactive)
			  (async-shell-command "amixer -c 0 set Master 2db-")))
	    (define-key bongo-mode-map (kbd "+")
			(lambda () (interactive)
			  (async-shell-command "amixer -c 0 set Master 2db+")))
	    (define-key bongo-mode-map (kbd ",") 'bongo-seek))
	  )
;;; html
;;;; emmet mode
;; (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook
	  (lambda ()
	    (define-key css-mode-map (kbd "C-:") 'emmet-expand-line)
	    (define-key css-mode-map (kbd "C-;") 'emmet-expand-yas)
	    (emmet-mode) ;; enable Emmet's css abbreviation.
	    )
	  )

;;(require 'html-my-attribute)

(add-hook 'html-mode-hook 'sgml-electric-tag-pair-mode)
(add-hook 'rjsx-mode-hook 'sgml-electric-tag-pair-mode)
;; (add-hook 'html-mode-hook (lambda ()
(add-hook 'sgml-mode-hook (lambda ()
			    (define-key html-mode-map (kbd "C-j") 'fancy-dabbrev)
			    (sgml-electric-tag-pair-mode t)
			    (define-key sgml-mode-map (kbd "C-:") 'emmet-expand-line)
			    (define-key sgml-mode-map (kbd "C-;") 'emmet-expand-yas)
			    )
	  
	  )

;;(add-hook 'html-mode-hook 'ivy-mode)

;;; ivy
;; https://writequit.org/denver-emacs/presentations/2017-04-11-ivy.html
;; (ivy-mode)
;; (use-package ivy :demand
;;       :config
;;       (setq ivy-use-virtual-buffers t
;;             ivy-count-format "%d/%d "))

;;; skeleton
(define-skeleton hello-class
  "ex of rep in"
  "ignored"
  ("enter name:" " hello," str \n))

;;; project
(defun pe/create-directory (file-name)
  "If FILE-NAME ends with a /, create a directory.
Otherwise an empty file."
  (interactive
   (let (( root (pe/current-directory)))
     (list (read-file-name "Create Directory: " root nil))))
  (cl-assert pe/data)
  (cl-assert (not (file-exists-p file-name)))
  (pe/with-continued-revert
   (let* (( is-directory (string-match-p "/$" file-name)))
     (make-directory (directory-file-name file-name))
     (pe/data-add file-name)
     (pe/set-tree nil 'refresh pe/data)
     (pe/show-file-prog file-name)
     )))
(global-set-key (kbd "C-x p q") 'project-explorer-toggle)
(add-hook 'project-explorer-mode-hook (lambda ()
					(define-key project-explorer-mode-map (kbd "/") 'pe/create-directory)
                                        (define-key project-explorer-mode-map (kbd ",") 'pe/create-file)))

;;; testing elisp
;; (defun npm-save-dev (dep)
;;   "enter sometinh"
;;   (interactive "sEnter packages:")
;;   (async-shell-command (format "npm install %s --save-dev" dep)))


;;; modes
;; auto fill comments
;; emacswiki: AutoFillMode
(defun comment-auto-fill ()
  (interactive)
  (setq-local comment-auto-fill-only-comments t)
  (auto-fill-mode 1))

;; (npm-mode)
;; (npm-global-mode)
;; (add-hook 'npm-mode-hook
;; 	  (global-set-key (kbd "C-x p n g")
;; 			  (defun npm-mode-npm-install-global (dep)
;; 			    "Run the 'npm install' command."
;; 			    (interactive "sEnter package name: ")
;; 			    (npm-mode--exec-process (format "npm install -g %s" dep)))))

;;; screen
;; (global-set-key (kbd "C-c SPC") (lambda ()
;; (interactive)
;; ;; stackoverflow.com/questions/1517414/how-can-i-make-gnu-screen-start-a-new-window-at-the-current-working-directory/1517488#1517488
;; (async-shell-command "screen -X eval \"chdir $PWD\" \"screen -t emacsh\"")
;; ) )

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; (defun npm-mode-npm-install-save (dep)
;;   "Run the 'npm install --save' command for DEP."
;;   ;; (interactive "sEnter package name: ")
;;   ;; (npm-mode--exec-process (format "npm install %s --save" dep))
;;     (interactive (list (completing-read-multiple "Enter package name: " '(webpack webpack-cli babel-loader @babel/core react react-redux redux react-router-dom express mongoose mongodb))))
;;   (npm-mode--exec-process (format "npm install %s --save-dev" (string-join dep " ")))
;;   )

;;; flycheck
;; (with-eval-after-load 'flycheck
;;   (flycheck-pos-tip-mode))

;;; js
;; (defvar flymake-keys (lambda ()
;; 			   (eglot-ensure)
;; 			   (define-key js2-mode-map (kbd "C-c f n") #'flymake-goto-next-error)
;; 			   (define-key js2-mode-map (kbd "C-c f p") #'flymake-goto-prev-error)
;; 			   (define-key js2-mode-map (kbd "C-c f l") #'flymake-show-buffer-diagnostics)
;; 			   (define-key js2-mode-map (kbd "C-c f P") #'flymake-show-project-diagnostics)
;; 			   (define-key js2-mode-map (kbd "C-c g a") #'eglot-code-actions)
;; 			   (define-key js2-mode-map (kbd "C-c g o") #'eglot-code-action-organize-imports)
;; 			   (define-key js2-mode-map (kbd "M-.") #'xref-find-definitions)
;; 			   ;; (add-to-list 'eglot-stay-out-of 'flymake)
;; 			   ))
;; (add-hook 'js2-mode-hook 'flymake-keys)

;; (add-hook 'rjsx-mode-hook 'flymake-keys)
;; (add-hook 'typescript-mode-hook 'flymake-keys)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(eval-after-load "rjsx-mode"
  '(define-key rjsx-mode-map (kbd "C-:") 'emmet-expand-yas))
(load-file "~/.emacs.d/configs/hooks.el")
;; (load-file ".emacs.d/configs/gpt-prompt")

(add-hook 'js2-mode-hook (lambda ()
			   ;; (js2-mode-toggle-warnings-and-errors)
			   (define-key js2-mode-map (kbd "C-c C-j")
				       (lambda () (interactive "")
					 (if current-prefix-arg
					     (call-interactively 'genArray)
					   (genArray 10))))
			   (define-key js2-mode-map (kbd "C-c C-c")
				       (lambda () (interactive)(compile (concat "time node --max-old-space-size=256 " (buffer-file-name))))
				       ;; (lambda () (interactive)(compile (concat "time node " (buffer-file-name))))
				       )
			   (comment-auto-fill)
			   ;; (npm-mode)
			   ;; (define-key js2-mode-map (kbd "C-x p n g")
			   ;; 		   (defun npm-mode-npm-install-global (dep)
			   ;; 		     "Run the 'npm install' command."
			   ;; 		     (interactive "sEnter package name: ")
			   ;; 		     (npm-mode--exec-process (format "npm install -g %s" dep))))
			   ))
;; (setq js2-mode-hook nil)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
;; (add-hook 'js2-mode-hook #'js2-mode-toggle-warnings-and-errors)
;; ;; (add-hook 'rjsx-mode-hook #'js2-mode-toggle-warnings-and-errors)
;; ;;(js2r-add-keybindings-with-prefix "C-c C-g")

;; (define-skeleton js2-equal
;;   "add equals"
;;   ""
;;   (cond ((equal current-prefix-arg nil) " = ")
;; 	((equal current-prefix-arg '(4)) " === ")
;; 	((eq '- current-prefix-arg) " !== ")
;; 	(t " => " )
;; 	))
(defun js2-equal (ab)
  "add equals"
  (interactive "P")
  (insert (cond ((equal current-prefix-arg nil) " = ")
	((equal current-prefix-arg '(4)) " === ")
	((eq '- current-prefix-arg) " !== ")
	(t " => " )
	))
  )
(define-key js2-mode-map (kbd "C-c C-e") 'js2-equal)

(add-hook 'tsx-ts-mode-hook
	  (lambda ()
	    (rjsx-minor-mode)
	    ;; (js2-mode-toggle-warnings-and-errors)
	    (define-key tsx-ts-mode-map (kbd "C-c C-e") 'js2-equal)
	    (define-key tsx-ts-mode-map (kbd "C-c C-f") 'rjsx-jump-tag)
	    (define-key tsx-ts-mode-map (kbd "<") 'rjsx-electric-lt)
	    (define-key tsx-ts-mode-map (kbd ">") 'rjsx-electric-gt)
	    (define-key tsx-ts-mode-map (kbd "C-:") 'emmet-expand-yas)
	    (sgml-electric-tag-pair-mode)
	    (define-key tsx-ts-mode-map (kbd "C-M-k")
			(lambda () (interactive)
			  (let* ((node (treesit-node-at (point)))
				 (typeof-node (treesit-node-type node))
				 (node-data (if (string-prefix-p "<" typeof-node)
						;; delete tag
						(treesit-node-parent (treesit-node-parent node))
					      ;; else delete attribute
					      (treesit-node-parent node)))
				 (beg (treesit-node-start node-data))
				 (end (treesit-node-end node-data))
				 (space (string= " "(buffer-substring end (+ 1 end)))))
	   		    (if space (delete-region beg (+ 1 end))
			      (delete-region beg end))
			    )))
	    (define-key tsx-ts-mode-map (kbd "C-d") 'rjsx-delete-creates-full-tag)
	    ))

;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
;; (define-key js2-mode-map (kbd "C-c C-o") nil)
;; (define-key js2-mode-map (kbd "C-c :") 'emmet-expand-yas)
;; (define-key js2-mode-map (kbd "C-;") 'emmet-expand-line)
;; (define-key js2-mode-map (kbd "C-,") 'yafolding-toggle-element)
;; (define-key js2-mode-map (kbd "C-.") 'yafolding-toggle-all)
;; (yafolding-mode)
;; ;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; ;; unbind it.
;; (define-key js-mode-map (kbd "M-.") nil)

;; (add-hook 'js2-mode-hook (lambda ()
;; 			   (js2-refactor-mode)
;; 			   (add-node-modules-path)
;; 			   (js2-mode-hide-warnings-and-errors)
;; 			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
;; 			   ;;create jsconfig.json or tsconfig.json with allowJs set to true
;; 			   ;; check spelling in comment
;; 			   (define-key js2-mode-map (kbd "C-M-f") 'forward-sexp)
;; 			   (define-key js2-mode-map (kbd "C-M-b") 'backward-sexp)
;; 			   (define-key js2-mode-map (kbd "C-M-n") 'forward-list)
;; 			   (define-key js2-mode-map (kbd "C-M-p") 'backward-list)
;; 			   (define-key js2-mode-map (kbd "C-c C-c") (lambda () (interactive)(compile (concat "time node " (buffer-file-name)))))
;; 			   (setup-tide-mode)
;; 			   ;; (flyspell-prog-mode)
;; 			   (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
;; 			   (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
;; 			   (flycheck-mode)
;; 			   ))
;; ;;;; prettier js
;; ;; (add-hook 'js2-mode-hook 'prettier-js-mode)

;; ;;;; tide mode
;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save idle-change))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   ;; company is an optional dependency. You have to
;;   ;; install it separately via package-install
;;   ;; `M-x package-install [ret] company`
;;   (setq company-backends
;; 	'((company-tide)
;; 	  (company-capf)))
;;   ;; (setq company-backends
;;   ;; 	'((company-tide :with company-yasnippet)
;;   ;; 	  (company-capf :with company-yasnippet)))
;;   (company-mode +1))

;; ;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-ts-mode-hook
	  (lambda ()
	    ;; enable typescript-tslint checker
	    ;; (flycheck-mode)
            ;; (flycheck-add-mode 'typescript-tslint 'typescript-mode)
	    ;; (setup-tide-mode)
	    ;; (eval-after-load "typescript-ts-mode-hook"
	    ;;   '(my-eglot-show-ts-variable-types)
	    ;;   )
	    (define-key typescript-ts-mode-map (kbd "C-c C-e") 'js2-equal)
	    (define-key typescript-ts-mode-map (kbd "C-c C-c")
			(lambda ()
			  (interactive)
			  (compile
			   ;; nodejs bydefault can execute .ts files now
			   (concat "time node --max-old-space-size=256 "
				   (file-name-base (buffer-file-name))
				   ".ts"
				   )
			   ;; (concat "tsc --module nodenext "
			   ;; 	   (buffer-file-name)
			   ;; 	   " && time node "
			   ;; 	   (file-name-base (buffer-file-name))
			   ;; 	   ".js"
			   ;; 	   )
			   )))
	    ;; (concat "tsc -m nodenext " (buffer-file-name)
	    ;; 	 ;; $? is last command's exit status
	    ;; 	 ";if [ $? -eq 0 ];then time node "
	    ;; 	 (file-name-base (buffer-file-name)) ".js;fi"
	    ;; 	 )
	    (load "~/.emacs.d/configs/js-ts.el" nil t)
	    ;; (indent-guide-mode)
	    (indent-bars-mode)
	    (my-eglot-show-ts-variable-types)
	    (clrhash my-eglot-overlays)
	    (define-key typescript-ts-mode-map (kbd "C-c C-j")
				       (lambda () (interactive "")
					 (if current-prefix-arg
					     (call-interactively 'genArray)
					   (genArray 10))))
	    ;; (define-key typescript-ts-mode-map (kbd "C-x C-s")
	    ;; 		(lambda () (interactive "")
	    ;; 		(save-buffer)
	    ;; 		(my-eglot-show-ts-variable-types)))
	    ))

(add-hook 'typescript-ts-mode-hook 'eglot-ensure)
(add-hook 'typescript-mode-hook 'eglot-ensure)
(add-hook 'tsx-ts-mode-hook 'eglot-ensure)

;; ;;;; tsx
;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
;; (add-hook 'typescript-mode-hook
;; 	  (lambda ()
;; 	    (when (string-equal "tsx" (file-name-extension buffer-file-name))
;; 	      (setup-tide-mode)
;; 	      )
;; 	    (define-key typescript-mode-map (kbd "C-k") 'paredit-kill)
;; 	    (define-key typescript-mode-map (kbd "C-c C-k") 'tagedit-kill)
;; 	    (define-key typescript-mode-map (kbd "C-c C-t k") 'tagedit-kill-attribute)
;; 	    (define-key typescript-mode-map (kbd "C-c C-f") 'sgml-skip-tag-forward)
;; 	    (define-key typescript-mode-map (kbd "C-c C-b") 'sgml-skip-tag-backward)
;; 	    (auto-rename-tag-mode)
;; 	    ))

;; ;; (eval-after-load 'js2-mode
;; ;;   '(add-hook 'js2-mode-hook #'add-node-modules-path))

;; ;;;; nodejs-repl
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (define-key js2-mode-map (kbd "C-c n e") 'nodejs-repl-send-last-expression)
;;             (define-key js2-mode-map (kbd "C-c n l") 'nodejs-repl-send-line)
;;             (define-key js2-mode-map (kbd "C-c n r") 'nodejs-repl-send-region)
;;             (define-key js2-mode-map (kbd "C-c n b") 'nodejs-repl-send-buffer)
;;             (define-key js2-mode-map (kbd "C-c n f") 'nodejs-repl-load-file)
;;             (define-key js2-mode-map (kbd "C-c n p") 'nodejs-repl-switch-to-repl)
;; 	    ))
;; (add-hook 'nodejs-repl-mode-hook (lambda ()
;; 				   (add-to-list 'comint-output-filter-functions 'ansi-color-process-output))
;; 	  )
;; ;;;; inf-mongo
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (define-key js2-mode-map (kbd "C-c C-d e") 'mongo-send-last-sexp)
;;             (define-key js2-mode-map (kbd "C-c C-d B") 'mongo-send-buffer-and-go)
;;             (define-key js2-mode-map (kbd "C-c C-d r") 'mongo-send-region)
;;             (define-key js2-mode-map (kbd "C-c C-d b") 'mongo-send-buffer)
;;             (define-key js2-mode-map (kbd "C-c C-d R") 'mongo-send-region-and-go)
;;             (define-key js2-mode-map (kbd "C-c C-d p") 'switch-to-inf-mongo)
;;             (define-key js2-mode-map (kbd "C-c C-d l") 'mongo-send-last-sexp-and-go)))
;; (defun nvm-which ()
;;   (let ((output (shell-command-to-string "source ~/.nvm/nvm.sh; nvm which")))
;;     (cadr (split-string output "[\n]+" t))))
;; ;;;; jsx
;; (add-hook 'rjsx-mode-hook
;; 	  (lambda ()
;; 	    (define-key rjsx-mode-map (kbd "C-c C-r") 'nil)
;; 	    (when (string-equal "jsx" (file-name-extension buffer-file-name))
;; 	      (setup-tide-mode))
;;             (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
;; 	    ;; check spelling in comment
;; 	    ;; (flyspell-prog-mode)
;; 	    ))
;; ;;;; npm
;; (global-set-key (kbd "C-x p n U") 'npm-mode-npm-uninstall-dev)

;;; yasfolding-mode
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (define-key js2-mode-map (kbd "C-c C-f") 'nil)
;; 	    (yafolding-mode)
;;             (define-key js2-mode-map (kbd "C-c C-f a") 'yafolding-show-element)
;;             (define-key js2-mode-map (kbd "C-c C-f h") 'yafolding-hide-element)
;;             (define-key js2-mode-map (kbd "C-c C-f p") 'yafolding-hide-parent-element)
;;             (define-key js2-mode-map (kbd "C-c C-f e") 'yafolding-toggle-element)
;;             (define-key js2-mode-map (kbd "C-c C-f t") 'yafolding-toggle-all)
;;             (define-key js2-mode-map (kbd "C-c C-f r s") 'yafolding-show-region)
;;             (define-key js2-mode-map (kbd "C-c C-f r h") 'yafolding-hide-region)
;; 	    ))
(global-set-key (kbd "C-c C-f") 'hippie-expand)

            ;; (define-key js2-mode-map (kbd "C-c C-f") 'yafolding-show-all)
            ;; (define-key js2-mode-map (kbd "C-c C-f") 'yafolding-hide-all)
            ;; (define-key js2-mode-map (kbd "C-c C-f") 'yafolding-hide-region)

;;; css
;; https://www.reddit.com/r/emacs/comments/931la6/tip_how_to_adopt_flycheck_as_your_new_best_friend/
;; (use-package flycheck
;;   :defer 2
;;   :diminish
;;   :init (global-flycheck-mode)
;;   :custom
;;   (flycheck-display-errors-delay .3)
;;     (flycheck-stylelintrc ".stylelintrc.json"))

;;; exec-path
;; (exec-path-from-shell-initialize)

;;; golden-ratio
;; (golden-ratio-mode 1)
;; ;;(setq golden-ratio-max-width 72)
;; (setq golden-ratio-adjust-factor 1.1
;;       golden-ratio-wide-adjust-factor .8)
;; ;;(setq golden-ratio-max-width 100)
;; ;;(setq golden-ratio-max-width 72)

;;; edit-server
;; (use-package edit-server
;;   :ensure t
;;   :commands edit-server-start
;;   :init (if after-init-time
;; 	    (edit-server-start)
;; 	  (add-hook 'after-init-hook
;; 		    #'(lambda() (edit-server-start))))
;;   ;; :config (setq edit-server-new-frame-alist
;;   ;; 		'((name . "Edit with Emacs FRAME")
;;   ;; 		  (top . 200)
;;   ;; 		  (left . 200)
;;   ;; 		  (width . 80)
;;   ;; 		  (height . 25)
;;   ;; 		  (minibuffer . t)
;;   ;; 		  (menu-bar-lines . t)
;;   ;; 		                    (window-system . x)))
;;   )
;; (when (and (daemonp) (require 'edit-server nil :noerror))
;;   (edit-server-start))
;; (when (require 'edit-server nil :noerror)
;;   (setq edit-server-new-frame nil)
;;     (edit-server-start))

;;; buffer
(defvar ibuffer-inline-columns nil)
(add-hook 'ibuffer-hook
	  (lambda ()
	    (setq ibuffer-filter-groups (ibuffer-project-generate-filter-groups))
	    ))

(defun ajv/human-readable-file-sizes-to-bytes (string)
  "Convert a human-readable file size into bytes."
  (interactive)
  (cond
   ((string-suffix-p "G" string t)
    (* 1000000000 (string-to-number (substring string 0 (- (length string) 1)))))
   ((string-suffix-p "M" string t)
    (* 1000000 (string-to-number (substring string 0 (- (length string) 1)))))
   ((string-suffix-p "K" string t)
    (* 1000 (string-to-number (substring string 0 (- (length string) 1)))))
   (t
    (string-to-number (substring string 0 (- (length string) 1))))
   )
  )

(defun ajv/bytes-to-human-readable-file-sizes (bytes)
  "Convert number of bytes to human-readable file size."
  (interactive)
  (cond
   ((> bytes 1000000000) (format "%10.1fG" (/ bytes 1000000000.0)))
   ((> bytes 100000000) (format "%10.0fM" (/ bytes 1000000.0)))
   ((> bytes 1000000) (format "%10.1fM" (/ bytes 1000000.0)))
   ((> bytes 100000) (format "%10.0fk" (/ bytes 1000.0)))
   ((> bytes 1000) (format "%10.1fk" (/ bytes 1000.0)))
   (t (format "%10d" bytes)))
  )

;; Use human readable Size column instead of original one
(define-ibuffer-column size-h
  (:name "Size"
	 :inline t
	 :summarizer
	 (lambda (column-strings)
	   (let ((total 0))
	     (dolist (string column-strings)
	       (setq total
		     ;; like, ewww ...
		     (+ (float (ajv/human-readable-file-sizes-to-bytes string))
			total)))
	     (ajv/bytes-to-human-readable-file-sizes total)))	 ;; :summarizer nil
	 )
  (ajv/bytes-to-human-readable-file-sizes (buffer-size)))

(setq ibuffer-formats
      '((mark modified read-only locked " "
	      (name 20 20 :left :elide)
	      " "
	      (size-h 11 -1 :right)
	      " "
	      (mode 16 16 :left :elide)
	      " "
	      filename-and-process)
	(mark " "
	      (name 16 -1)
	      " " filename)))
(add-hook 'ibuffer-hook
	  (lambda ()
	    (define-key ibuffer-mode-map (kbd "<RET>") '(lambda () (interactive) (ibuffer-visit-buffer t)))
	    ;; Modify the default ibuffer-formats
	    
	    (setq ibuffer-filter-groups (ibuffer-project-generate-filter-groups))
	    (unless (eq ibuffer-sorting-mode 'project-file-relative)
	                    (ibuffer-do-sort-by-project-file-relative))))
;; ibuffer like switch buffer
(defun ibuffer-jump2 (&optional other-window)
  (interactive "P")
  (let ((name (buffer-name)))
    (ibuffer t)
    (ignore-errors (ibuffer-jump-to-buffer name))))

 (global-set-key (kbd "C-x b") 'ibuffer-jump2)
 (global-set-key (kbd "C-x C-b") 'switch-to-buffer)

(defun project-goto-brain-entry ()
  "goto org-brain entry for the project"
  (interactive)
  ;; (require 'org-brain)
  (setq output ())
  (setq list (org-brain-headline-entries))
  (setq projectbrain (if (project-current) (caddr (project-current)) (project-prompt-project-dir)))
  ;; (message "pro:%s" (string-remove-suffix "/" projectbrain))
  (while list
    (setq a (car list))
    ;; (message "abcd: %s %s " (nth 0 a) (nth 1 a))
    (if (and (string= (nth 0 a) "project")
	     (string= (nth 1 a) (file-name-base (string-remove-suffix "/" projectbrain))
		      ;; (condition-case nil
		      ;; 		    ;; (progn
		      ;; 		    ;;   (if (project-current)
		      ;; 		    ;; 	  (file-name-base (string-remove-suffix "/" (cdr (project-current))))
		      ;; 		    ;; 	(file-name-base (string-remove-suffix "/" (project-prompt-project-dir)))
		      ;; 		    ;; 	)
		      ;; 		    ;;   )
		      ;; 		    (progn
		      ;; 		      (setq q1 (split-string projectbrain "/"))
		      ;; 		      (setq len (length q1))
		      ;; 		      (nth (- len 2) q1))
		      ;; 		  (error '"project is not vc"))
		      ))
	;; (message "output:%s" output)
	(progn (setq output a) (org-brain-visualize output) (setq list ()))
	;; nil
      )
      (setq list (cdr list))
    )
  (if output (message "done") (message "no value found") ))
 (global-set-key (kbd "C-x p w") 'project-goto-brain-entry)


;;; view-mode
;; (add-hook 'view-mode-hook (lambda ()
;; 			    (define-key view-mode-map (kbd "p") 'previous-line)
;; 			    (define-key view-mode-map (kbd "n") 'next-line)
;; 			    (define-key view-mode-map (kbd "v") 'scroll-down)
;; 			    (define-key view-mode-map (kbd "V") 'scroll-up)
;; 			    (yafolding-mode)
;; 			    ;; (define-key view-mode-map (kbd "<backtab>") 'yafolding-toggle-all)
;; 			    (define-key view-mode-map (kbd "C-M-i") 'yafolding-toggle-all)
;; 			    (define-key view-mode-map (kbd "TAB") 'yafolding-toggle-element)
;; 			    (define-key view-mode-map (kbd "f") 'forward-word)
;; 			    (define-key view-mode-map (kbd "b") 'backward-word)
;; 			    (define-key view-mode-map (kbd "e") 'forward-sentence)
;; 			    (define-key view-mode-map (kbd "a") 'backward-sentence)
;; 			    (define-key view-mode-map (kbd "l") 'recenter-top-bottom)
;; 			    (define-key view-mode-map (kbd ":") 'View-scroll-line-backward)
;; 			    (define-key view-mode-map (kbd "\"") 'View-scroll-line-forward)
;; 			    (define-key view-mode-map (kbd "[") 'backward-paragraph)
;; 			    (define-key view-mode-map (kbd "]") 'forward-paragraph)
;; 			    ;; (define-key view-mode-map (kbd "p") 'backward-sexp)
;; 			    ;; (define-key view-mode-map (kbd "n") 'forward-sexp)
;; 			    ))

(add-hook 'view-mode-hook
	  (lambda ()
	    (yafolding-mode)
	    (let* ((list '(("p" 'previous-line) ("n" 'next-line) ("v" 'scroll-down) ("V" 'scroll-up)
			      ;; ("V" 'scroll-up) ("C-M-i" 'yafolding-toggle-all) ("<tab>" 'yafolding-toggle-element)
			      ("f" 'forward-word) ("b" 'backward-word) ("e" 'forward-sentence)
			      ("a" 'backward-sentence) ("l" 'recenter-top-bottom)
			      (":" 'View-scroll-line-backward) ("\"" 'View-scroll-line-forward)
			      ("{" 'backward-paragraph) ("}" 'forward-paragraph)))
		   (value))
	      (define-key view-mode-map (kbd "C-M-i") 'yafolding-toggle-all)
	      (define-key view-mode-map (kbd "TAB") 'yafolding-toggle-element)
	      (define-key view-mode-map (kbd "p") 'previous-line)
	      (define-key view-mode-map (kbd "n") 'next-line)
	      (dolist (element list value)
		(funcall #'define-key view-mode-map (kbd (car element)) (cadr element))))))

(global-set-key (kbd "C-q") 'view-mode)
(add-hook 'org-mode-hook (lambda () (define-key org-mode-map (kbd "C-x C-q") 'read-only-mode)))
(put 'narrow-to-region 'disabled nil)

;;; hippe-expand
(global-set-key (kbd "C-h C-j") 'hippie-expand )

;;; occur-mode
;; (defun my-occur ()
;;   "Switch to *Occur* buffer, or run `occur'."
;;   (interactive)
;;   (if (get-buffer "*Occur*")
;;       (switch-to-buffer-other-window "*Occur*")
;;             (call-interactively 'occur)))
;; (global-set-key (kbd "C-c o") 'my-occur)
(global-set-key (kbd "C-c o") 'loccur-no-highlight)
(global-set-key (kbd "C-c o") 'loccur-current)
(global-set-key (kbd "C-c C-o p") 'loccur-previous-match)
(global-set-key (kbd "C-c C-o o") 'loccur-isearch)
(define-key isearch-mode-map (kbd "C-c o") 'loccur-isearch)

;;; test mode;
; (require 'test-mode)
;; (add-to-list 'auto-mode-alist '("\\.test\\'" . test-mode))

;;; test-poly
;;typescript-html
;;  (define-obsolete-variable-alias 'pm-host/ts 'poly-ts-hostmode "v0.2")
;;  (define-hostmode poly-ts-hostmode :mode 'typescript-mode)


;;  (define-innermode poly-typescript-html-innermode
;;    :mode 'html-mode
;;    :head-matcher "return *("
;;    :tail-matcher "^ *);?$"

;;    :head-mode 'host
;;    :tail-mode 'host)


;;  (define-polymode poly-ts-html-mode
;;    :hostmode 'poly-ts-hostmode
;;    :innermodes '(poly-typescript-html-innermode))

;;  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . poly-ts-html-mode))

;; ;;js-html
;;  (define-obsolete-variable-alias 'pm-host/js 'poly-js-hostmode "v0.2")
;;  (define-hostmode poly-js-hostmode :mode 'rjsx-mode)


;;  (define-innermode poly-rjsx-html-innermode
;;    :mode 'html-mode
;;    :head-matcher "return *("
;;    :tail-matcher "^ *);?$"

;;    :head-mode 'host
;;    :tail-mode 'host)


;;  (define-polymode poly-js-html-mode
;;    :hostmode 'poly-js-hostmode
;;    :innermodes '(poly-rjsx-html-innermode))

;;  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . poly-js-html-mode)
;; )
;; (flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)

;;; tsx-rjsx
;;typescript-tsx
;;  (define-obsolete-variable-alias 'pm-host/ts 'poly-tsx-hostmode "v0.2")
;;  (define-hostmode poly-tsx-hostmode :mode 'typescript-mode)


;;  (define-innermode poly-typescript-rjsx-innermode
;;    :mode 'rjsx-mode
;;    :head-matcher "return *("
;;    :tail-matcher "^ *);?$"

;;    :head-mode 'host
;;    :tail-mode 'host)

;;  (define-innermode poly-typescript-rjsx2-innermode
;;    :mode 'rjsx-mode
;;    ;; :head-matcher "=>\s*(\\(<\\|\n\\)"
;;    :head-matcher "return\s*(\\(<\\|\n\\)"
;;    :tail-matcher "^ *);?$"

;;    :head-mode 'host
;;    :tail-mode 'host)

;;  (define-polymode poly-tsx-rjsx-mode
;;    :hostmode 'poly-tsx-hostmode
;;    ;; :innermodes '(poly-typescript-rjsx-innermode
;;    :innermodes '(
;; 		 poly-typescript-rjsx2-innermode))

;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . poly-tsx-rjsx-mode))
;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
(load "~/.emacs.d/modes/tsx-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . my-tsx-ts-mode))

;;; project explorer
(add-hook 'project-explorer-mode-hook '(lambda ()
					 (define-key project-explorer-mode-map (kbd "M-n") 'pe/forward-element)
					 (define-key project-explorer-mode-map (kbd "M-p") 'pe/backward-element))
	  )


;;; lacarte
;; (require 'lacarte)
;; (global-set-key (kbd "C-x M-x") 'lacarte-execute-command)
;; (global-set-key [f9]       'lacarte-execute-menu-command)

;;; recentf-mode
(recentf-mode 1)
(load "~/.emacs.d/configs/recentf-config.el" nil t)

;;; undo kill buffer
;;https://www.emacswiki.org/emacs/RecentFiles#h5o-9
(defun undo-kill-buffer (arg)
  "Re-open the last buffer killed.  With ARG, re-open the nth buffer."
  (interactive "p")
  (let ((recently-killed-list (copy-sequence recentf-list))
	(buffer-files-list
	 (delq nil (mapcar (lambda (buf)
			     (when (buffer-file-name buf)
			       (expand-file-name (buffer-file-name buf)))) (buffer-list)))))
    (mapc
     (lambda (buf-file)
       (setq recently-killed-list
	     (delq buf-file recently-killed-list)))
     buffer-files-list)
    (find-file
     (if arg (nth arg recently-killed-list)
       (car recently-killed-list)))))
(global-set-key (kbd "C-x /") 'undo-kill-buffer)

;;; dired-video
(defun open-video ()
  "open images"
  (interactive)
  (setq img (concat "mplayer " (string-replace "-" (car (dired-get-marked-files))  "\"-\"")))
   (async-shell-command img nil)
)
(define-key dired-mode-map (kbd "M-<RET>") 'open-video)

;;; C-w

;;https://www.emacswiki.org/emacs/KillingAndYanking
(defadvice kill-region (before unix-werase activate compile)
  "When called interactively with no active region, delete a single word
    backwards instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (save-excursion (backward-word 1) (point)) (point)))))
(global-set-key (kbd "C-y") 'yank)

;;; sql-mode
;; (load-library "sql-completion")
(define-key comint-mode-map (kbd "C-c C-k") 'comint-clear-buffer)
(define-skeleton sql-not-equal
  "Write a not equal"
  ""
  " <> ")
(add-hook
 'sql-interactive-mode-hook
 (lambda ()
   (define-key sql-interactive-mode-map (kbd "C-c C-l") 'thcw/comint-insert-from-history)
   (define-key sql-interactive-mode-map (kbd "C-c C-: a") 'sql-list-all)
   (define-key sql-interactive-mode-map (kbd "C-c C-: t") 'sql-list-table)
   (define-key sql-interactive-mode-map (kbd "C-c C-\"") 'sql-list-table)
   ))
(add-hook
 'sql-mode-hook
 (lambda ()
   (defun my-sql-magic-semicolon (arg)
     "Insert semicolon and call `comint-send-input'.
`sql-electric-stuff' must be the symbol `semicolon'."
     (interactive "P")
     ;; (message "abcd: %s %s" arg (prefix-numeric-value arg))
     (move-end-of-line nil)
     (unless (looking-back "; *\n*" 1)
       (insert ";"))
     (if (equal sql-electric-stuff 'semicolon)
	 (comint-send-input)))
   (define-key sql-mode-map (kbd "C-c ,") 'sql-not-equal)
   (define-key sql-mode-map (kbd "C-i") #'company-indent-or-complete-common)
   (sqlup-mode)
   (setq-local company-backends '(company-mysql-backend))
   (setq-local company-minimum-prefix-length 0)
   (defun mysql-custom-send-paragraph ()
     (interactive)
     (save-excursion
       (backward-paragraph)
       (end-of-paragraph-text)
       (whitespace-cleanup-region (pos-bol) (point))
       (if (not (looking-back ";"))
	   (insert ";")))
     (sql-send-paragraph))
   (define-key sql-mode-map (kbd "C-c C-c") 'mysql-custom-send-paragraph)
   ))

;;; abbrev expand
;;https://www.emacswiki.org/emacs/AbbrevMode
 (setq abbrev-file-name             ;; tell emacs where to read abbrev
      "~/.emacs.d/abbrev_defs")    ;; definitions from...
;; (setq save-abbrevs 'silent)
(setq-default abbrev-mode t)
;; sql -https://www.emacswiki.org/emacs/AbbrevMode#h5o-7

;;; bash complete
;; https://github.com/szermatt/emacs-bash-completion
;; done in git-config.el
;; (defun bash-completion-from-eshell ()
;;   (interactive)
;;   (let ((completion-at-point-functions
;;          '(bash-completion-eshell-capf)))
;;     (completion-at-point)))

;; (defun bash-completion-eshell-capf ()
;;   (bash-completion-dynamic-complete-nocomint
;;    (save-excursion (eshell-bol) (point))
;;    (point) t))

;; (autoload 'bash-completion-dynamic-complete
;;   "bash-completion"
;;   "BASH completion hook")
;; (add-hook 'eshell-dynamic-complete-functions
;; 	  'bash-completion-dynamic-complete)
;; (add-hook 'eshell-mode-hook
;;           (lambda ()
;;             (add-hook 'completion-at-point-functions
;;                       'bash-completion-capf-nonexclusive nil t)))
;;or
;; (require 'bash-completion)
;;         (bash-completion-setup)

;;; shell completing read
;; In erc, tsdh helped with this function
;; (defun th/comint-insert-from-history ()
;;   (interactive)
;;   (when-let ((item (completing-read
;;                     "History element: "
;;                     (ring-elements comint-input-ring))))
;;     (insert item)))

;;modified with the help of corwin in erc
(defun thcw/comint-insert-from-history ()
  (interactive)
  (when-let (
	     (item (ring-elements comint-input-ring))
	     (val (completing-read
		   "History element: "
		   item nil nil  (thing-at-point 'line) 'item))
	     )
    (unless (not (thing-at-point 'line)) (move-beginning-of-line 1) (kill-line))
    (insert val)))
(define-key shell-mode-map (kbd "C-c C-l") 'thcw/comint-insert-from-history)
;; (define-key shell-mode-map (kbd "C-c M-e") (lambda (arg) (interactive "P")
;; 					     (message "working")
;; 					     (if (not arg)
;; 						 (async-shell-command (concat "xterm -e \"" (concat (thing-at-point 'line)";read\"")))
;; 					       (shell-command-to-string (concat "xterm -e \"" (concat (thing-at-point 'line)";read\""))))
;; 					     )
;;   )

;;; expand file name
;;https://www.emacswiki.org/emacs/InsertFileName
(defun my-insert-file-name (filename &optional args)
  "Display the value of the raw prefix arg."
  (interactive "*fInsert file name: \nP")
(cond
;; if prefix not preset then this gives error, therefore wrapped in if statement
 ((= (if (car current-prefix-arg) (car current-prefix-arg) 0) 4 )
   (insert  filename)
  )
 ((= (if (car current-prefix-arg) (car current-prefix-arg) 0) 16 )
  (insert (expand-file-name filename))
   )
 (t
  (let* ((filename (file-relative-name filename)))
    (if (not (string= (substring filename 0 1) ".")) (setq filename (concat "./" filename)) (setq filename filename))
    (insert filename)
    )
 )
 ;; ((= (car current-prefix-arg) 16 )  (insert filename))
 ;; ((= (car current-prefix-arg) 64 (insert (expand-file-name filename))))
 )
)

(global-set-key "\C-c\C-i" 'my-insert-file-name)

;;; coding system
;; https://masteringemacs.org/article/working-coding-systems-unicode-emacs
;; ---Edited---
(set-default-coding-systems 'utf-8)
;; Ensure UTF-8 is used for the terminal frame
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; (add-hook 'shell-mode-hook '(lambda () (interactive "") (set-terminal-coding-system 'utf-8 )))
;; ----------

;;; xterm-color
;;;; xterm-color to color your shell
;; ---Edited---
;; (setq comint-output-filter-functions
;;       (remove 'ansi-color-process-output comint-output-filter-functions))

(add-hook 'shell-mode-hook
          (lambda ()
	    ;; Disable font-locking in this buffer to improve performance
	    (font-lock-mode -1)
	    ;; Prevent font-locking from being re-enabled in this buffer
	    (make-local-variable 'font-lock-function)
	    (setq font-lock-function (lambda (_) nil))
	    (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t)
	    ))
;; ----------

;; Also set TERM accordingly (xterm-256color) in the shell itself.

;;;; xterm-color to compilation buffer
(setq compilation-environment '("TERM=xterm-256color")) 

(defun my/advice-compilation-filter (f proc string)
  (funcall f proc (xterm-color-filter string)))

(advice-add 'compilation-filter :around #'my/advice-compilation-filter)

;; ----------

;;; shell key
;;to be deleted as xterm color solved the problem
(global-set-key (kbd "<print>") 'shell)
(global-set-key (kbd "C-c C-y") 'woman)
;; (defun comint-clear-buffer1 ()
;;   "Clear the comint buffer."
;;   (interactive)
;;   (let ((comint-buffer-maximum-size 1))
;;     (comint-truncate-buffer)
;;     (move-end-of-line 2)
;;     ))
(defun my/shell-mode-compile (arg)
  ""
  (interactive "P")
  (with-current-buffer (buffer-name)
    (let* (
	   ;; (shell-command-buffer-name
	   ;; (progn
	   (compilation-buffer-name-function
	    (lambda (mode)
	      (format "*%s:%s*"
		      (if (project-current)
			  ;; (f-filename (project-root (project-current)))
			  (expand-file-name (project-root (project-current)))
			'bash)
		      (buffer-substring (point-at-bol) (point-at-eol)))
	      )))
      ;; (message (concat "Running "))
      (if arg
	  (compile (buffer-substring (point-at-bol) (point-at-eol)) t)
	(compile (buffer-substring (point-at-bol) (point-at-eol)) )
	)
      (end-of-buffer)
      ;; (shell-command (buffer-substring (point-at-bol) (point-at-eol)))
      ;; (with-current-buffer
      ;; 	   shell-command-buffer-name
      ;; 	 (progn
      ;; 	   (xterm-color-colorize-buffer)
      ;; 	   (read-only-mode)
      ;; 	   )
      ;; 	 )
      )))
(add-hook 'shell-mode-hook '(lambda () (interactive "")
			      (define-key shell-mode-map (kbd "M-p") 'comint-previous-matching-input-from-input)
			      (define-key shell-mode-map (kbd "M-n") 'comint-next-matching-input-from-input)
			      (define-key shell-mode-map (kbd "C-c C-y") 'woman)
			      ;;; buffer-substring from https://stackoverflow.com/a/7053298/
			      ;; (define-key shell-mode-map (kbd "C-x C-e") '(lambda () (interactive "")
			      ;; 						    (with-current-buffer (buffer-name) (compile (buffer-substring (point-at-bol) (point-at-eol)))))
			      ;; 	)
			      ;;; also npm package helped for renaming the buffer
			      (define-key shell-mode-map
				(kbd "C-x C-e")
				'my/shell-mode-compile
				)
			      ;; (define-key shell-mode-map (kbd "C-c C-k") 'comint-clear-buffer1)
			      (define-key shell-mode-map (kbd "C-c C-k") 'comint-clear-buffer)
			      ;; (define-key shell-mode-map (kbd "C-i") 'company-capf)
			      (define-key shell-mode-map (kbd "C-i") #'company-indent-or-complete-common)
			        ;; (define-key company-active-map (kbd "C-M-i") #'company-complete)
			        ;; (define-key shell-mode-map (kbd "C-i") #'company-complete)
			      ;; (define-key company-active-map
			      ;; 	(kbd "C-M-i")
			      ;; 	#'company-complete-common-or-cycle)
			      ;; (define-key company-active-map (kbd "TAB") #'company-complete)
			      ;; disabled yasnippet to avoid snippets in tooltip
			      (yas-minor-mode -1)
			      ))
(defun shell-onclear-go-eol ()
       "Move to end of the line after running `comint-clear-buffer' (C-c C-k)"
       (move-end-of-line nil)
       )
(advice-add 'comint-clear-buffer :after #'shell-onclear-go-eol)
(add-hook 'shell-mode-hook #'pcomplete-shell-setup)

(add-hook
 'sh-mode-hook
 (lambda ()
   (define-key sh-mode-map (kbd "C-c C-c")
	       (lambda () (interactive)
		 (if (buffer-file-name)
		     (compile (concat "./" (file-name-nondirectory(buffer-file-name))))
		   (compile (buffer-substring (point-min) (point-max)))))
	    ;; (lambda () (interactive)(compile (concat "time node " (buffer-file-name))))
	    )))
	  
;;; fancy-dabbrev
;; Load fancy-dabbrev.el:
(require 'fancy-dabbrev)

;;;; Enable fancy-dabbrev previews everywhere:
(global-fancy-dabbrev-mode)

;; Bind fancy-dabbrev-expand and fancy-dabbrev-backward to your keys of
;; choice, here "TAB" and "Shift+TAB":
;; (global-set-key (kbd "M-/") 'fancy-dabbrev-expand)
(global-set-key (kbd "C-j") 'fancy-dabbrev-expand)
(global-set-key (kbd "M-j") 'fancy-dabbrev-backward)
;;(global-set-key (kbd "<backtab>") 'fancy-dabbrev-backward)
;;(define-key fancy-dabbrev-mode-map (kbd "<backtab>") 'fancy-dabbrev-backward)
;; If you want TAB to indent the line like it usually does when the cursor
;; is not next to an expandable word, use 'fancy-dabbrev-expand-or-indent
;; instead of `fancy-dabbrev-expand`:
;;(global-set-key (kbd "TAB") 'fancy-dabbrev-expand-or-indent)
;;(global-set-key (kbd "<backtab>") 'fancy-dabbrev-backward)

;;;; Let dabbrev searches ignore case and expansions preserve case:
(setq dabbrev-case-distinction nil)
(setq dabbrev-case-fold-search t)
(setq dabbrev-case-replace nil)
(setq fancy-dabbrev-expansion-context 'after-symbol-or-space)

;;; minibuffer
(define-key minibuffer-mode-map (kbd "C-x C-g") 'vertico-exit)
(define-key minibuffer-mode-map (kbd "C-j") 'nil)

;;; project
(defun dy/project-create-dir ()
  "creates a new folder with bootstraped files according to current folder"
  (interactive "")
  (let*
      ((dir (read-directory-name "Enter name and location: "))
       (dir-name (file-name-base (directory-file-name dir)))
       (files (f-files (read-directory-name "Select directory template: ")
		       (lambda (str) (if
				    (not (length> (split-string str "#") 1))
				    (not (length> (split-string str "~") 1))
				  (not (length> (split-string str "~") 1))
				  't
				  nil))))
       (i 0))
    
    (dired-create-directory dir)
    (while (length> files 0 )
      (setq ext (file-name-extension (nth 0 files)))
      (dired-create-empty-file (file-name-concat dir (file-name-with-extension dir-name ext)))
      (setq files (cdr files)))
    (if (string= "Yes" (completing-read "Switch to newly created directory?" '("Yes" "No"))) (dired dir))
    )
  )
(global-set-key (kbd "C-x p c") 'dy/project-create-dir)
(global-set-key (kbd "C-x p C") 'project-compile)

;;; org-mode
(define-key org-mode-map (kbd "C-j") 'fancy-dabbrev-expand)
(define-key org-mode-map (kbd "C-M-i") 'org-shifttab)

;;; async-shell-command o/p buffer hide
;;https://emacs.stackexchange.com/a/58341
(add-to-list 'display-buffer-alist '("*Async Shell Command*" display-buffer-no-window (nil)))

;;; ace-jump-mode
(define-key global-map (kbd "C-x j") 'ace-jump-mode)
;; (eval-after-load "ace-jump-mode"
;;   '(ace-jump-mode-enable-mark-sync))
;; (define-key global-map (kbd "C-x j p") 'ace-jump-mode-pop-mark)

;;; xterm mouse
;; emacs-redux
;; (xterm-mouse-mode t)

;;; calc
(setq calc-group-digits t)
(global-set-key (kbd "C-x c") 'calc)
(global-set-key (kbd "M-s c") 'quick-calc)
(add-hook 'calc-load-hook
	  (lambda ()
	    (define-key calc-mode-map (kbd "'") 'calc-auto-algebraic-entry)
	    (define-key calc-mode-map (kbd "\"") 'calc-algebraic-entry)
	    ))

;;; json-navigator
(add-hook 'json-navigator-mode-hook 'tree-minor-mode)
(add-hook 'json-mode-hook (lambda () (define-key json-mode-map (kbd "C-c h") 'json-navigator-navigate-after-point))
	  )

(add-hook 'tree-mode-hook (lambda ()
			    ;; (define-key tree-mode-map (kbd "p") 'widget-backward)
			    (define-key tree-mode-map (kbd "p") 'tree-mode-previous-sib)
			    (define-key tree-mode-map (kbd "n") 'tree-mode-next-sib)
			    (define-key tree-mode-map (kbd "TAB") 'nil)
			    ;; (define-key tree-mode-map (kbd "TAB") 'widget-button-press)
			    (define-key tree-mode-map (kbd "P") 'tree-mode-previous-node)
			    (define-key tree-mode-map (kbd "N") 'tree-mode-next-node)
			    )
	  )

;;; winner-mode
(winner-mode 1)
(global-set-key (kbd "C-c q q") 'winner-undo)
(global-set-key (kbd "C-c q u") 'winner-redo)


;; (add-hook 'dired-mode-hook 'dired-hide-details-mode)
;;; git
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)
;; (add-hook 'dired-after-readin-hook 'dired-git-info-mode)
;; (global-set-key (kbd "C-x v c") (lambda ()
;; 				  (interactive)
;; 				  (async-shell-command "git gui"))
;; 		)
;; (global-set-key (kbd "C-x v k") (lambda ()
;; 				  (interactive)
;; 				  (async-shell-command "gitk"))
;; 		)

(diff-hl-flydiff-mode)
(diff-hl-margin-mode)
(define-key diff-mode-map (kbd "C-M-i") 'diff-hunk-prev)
(load "~/.emacs.d/configs/git-config.el" nil t)
;; (load-file "~/.emacs.d/configs/git-config.el")
;; (add-hook 'vc-dir-mode-hook 'git-mode)
;; (add-hook 'dired-mode-hook (lambda () (interactive "")
;; 			     (if (project-current) (git-mode)))
;; 	  )

;;;; why-this
(global-set-key (kbd "C-x v w w") 'why-this)
(global-set-key (kbd "C-x v w m") 'why-this-mode)
(global-set-key (kbd "C-x v w a") 'why-this-annotate)

;;; info-mode

;; (define-key Info-mode-map (kbd "{") 'Info-backward-node)
;; (define-key Info-mode-map (kbd "}") 'Info-forward-node)

;;; misc
(column-number-mode)
(delete-selection-mode)
(global-set-key (kbd "C-x m") 'exchange-point-and-mark)
(global-set-key (kbd "C-x C-x") 'mode-line-other-buffer)
(toggle-frame-fullscreen)
;;;;completing-read-multiple
(defvar crm-separator "[ 	]* [ 	]*")
(global-set-key (kbd "M-o") 'browse-url-at-point)

;;;;file as root
;;https://emacs-fu.blogspot.com/
(defun djcb-find-file-as-root ()
  "Like `ido-find-file, but automatically edit the file with
root-privileges (using tramp/sudo), if the file is not writable by
user."
  (interactive)
  (let ((file (read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (find-file file)))
;; or some other keybinding...
(global-set-key (kbd "C-x C-f") 'djcb-find-file-as-root)
(global-set-key (kbd "C-x f") 'find-file)
(global-set-key (kbd "C-x F") 'find-file-literally)
(electric-pair-mode)
(repeat-mode)

;;server start for editing request(in terminal) to go to current emacs(eg. crontab -e)
(server-start)

;;; tab bar
(global-set-key (kbd "C-x t t") 'tab-new)
(global-set-key (kbd "C-x t x") 'tab-close)
(global-set-key (kbd "C-x t p") 'tab-previous)
(global-set-key (kbd "C-x t n") 'tab-next)

;;; indent
;;;; rigidly
(define-key indent-rigidly-map (kbd "f")  'indent-rigidly-right)
(define-key indent-rigidly-map (kbd "b")  'indent-rigidly-left)
(define-key indent-rigidly-map (kbd "F")  'indent-rigidly-right-to-tab-stop)
(define-key indent-rigidly-map (kbd "B")  'indent-rigidly-left-to-tab-stop)

;;; qrcode
(defun get-qr ()
  (interactive "")
  ;; (message "%s"  (buffer-substring (region-beginning) (region-end)))
  (shell-command (concat "xterm -e \"qrencode '"
			 (if (region-active-p) (buffer-substring (region-beginning) (region-end)) (thing-at-point-url-at-point))
			 "' -t UTF8 -o -;read\"") nil)
  )
(global-set-key (kbd "C-c C-q") 'get-qr)

;;; project test Toggle
(global-set-key (kbd "C-x p t") 'tgt-toggle)

;;; haskell-mode
(setq skeleton-end-newline nil)
;; (define-skeleton haskell-arrow
;;   "Write a greeting"
;;   ""
;;   (if current-prefix-arg  " <- " " -> "))
(define-skeleton haskell-arrow
  "Write a greeting"
  ""
  (cond
       ((equal current-prefix-arg nil) " -> ")
       ((equal current-prefix-arg '(4)) " <- ")
       (t " => "))
  )
(define-skeleton haskell-colon
  "Write a greeting"
  ""
  " :: ")
(define-skeleton haskell-dollar
  "Write a greeting"
  ""
  " $ ")
(define-skeleton haskell-plus
  "Write a greeting"
  ""
  " ++ ")
(define-skeleton haskell-equal
  "Write a greeting"
  ""
  " = ")
(define-skeleton haskell-guard
  "guard for haskell"
  ""
  ;; move to new line or not?
  (let* (
	 (str (buffer-substring (line-beginning-position) (line-end-position)))
	 (val1 (string-match "\[^=^<^>^/\]=\\{1\\}\[^=\]" str))
	 (val2 (string-match "|\s*$" str))
	 (val3 (string-match "^[^=^|]*$" str)))

    ;; (if val " \n" " ")
    ;; >"| "
    (cond
     (val1 (progn
	     (newline)
	     (haskell-indent-insert-guard)))
     (val2 (haskell-indent-insert-otherwise))
     (val3 (haskell-indent-insert-guard))
     (t (haskell-indent-insert-equal))
     )
    )
  )


(add-hook 'haskell-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 (append '((company-capf company-dabbrev-code))
                         company-backends))
            (define-key haskell-mode-map (kbd "<f8>") 'haskell-navigate-imports)
	    (flycheck-mode)
	    ;; haskell-flycheck
	    ;; (flycheck-haskell-setup)
	    (haskell-indent-mode)
	    ;; (haskell-indentation-mode)
	    (define-key haskell-mode-map (kbd "TAB") 'haskell-tab-indent-or-complete)
	    (define-key haskell-mode-map (kbd "C-c C-a") 'haskell-arrow)
	    (define-key haskell-mode-map (kbd "C-c C-:") 'haskell-colon)
	    (define-key haskell-mode-map (kbd "C-c C-\\") 'haskell-indent-insert-guard)
	    (define-key haskell-mode-map (kbd "C-c C-u") 'haskell-plus)
	    (define-key haskell-mode-map (kbd "C-c C-d") 'haskell-dollar)
	    (define-key haskell-mode-map (kbd "C-c C-g") 'haskell-guard)
	    (define-key haskell-mode-map (kbd "C-c C-e") 'haskell-indent-insert-equal)
	    ;; (define-key haskell-mode-map (kbd "RET") 'haskell-interactive-mode-newline-indent)
	    (define-key haskell-mode-map (kbd "RET") 'haskell-indentation-newline-and-indent)
	    (define-key haskell-mode-map (kbd "C-c C-f") 'haskell-process-load-file)
	    (define-key haskell-interactive-mode-map (kbd "C-j") 'fancy-dabbrev-expand)
	    ;; (define-key haskell-mode-map (kbd "=") 'haskell-equal)
	    ))
;; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
(eval-after-load "haskell-mode"
    '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))
(eval-after-load "haskell-cabal"
  '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))
(add-hook 'inferior-haskell-mode-hook
	  (lambda ()
	    (define-key inferior-haskell-mode-map (kbd "C-c C-l") 'thcw/comint-insert-from-history))
	  )

;;; yas-snippet js2 key-value expand on :
(defun kv-expand-only-under-brackets ()
  "when typing ':' under {} brackets should expand to key value pair.
Used by condition in yas-snippet 'key-value' in js2-mode snippet"
  (interactive)
  (setq val nil)
  (save-excursion
    (condition-case nil
        (backward-up-list)
      (error nil))
    (setq val (if (looking-back "\\([[:alnum:]]\\|[[:alnum:][-]]\\)*\s*=\s*" 3)
		  t nil)))
  val
  )

;;; currency symbols
(global-set-key (kbd "M-s r") (lambda () (interactive) (insert "₹")))
;; (global-set-key (kbd "C-x 8 r") (lambda () (interactive) (insert "₹")))
;; (global-set-key (kbd "C-x 8 d") (lambda () (interactive) (insert "$")))
;; (global-set-key (kbd "C-x 8 e") (lambda () (interactive) (insert "€")))

;;; eshell
(add-hook 'eshell-mode-hook
	  (lambda ()
	    (interactive "")
	    ;; (use-package esh-autosuggest
	    ;;   :hook (eshell-mode . esh-autosuggest-mode)
	    ;;   ;; If you have use-package-hook-name-suffix set to nil, uncomment and use the
	    ;;   ;; line below instead:
	    ;;   ;; :hook (eshell-mode-hook . esh-autosuggest-mode)
	    ;;   :ensure t)
	    (use-package eshell-syntax-highlighting
	      :after eshell-mode
	      :ensure t ;; Install if not already installed.
	      :config
	      ;; Enable in all Eshell buffers.
	      (eshell-syntax-highlighting-global-mode +1))

	    ;; https://www.emacswiki.org/emacs/EshellPrompt
	    (defun with-face (str &rest face-plist)
	      (propertize str 'face face-plist))

	    (defun my-eshell-prompt ()
	      (let ((header-bg "#fff"))
		(concat (with-face "$" :foreground "green")
			(with-face " ")
			)))
	    (setq eshell-prompt-regexp "^[#$] "
		  eshell-prompt-function
		  (lambda nil
		    "$ "))
	    (setq eshell-prompt-function 'my-eshell-prompt)
	    (setq eshell-highlight-prompt nil)
	    (define-key eshell-mode-map (kbd "C-M-i") 'bash-completion-from-eshell)
	    )
	  )


;;; dictionary
      ;; Key binding to invoke the dictionary client
      (global-set-key (kbd "C-x M-d") 'dictionary-search)
      (global-set-key (kbd "C-x M-m") 'dictionary-match-words)

      ;; The dictionary server is running on the local machine
      (setq dictionary-server "dict.org")

      ;; Popup menu for GNU Emacs 21, and XEmacs 21
      (global-set-key [mouse-3] 'dictionary-mouse-popup-matching-words)

;;;quoted insert
(global-set-key (kbd "C-M-q") 'quoted-insert)

;; generate number
(defun generate-numbers (start end &optional quant)
      "Say hello to SOMEONE via M-x hello, for NUM times."
      (interactive "nStart sequence from? \nnEnd Sequence? \nsNumbers separated with?")
      (dotimes (i (- end start))
        (insert (format "%s%s" (+ i start) quant))))
;; generate random array
(defun count-digits (n)
  (let ((count 0))
    (while (> n 0)
      (setq n (/ n 10))
      (setq count (1+ count)))
    count))
(defun genArray (size)
  "random js array generator"
  (interactive "nSize of Array: ")
    (insert (concat  "[" (string-join (mapcar (lambda (x) (number-to-string (random (expt 10 (count-digits size)))))
	(make-list size nil)) ", ") "]"))
  )
;; expand-region
(global-set-key (kbd "C-/") 'er/expand-region)
(global-set-key (kbd "M-SPC") 'cycle-spacing)
(add-hook 'woman-mode-hook
	  (lambda ()
	    (define-key woman-mode-map (kbd "l") 'recenter-top-bottom)
	    )
	  )
;;(defvaralias 'woman-topic-history 'Man-topic-history)
(global-set-key (kbd "C-x a r") 'align-regexp)
(global-set-key (kbd "M-s M-s") 'scratch-buffer)
(global-set-key (kbd "M-s l") 'visual-line-mode)

(shell)
;; (global-set-key (kbd "M-#") 'revert-buffer)

;; thanks to someone's question and twb's answer @irc
;; https://www.emacswiki.org/emacs/PrettyLambda
;; (font-lock-add-keywords 'emacs-lisp-mode
;;   '(("(\\(lambda\\)\\>" (0 (prog1 ()
;;                              (compose-region (match-beginning 1)
;;                                              (match-end 1)
;;                                              ?λ))))))
(mapc (lambda (major-mode) ; Similar to http://emacswiki.org/wiki/PrettyLambda
        (font-lock-add-keywords major-mode
          `(("(\\(lambda\\)\\>"
             (0 (prog1 ()
                  (compose-region (match-beginning 1)
                                  (match-end 1)
                                  ,(make-char 'greek-iso8859-7 107))))))))
      '(emacs-lisp-mode
        inferior-emacs-lisp-mode
        lisp-mode
        slime-repl-mode
        inferior-lisp-mode
        scheme-mode
        scheme48-mode
        inferior-scheme-mode))
(global-prettify-symbols-mode 1)

(define-key resize-window-repeat-map (kbd "6") 'enlarge-window)

;;; plantuml
;; Enable plantuml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))

;; markdown-mode view using impatient-mode
;; https://stackoverflow.com/questions/36183071/how-can-i-preview-markdown-in-emacs-in-real-time
(defun markdown-html (buffer)
    (princ (with-current-buffer buffer
      (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://ndossougbe.github.io/strapdown/dist/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
    (current-buffer)))

;;; clock work time
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(defun customDateExtractMidNight ()
  (let* ((hour (- 23 (decoded-time-hour (decode-time (current-time)))))
       (min (- 59 (decoded-time-minute (decode-time (current-time)))))
       (enc (append (list 0 min hour) (nthcdr 3 (decode-time (current-time)))))
       )
  (format-time-string "[%R]" (encode-time enc))
 ))

(add-hook
 'org-agenda-mode-hook
 (lambda ()
   (setq mode-line-format
	 '("%e" mode-line-front-space
	   mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position
	   (vc-mode vc-mode)
	   "  " mode-line-modes mode-line-misc-info mode-line-end-spaces (:eval (customDateExtractMidNight)))) 
   ))

;;; gpt llm
(load (expand-file-name "configs/gpt-prompt" user-emacs-directory) nil t)

;;; time zone
(setq calendar-latitude 28.63)
(setq calendar-longitude 77.22)
(setq calendar-location-name "New Delhi, IN")
;; (add-hook 'text-mode-hook
;; 	  (lambda () (setq-local company-backends '(company-ispell)))
;; 	  )
;;; auto-insert-mode
;; (auto-insert-mode t)
;; (setq auto-insert-directory "~/.emacs.d/templates")
;; (define-auto-insert "\\.js\\'"  "default.js")

;;company statistics
;; (add-hook 'after-init-hook 'company-statistics-mode)

;; open stumpwm frame
(defun frame-open ()
  "disable all other ui like tabbar modeline etc inside created frame"
  (setq-local mode-line-format nil)
  (toggle-frame-tab-bar)
  (keymap-local-set (kbd "q") 'delete-frame))

;; open emacs frame in stumpwm
(add-hook 'after-init-hook
	  (lambda ()
	   ;; (shell-command "echo '(run-or-raise-emacs)' | stumpish -e eval")
	    ;;(shell-command "emacsclient c-")
	    
	    ))
;; (shell-command "echo '(run-or-raise-emacs)' | stumpish -e eval")

;; (message "environment: %s" (getenv "TERM"))
;; (setenv "TERM" "dumb")
;; (message "environment: %s" (getenv "TERM"))
;; (make-frame '((fullscreen . fullboth)))

(setq dired-listing-switches "-lt")
;; (indent-guide-global-mode)

(global-set-key (kbd "M-g r") 'golden-ratio)

;;; .emacs ends here

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "gray9" :foreground "gray80" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 178 :width normal :foundry "DAMA" :family "Ubuntu Mono"))))
 '(bold ((t (:foreground "yellow3" :weight bold))))
 '(comint-highlight-input ((t (:weight bold :inherit bold))))
 '(diff-file-header ((t (:extend t :background "grey17"))))
 '(diff-header ((t (:extend t :background "grey25"))))
 '(diff-refine-added ((t (:foreground "#006600" :background "#22aa22" :inherit diff-refine-changed))))
 '(diff-refine-removed ((t (:foreground "#660000" :background "#aa2222" :inherit diff-refine-changed))))
 '(eglot-highlight-symbol-face ((t (:background "SlateBlue4" :foreground "GreenYellow" :weight bold))))
 '(flycheck-warning ((t (:underline (:color "orange2" :style wave)))))
 '(haskell-interactive-face-compile-error ((t (:foreground "IndianRed" :inherit compilation-error))))
 '(haskell-interactive-face-result ((t (:foreground "SlateBlue1" :inherit font-lock-string-face))))
 '(info-xref ((t (:foreground "SeaGreen3"))))
 '(org-agenda-current-time ((t (:inherit nil :foreground "LightGoldenrod4"))))
 '(org-agenda-date-today ((t (:weight bold :slant italic :inherit org-agenda-structure))))
 '(org-agenda-date-weekend-today ((t (:foreground "SlateBlue1" :inherit org-agenda-date-today))))
 '(org-agenda-done ((t (:foreground "SeaGreen"))))
 '(org-agenda-structure ((t (:foreground "DeepSkyBlue2"))))
 '(org-column ((t (:background "gray15" :strike-through nil :underline nil :slant normal :weight normal))))
 '(org-done ((t (:foreground "LimeGreen" :weight bold))))
 '(org-drawer ((t (:foreground "plum4"))))
 '(org-imminent-deadline ((t (:inherit nil :foreground "IndianRed"))))
 '(org-level-2 ((t (:foreground "SkyBlue3" :extend nil :inherit outline-2))))
 '(org-scheduled-previously ((t (:foreground "Firebrick"))))
 '(org-super-agenda-header ((t (:inherit nil :foreground "DeepSkyBlue4"))))
 '(org-time-grid ((t (:foreground "DarkGoldenrod"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "MediumPurple4" :inherit rainbow-delimiters-base-face))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "tan4"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "pink4"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "DarkGoldenrod4"))))
 '(rainbow-delimiters-depth-8-face ((t (:inherit rainbow-delimiters-base-face :foreground "DarkOrange4"))))
 '(rainbow-delimiters-depth-9-face ((t (:inherit rainbow-delimiters-base-face :foreground "gold4"))))
 '(rjsx-attr ((t (:foreground "VioletRed" :inherit font-lock-variable-name-face))))
 '(rjsx-tag ((t (:foreground "goldenrod3"))))
 '(rjsx-tag-bracket-face ((t (:foreground "LightGoldenrod4" :inherit default))))
 '(rjsx-text ((t (:inherit nil :foreground "dark sea green"))))
 '(smerge-refined-added ((t (:background "DarkGreen" :inherit smerge-refined-change))))
 '(tooltip ((t (:foreground "yellow3" :background "NavyBlue" :inherit variable-pitch))))
 '(variable-pitch ((t (:foreground "gray50" :weight normal))))
 '(vc-dir-header ((t (:foreground "tan3" :inherit font-lock-type-face))))
 '(vc-dir-header-value ((t (:foreground "purple2" :inherit font-lock-variable-name-face))))
 '(which-func ((t (:inherit info-node))))
 '(widget-field ((t (:box (:line-width (1 . -1) :color "gray46") :extend t))))
 '(woman-unknown ((t (:foreground "IndianRed2" :inherit font-lock-warning-face)))))


;;(shell-command "echo '(run-or-raise-emacs)' | stumpish -e eval")

;; (defun obj ()
;;   "docstring"
;;   (interactive)
;;   (save-excursion
;;     (condition-case nil
;;         (backward-up-list)
;;       (error nil))
;;     (message "%s" (if (looking-back "\\([[:alnum:]]\\|[[:alnum:][-]]\\)*\s*=\s*" 3)
;; 		      t nil)))
;;   )
  
;; (add-hook 'js2-mode-hook (lambda ()
;; 			   (setq yas-buffer-local-condition
;; 				 '(if (obj) '(require-snippet-condition . force-in-comment) t)))
;; 	  )


;; (setq signals-list '( " 1 SIGHUP"	 " 2 SIGINT"	 " 3 SIGQUIT"	 " 4 SIGILL"	 " 5 SIGTRAP"
;;  " 6 SIGABRT"	 " 7 SIGBUS"	 " 8 SIGFPE"	 " 9 SIGKILL"	"10 SIGUSR1"
;; "11 SIGSEGV"	"12 SIGUSR2"	"13 SIGPIPE"	"14 SIGALRM"	"15 SIGTERM"
;; "16 SIGSTKFLT"	"17 SIGCHLD"	"18 SIGCONT"	"19 SIGSTOP"	"20 SIGTSTP"
;; "21 SIGTTIN"	"22 SIGTTOU"	"23 SIGURG"	"24 SIGXCPU"	"25 SIGXFSZ"
;; "26 SIGVTALRM"	"27 SIGPROF"	"28 SIGWINCH"	"29 SIGIO"	"30 SIGPWR"
;; "31 SIGSYS"	"34 SIGRTMIN"	"35 SIGRTMIN+1"	"36 SIGRTMIN+2"	"37 SIGRTMIN+3"
;; "38 SIGRTMIN+4"	"39 SIGRTMIN+5"	"40 SIGRTMIN+6"	"41 SIGRTMIN+7"	"42 SIGRTMIN+8"
;; "43 SIGRTMIN+9"	"44 SIGRTMIN+10"	"45 SIGRTMIN+11"	"46 SIGRTMIN+12"	"47 SIGRTMIN+13"
;; "48 SIGRTMIN+14"	"49 SIGRTMIN+15"	"50 SIGRTMAX-14"	"51 SIGRTMAX-13"	"52 SIGRTMAX-12"
;; "53 SIGRTMAX-11"	"54 SIGRTMAX-10"	"55 SIGRTMAX-9"	"56 SIGRTMAX-8"	"57 SIGRTMAX-7"
;; "58 SIGRTMAX-6"	"59 SIGRTMAX-5"	"60 SIGRTMAX-4"	"61 SIGRTMAX-3"	"62 SIGRTMAX-2"
;; "63 SIGRTMAX-1"	"64 SIGRTMAX"
;; ))

;;; sample
;; (defun my/test-completion (x)
;;   (interactive "P")
;;   (let ((completion-extra-properties '(:annotation-function (lambda (x) "    :this"))))
;;     (completion-in-region (point-at-bol) (point-at-eol) '("ab" "cdef" "ghi" "abc" "pqrs"))
;;     )
;;   )
;; ;;doent work
;; (defun pcomplete/test ()
;;   (let ((completion-extra-properties '(:annotation-function (lambda (x) "    :this")))
;; 	)
;;     ;; (pcomplete-here '("abc" "def" "ab"))
;;     (pcomplete-here '("abc" "def" "ab"))
;;     )
;;   )

