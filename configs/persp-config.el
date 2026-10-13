;; -*- lexical-binding: t; -*-
;; (with-eval-after-load "persp-mode"
;; ;; eshell
;; (persp-def-buffer-save/load
;;  :mode 'eshell-mode :tag-symbol 'def-eshell-buffer
;;  :save-vars '(major-mode default-directory))

;; ;; shell
;; (persp-def-buffer-save/load
;;  :mode 'shell-mode
;;  :mode-restore-function #'(lambda (_mode) (shell)) ; or #'identity if you do not want to start shell process
;;  :tag-symbol 'def-shell
;;   :save-vars '(major-mode default-directory))
;; ;; compile
;; (persp-def-buffer-save/load
;;  :mode 'compilation-mode :tag-symbol 'def-compilation-buffer
;;  :save-vars '(major-mode default-directory compilation-directory
;; 			 compilation-environment compilation-arguments))

;; ;; magit-status
;; (with-eval-after-load "magit-autoloads"
;;   (autoload 'magit-status-mode "magit")
;;   (autoload 'magit-refresh "magit")
;;   (persp-def-buffer-save/load
;;    :mode 'magit-status-mode :tag-symbol 'def-magit-status-buffer
;;    :save-vars '(major-mode default-directory)
;;    :after-load-function #'(lambda (b &rest _)
;; 			    (with-current-buffer b (magit-refresh)))))
;; )
