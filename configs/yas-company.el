;; -*- lexical-binding: t; -*-
;; ;;https://emacs.stackexchange.com/a/7925/

;; (defun check-expansion ()
;;   (save-excursion
;;     (if (looking-at "\\_>") t
;;       (backward-char 1)
;;       (if (looking-at "\\.") t
;;     (backward-char 1)
;;     (if (looking-at "->") t nil)))))

;; (defun do-yas-expand ()
;;   (let ((yas/fallback-behavior 'return-nil))
;;     (yas/expand)))

;; (defun tab-indent-or-complete ()
;;   (interactive)
;;   (cond
;;    ((minibufferp)
;;     (minibuffer-complete))
;;    (t
;;     (indent-for-tab-command)
;;     (if (or (not yas/minor-mode)
;;         (null (do-yas-expand)))
;;     (if (check-expansion)
;;         (progn
;;           (company-manual-begin)
;;           (if (null company-candidates)
;;           (progn
;;             (company-abort)
;;             (indent-for-tab-command)))))))))

;; (defun haskell-tab-indent-or-complete ()
;;   (interactive)
;;   (cond
;;    ((minibufferp)
;;     (minibuffer-complete))
;;    (t
;;     (indent-for-tab-command)
;;     (if (or (not yas/minor-mode)
;;         (null (do-yas-expand)))
;;     (if (check-expansion)
;;         (progn
;;           (company-manual-begin)
;;           (if (null company-candidates)
;;           (progn
;;             (company-abort)
;;             (indent-for-tab-command)))))))))

;; ;; (defun tab-complete-or-next-field ()
;; ;;   (interactive)
;; ;;   (if (or (not yas/minor-mode)
;; ;; 	  (null (do-yas-expand)))
;; ;;       (if company-candidates
;; ;; 	  (company-complete-selection)
;; ;; 	(yas-next-field)));;f (check-expansion)))
;; ;; 	;;(progn
;; ;; 	;;  (company-manual-begin)
;; ;; 	;;  (if (null company-candidates)
;; ;; 	;;  (progn
;; ;; 	;;    (company-abort)
;; ;; 	;;    (yas-next-field))))
;; ;; 	;;(yas-next-field))
;; ;; 	)
;; (defun tab-complete-or-next-field ()
;;   (interactive)
;;   (if (or (not yas/minor-mode)
;;       (null (do-yas-expand)))
;;       (if company-candidates
;;       (company-complete-selection)
;;     (if (check-expansion)
;;       (progn
;;         (company-manual-begin)
;;         (if (null company-candidates)
;;         (progn
;;           (company-abort)
;;           (yas-next-field))))
;;       (yas-next-field)))))
;; (defun expand-snippet-or-complete-selection ()
;;   (interactive)
;;   (if (or (not yas/minor-mode)
;;       (null (do-yas-expand))
;;       (company-abort))
;;       (company-complete-selection)))

;; (defun abort-company-or-yas ()
;;   (interactive)
;;   (if (null company-candidates)
;;       (yas-abort-snippet)
;;     (company-abort)))

;; ;; (global-set-key [tab] 'tab-indent-or-complete)
;; (global-set-key (kbd "TAB") 'tab-indent-or-complete)
;; ;; (global-set-key [(control return)] 'company-complete-common)

;; ;; (define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
;; (define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)

;; (define-key yas-minor-mode-map [tab] nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)

;; ;; (define-key yas-keymap [tab] 'tab-complete-or-next-field)
;; ;; (define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
;; (define-key yas-keymap [(control tab)] 'yas-next-field)
;; (define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)

;; ;;(define-key company-active-map (kbd "TAB") 'nil)


(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
    (backward-char 1)
    (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (cond
   ((minibufferp)
    (minibuffer-complete))
   (t
    (indent-for-tab-command)
    (if (or (not yas/minor-mode)
        (null (do-yas-expand)))
    (if (check-expansion)
        (progn
          (company-manual-begin)
          (if (null company-candidates)
          (progn
            (company-abort)
            (indent-for-tab-command)))))))))

(defun tab-complete-or-next-field ()
  (interactive)
  (if (or (not yas/minor-mode)
      (null (do-yas-expand)))
      (if company-candidates
      (company-complete-selection)
    (if (check-expansion)
      (progn
        (company-manual-begin)
        (if (null company-candidates)
        (progn
          (company-abort)
          (yas-next-field))))
      (yas-next-field)))))

(defun expand-snippet-or-complete-selection ()
  (interactive)
  (if (or (not yas/minor-mode)
      (null (do-yas-expand))
      (company-abort))
      (company-complete-selection)))

(defun abort-company-or-yas ()
  (interactive)
  (if (null company-candidates)
      (yas-abort-snippet)
    (company-abort)))

;; (global-set-key [tab] 'tab-indent-or-complete)
;; (global-set-key (kbd "TAB") 'tab-indent-or-complete)
;; (global-set-key [(control return)] 'company-complete-common)

;; (define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
;; (define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)
(define-key company-active-map (kbd "TAB") 'tab-complete-or-next-field)

;; (define-key yas-minor-mode-map [tab] nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)

;; (define-key yas-keymap [tab] 'tab-complete-or-next-field)
;; (define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
;; (define-key yas-keymap [(control tab)] 'yas-next-field)
(define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)


;; convenience function
(defun class-super-get-parent-params (ret-typ)
  ;; typescript
  ;;https://github.com/joaotavora/eglot/issues/507#issuecomment-1189636367
  (let* ((str (append (plist-get (car (append (plist-get (jsonrpc-request (eglot--current-server-or-lose)
									  :textDocument/signatureHelp (eglot--TextDocumentPositionParams)) :signatures) nil)) :parameters) nil))
	 (output-simple (mapconcat (lambda (x) (car (split-string (cadr x) ":")))
			    str ", "))
	 (output-typed (mapconcat (lambda (x) (cadr x))
			    str ", "))
	 (output-typed-list (mapcar (lambda (x) (cadr x))
			    str ))
	 (output-simple-list (mapcar (lambda (x) (car (split-string (cadr x) ":")))
			    str ))
	 )
    (cond ((equal ret-typ "simple") output-simple)
	  ((equal ret-typ "typed") output-typed)
	  ((equal ret-typ "typed-list") output-typed-list)
	  ((equal ret-typ "simple-list") output-simple-list)
	  (t nil)
	  )
    )
  )
