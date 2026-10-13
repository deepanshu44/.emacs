;; -*- lexical-binding: t; -*-
(vertico-mode)
(vertico-indexed-mode)
;;https://elpa.gnu.org/packages/vertico.html
;; Optionally use the `orderless' completion style. See
;; `+orderless-dispatch' in the Consult wiki for an advanced Orderless style
;; dispatcher. Additionally enable `partial-completion' for file path
;; expansion. `partial-completion' is important for wildcard support.
;; Multiple files can be opened at once with `find-file' if you enter a
;; wildcard. You may also give the `initials' completion style a try.
 (use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless)
	completion-category-defaults nil
	 completion-category-overrides '((file (styles partial-completion)))))
 (setq completion-styles '(substring orderless))

;;https://github.com/minad/vertico/wiki
(defun +completion-category-highlight-files (cand)
  (let ((len (length cand)))
    (when (and (> len 0)
	       (eq (aref cand (1- len)) ?/))
      (add-face-text-property 0 len 'dired-directory 'append cand)))
  cand)

(defvar +completion-category-hl-func-overrides
  `((file . ,#'+completion-category-highlight-files))
  "Alist mapping category to highlight functions.")

(advice-add #'vertico--arrange-candidates :around
	    (defun vertico-format-candidates+ (func)
	      (let ((hl-func (or (alist-get (vertico--metadata-get 'category)
					    +completion-category-hl-func-overrides)
				 #'identity)))
		(cl-letf* (((symbol-function 'actual-vertico-format-candidate)
			    (symbol-function #'vertico--format-candidate))
			   ((symbol-function #'vertico--format-candidate)
			    (lambda (cand &rest args)
			      (apply #'actual-vertico-format-candidate
				     (funcall hl-func cand) args))))
		                    (funcall func)))))

(defun +completion-category-highlight-commands (cand)
  (let ((len (length cand)))
    (when (and (> len 0)
	       (with-current-buffer (nth 1 (buffer-list)) ; get buffer before minibuffer
		 (or (eq major-mode (intern cand)) ; check major mode
		     (ignore-errors (auto-minor-mode-enabled-p (intern cand)))))) ; check minor modes
      (add-face-text-property 0 len '(:foreground "red") 'append cand))) ; choose any color or face you like
  cand)

 (add-to-list '+completion-category-hl-func-overrides `(command . ,#'+completion-category-highlight-commands))
;; (vertico-reverse-mode)

(defun home-dir ()
  (interactive)
  (insert "/~/")
  )
;; Configure directory extension.
(use-package vertico-directory
  :after vertico
  :ensure nil
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
	      ("RET" . vertico-directory-enter)
	      ("DEL" . vertico-directory-delete-char)
	      ("C-c C-k" . home-dir)
	      ("M-DEL" . vertico-directory-delete-word))
  ;; Tidy shadowed file names
    :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))


;; (advice-add #'vertico--format-candidate :around
;; 	    (lambda (orig cand prefix suffix index _start)
;; 	      (setq cand (funcall orig cand prefix suffix index _start))
;; 	      (concat
;; 	       (if (= vertico--index index)
;; 		   (propertize "Â» " 'face 'vertico-current)
;; 		 "  ")
;; 	                      cand)))

;; try the `completion-category-sort-function' first
(advice-add #'vertico--sort-function :before-until #'completion-category-sort-function)

(defun completion-category-sort-function ()
  (alist-get (vertico--metadata-get 'category)
	     completion-category-sort-function-overrides))

;; (defun completion-category-sort-function ()
;;   (or (vertico--metadata-get 'display-sort-function)
;;       (alist-get (vertico--metadata-get 'category)
;; 		 completion-category-sort-function-overrides)))

(defvar completion-category-sort-function-overrides
  '((file . directories-before-files))
  "Completion category-specific sorting function overrides.")

(defun directories-before-files (files)
  ;; Still sort by history position, length and alphabetically
  (setq files (vertico-sort-history-length-alpha files))
  ;; But then move directories first
  (nconc (seq-filter (lambda (x) (string-suffix-p "/" x)) files)
	 (seq-remove (lambda (x) (string-suffix-p "/" x)) files)))

;; (define-key vertico-map (kbd "C-w") 'vertico-directory-up)
(define-key vertico-map (kbd "C-w") 'vertico-directory-delete-word)
;; (define-key vertico-map (kbd ",") 'vertico-directory-delete-char)
