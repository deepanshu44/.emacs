;; ts
(defvar my-eglot-overlays (make-hash-table :test 'equal)
  "Hash table to store overlays for variables with their positions.")
(eglot-ensure)
(defun my-eglot-show-ts-variable-types ()
  "Display inferred TypeScript types inline using overlays, showing complex types and conditionals, but ignoring simple variables with primitive types."
  (interactive)
  (when (eglot-managed-p)
    (save-excursion
      (goto-char (point-min))
      (let ((processed-vars (make-hash-table :test 'equal))) ;; Track processed variables
        (while (re-search-forward "\\_<\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)\\_>" nil t)
          (let* ((var-name (match-string 1))
                 (pos (match-end 1)) ;; Place overlay after variable name
                 (hover (jsonrpc-request
                         (eglot--current-server-or-lose)
                         :textDocument/hover
                         `(:textDocument ,(eglot--TextDocumentIdentifier)
                                         :position ,(eglot--pos-to-lsp-position pos))))
                 (type-info (and hover (plist-get (plist-get hover :contents) :value))))
            ;; Skip simple primitive types but show complex types or conditionals
            (when (and type-info
                       ;; (not (string-match-p ":" type-info))
                       (not (gethash var-name processed-vars))
		       (string-match-p "\\b\\(const\\|let\\|type\\|function\\)\\b" type-info)
		        ;; Skip conditional generics like T extends U ? X : Y
                       ;; (not (string-match-p "<[^>]*extends[^>]*\\?.*:" type-info))
		       ;; Don't skip if it's not a primitive type
		       ;; (not (string-match-p
		       ;; 	     "\\(const\\|let\\) [[:alnum:]_-]+: ?\\(number\\|string\\|boolean\\|undefined\\|null\\)\\b"
		       ;; 	     type-info))
		       ;; (not (string-match-p "type [[:alnum:]]+<\\b.*\\b> ?=" type-info)))
		       (not (string-match-p "type.*<.*>.*" type-info))
		       (not (string-match-p "\\(const\\|let\\|type\\).*{.*" type-info))
		       ;; (not (string-match-p ".*" type-info))
		       )
	      ;; (message "FORMATSTRING %s" type-info)
	      ;; Allow conditionals to show even if resolved
              (puthash var-name t processed-vars) ;; Mark variable as processed
              ;; (my-eglot--create-type-overlay pos type-info)
	      (my-eglot--create-or-update-overlay pos var-name type-info)
	      )))))))

(defun my-eglot--create-or-update-overlay (pos var-name type-info)
  "Create or update the overlay at POS displaying only TYPE-INFO for VAR-NAME."
  (let ((overlay (gethash var-name my-eglot-overlays)))
    (if overlay
        (progn
          ;; Update existing overlay text
          (overlay-put overlay 'before-string
                       (propertize
			;; (format "┍ %s ┑\n"
			(format "╔═ %s ═╗\n"
				(let ((str (caddr (string-lines type-info))))
				  (if (string-match-p "\\(function\\|=>\\)" str)
				      str
				    (replace-regexp-in-string
				     ".*\\(=\\|:\\) ?\\(.*\\)"
				     "\\2" str ))))
			'face '(:foreground "gray50" :slant italic)))
          (overlay-put overlay 'evaporate t)) ;; Ensure overlay disappears when saving
      ;; If overlay does not exist, create a new one
      ;; (let ((new-overlay (make-overlay pos (line-end-position))))
      (let ((new-overlay (make-overlay (line-beginning-position) pos)))
	;; (message "%s %s %s" (line-beginning-position) pos new-overlay)
	(message "%s" (caddr (string-lines type-info)))
        (overlay-put new-overlay 'before-string
                     (propertize
		      ;; ⮩
		      ;; (format "┍ %s ┑\n"
		      (format "╔═ %s ═╗\n"
			      (let ((str (caddr (string-lines type-info))))
				(if (string-match-p "\\(function\\|=>\\)" str)
				    str
				  (replace-regexp-in-string
				   ".*\\(=\\|:\\) ?\\(.*\\)"
				   "\\2" str )))
			      ;; 	      (replace-regexp-in-string
			      ;; 	       ".*\\(=\\|:\\) ?\\(.*\\)"
			      ;; 	       "\\2"
			      ;; 	       (caddr (string-lines type-info))))
			      'face '(:foreground "gray50" :slant italic))))
        (overlay-put new-overlay 'evaporate t)
        (puthash var-name new-overlay my-eglot-overlays)))))

(clrhash my-eglot-overlays)
(define-key typescript-ts-mode-map (kbd "C-c C-t") 'my-eglot-show-ts-variable-types)
;; old
;; (defun my-eglot-show-ts-variable-types ()
;;   "Display inferred TypeScript types inline using overlays, showing complex types and conditionals, but ignoring simple variables with primitive types."
;;   (interactive)
;;   (when (eglot-managed-p)
;;     (save-excursion
;;       (goto-char (point-min))
;;       (let ((processed-vars (make-hash-table :test 'equal))) ;; Track processed variables
;;         (while (re-search-forward "\\_<\\([a-zA-Z_$][a-zA-Z0-9_$]*\\)\\_>" nil t)
;;           (let* ((var-name (match-string 1))
;;                  (pos (match-end 1)) ;; Place overlay after variable name
;;                  (hover (jsonrpc-request
;;                          (eglot--current-server-or-lose)
;;                          :textDocument/hover
;;                          `(:textDocument ,(eglot--TextDocumentIdentifier)
;;                                          :position ,(eglot--pos-to-lsp-position pos))))
;;                  (type-info (and hover (plist-get (plist-get hover :contents) :value))))
;;             ;; Skip simple primitive types but show complex types or conditionals
;;             (when (and type-info
;;                        ;; (not (string-match-p ":" type-info))
;;                        (not (gethash var-name processed-vars))
;; 		        ;; Skip conditional generics like T extends U ? X : Y
;;                        ;; (not (string-match-p "<[^>]*extends[^>]*\\?.*:" type-info))
;; 		       ;; Don't skip if it's not a primitive type
;; 		       (not (string-match-p
;; 			     "\\(const\\|let\\) [[:alnum:]_-]+: ?\\(number\\|string\\|boolean\\|undefined\\|null\\)\\b"
;; 			     type-info))
;; 		       ;; (not (string-match-p "type [[:alnum:]]+<\\b.*\\b> ?=" type-info))
;; 		       (not (string-match-p "type.*<.*>.*" type-info)))
;; 	      (message "FORMATSTRING %s" type-info)
;; 	      ;; Allow conditionals to show even if resolved
;;               (puthash var-name t processed-vars) ;; Mark variable as processed
;;               (my-eglot--create-type-overlay pos type-info))))))))

;; (defun my-eglot--create-type-overlay (pos type-info)
;;   "Create an overlay at POS displaying TYPE-INFO below the variable."
;;   (let ((overlay (make-overlay pos (line-end-position))))
;;     (overlay-put overlay 'after-string
;;                  (propertize (format "\n⮩ %s" (replace-regexp-in-string ".*\\(=\\|:\\) ?\\(.*\\)" "\\2"  (caddr (string-lines type-info))))
;;                  ;; (propertize (format "  ⮩ %s" (extract-type type-info))
;;                              'face '(:foreground "gray50" :slant italic)))
;;     (overlay-put overlay 'evaporate t)))

;; (defun test ()
;;   (and (if (string-match-p "\\(const\\|let\\|type\\|function\\)" (buffer-substring-no-properties (line-beginning-position) (line-end-position))) (message "1yes"))
;;        ;; Skip conditional generics like T extends U ? X : Y
;;        ;; (not (string-match-p "<[^>]*extends[^>]*\\?.*:" (buffer-substring (line-beginning-position) (line-end-position))))
;;        ;; Don't skip if it's not a primitive type
;;        (if (not (string-match-p
;; 	     "\\(const\\|let\\) [[:alnum:]_-]+: ?\\(number\\|string\\|boolean\\|undefined\\|null\\)\\b"
;; 	     (buffer-substring (line-beginning-position) (line-end-position)))) (message "2yes"))
;;        ;; (not (string-match-p "type [[:alnum:]]+<\\b.*\\b> ?=" (buffer-substring (line-beginning-position) (line-end-position)))))
;;        (if (not
;; 	(string-match-p "type.*<.*>.*" (car (split-string
;; 					     (buffer-substring (line-beginning-position) (line-end-position))
;; 					     "=")))) (message "3yes"))
;;        (if (not (string-match-p "\\(const\\|let\\|type\\).*{.*"
;; 				 (buffer-substring (line-beginning-position) (line-end-position))))
;; 	   (message "4yes"))
;;        ))
