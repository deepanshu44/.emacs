;; -*- lexical-binding: t; -*-
  ;; "`company-mode' completion backend for BBDB."
(defun company-mysql-backend (command &optional arg &rest _ignore)
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-mysql-backend))
    (prefix (let ((case-fold-search t))
	      (company-grab-symbol)))
    (candidates (let ((case-fold-search t)
		      (sqlbuff sql-buffer)
		      ;; (sqlbuff (sql-find-sqli-buffer))
		      (arg (upcase arg)))
		  (cond
		   ;; ((company-grab "^.+" nil (line-beginning-position))
		   ;; dealt with sql interactive mode and sql-mode both
		   ((company-grab "^\\(mysql>\\)? *\\(\\w+\\)" 2)
		    ;; ((company-grab "> \\(\\w+\\)" 1)
		    (all-completions arg
				     '("CREATE" "ALTER TABLE" "DROP" "SELECT" "INSERT" "UPDATE" "DELETE" "MERGE"
				       "GRANT" "REVOKE" "DESCRIBE" "SHOW" "DESC" "INSERT INTO" "TRUNCATE TABLE")))
		   ;; ((company-grab "SELECT \\([[:alnum:] ,]*\\)")
		   ((company-grab "SELECT \\(\\(DISTINCT \\)?[[:alnum:].]*\\)\\( ?, ?[[:alnum:].]*\\)?*")
		    (let* ((table-name-exists (looking-at ".*FROM \\([[:alnum:]_-]+\\)"))
			   ;; table name exist, use that
			   (table-name (if table-name-exists (match-string-no-properties 1)))
			   (still-completing (looking-back "SELECT \\([[:alnum:] ,]+\\) ?"))
			   (completed-values
			    (if still-completing
				(split-string (match-string-no-properties 1) "," t " ")))
			   (table-attributes (if table-name-exists
						 (cdr (sql-redirect-value sqlbuff
									  (concat "DESCRIBE " table-name ";")
									  "^| *\\([[:alnum:]_-]+\\)" 1))))
			   (default (append '("*" "COUNT(*)" "DISTINCT")
					    (cdr (sql-redirect-value sqlbuff "show tables;" "^| *\\([[:alnum:]_-]+\\)" 1)))))
		      ;;user entered column names
		      (if (looking-back "^.*?\\([[:alnum:]]+\\)\\.")
			  ;; process table name
			  (if (match-string-no-properties 1)
			      (cdr (sql-redirect-value sqlbuff
						       (concat "DESCRIBE " (match-string-no-properties 1) ";")
						       "^| *\\([[:alnum:]_-]+\\)" 1))
			    )
			(if table-name
			    (if completed-values
				(seq-difference table-attributes completed-values)
			      (seq-difference (append table-attributes default) completed-values))
			  default
			  ))
		      ))
		   ((company-grab "\\(FROM\\|DESCRIBE\\|DESC\\|INSERT INTO\\|UPDATE\\|DELETE FROM\\|TRUNCATE TABLE\\|ALTER TABLE\\) ")
		    (cdr (sql-redirect-value sqlbuff "show tables;" "^| *\\([[:alnum:]_-]+\\)" 1)))
		   ((company-grab "\\(CREATE\\|DROP\\) ")
		    (all-completions arg '("DATABASE" "TABLE")))
		   ((company-grab "\\(USE\\|DROP DATABASE\\) ")
		    (all-completions arg
				     (cdr (sql-redirect-value sqlbuff "show databases;" "^| *\\([[:alnum:]_-]+\\)" 1))))
		   ((company-grab "SHOW ")
		    (all-completions arg '("TABLES" "DATABASES")))
		   ((company-grab "INSERT INTO \\(\\b.+\\b\\) (")
		    (let* ((table-name (match-string-no-properties 1))
			   (attributes
			    (cdr (sql-redirect-value sqlbuff
						     (concat "DESCRIBE " table-name ";")
						     "^| *\\([[:alnum:]_-]+\\)" 1))))
		      (if table-name
			  (insert (string-join attributes ",")))))
		   ((company-grab "INSERT INTO \\(\\b.+\\b\\)\\( (.+)\\)? VALUES ")
		    (let* ((table-name (match-string-no-properties 1))
			   (attributes
			    (cdr (sql-redirect-value sqlbuff
						     (concat "DESCRIBE " table-name ";")
						     "^| *\\([[:alnum:]_-]+\\) *| *\\([[:alnum:]_-\\(,\\)]+\\)" '(1 2)))))
		      (if table-name
			  ;; (message "FORMATSTRING %s" (cadar attributes))
			  (insert
			   (concat "(" (mapconcat
					(lambda (att)
					  (concat "'"
						  (read-from-minibuffer (concat (car att) " [" (cadr att) "]: "))
						  "'"))
					attributes ",") ")")))))
		   ((company-grab "UPDATE \\(\\b.+\\b\\) SET \\(\\b.+\\b\\)*?")
		    (let* ((table-name (match-string-no-properties 1))
			   (attributes
			    (cdr (sql-redirect-value sqlbuff
						     (concat "DESCRIBE " table-name ";")
						     "^| *\\([[:alnum:]_-]+\\)" 1))))
		      (all-completions arg attributes)
		      ))
		   ((company-grab "ALTER TABLE [[:alnum:]_-]+ ")
		    (all-completions arg '("ADD" "DROP" "MODIFY" "RENAME TO")))
		   ((company-grab "ALTER TABLE \\([[:alnum:]_-]+\\) \\(ADD\\|DROP\\|MODIFY\\) ")
		    (all-completions arg (cdr (sql-redirect-value sqlbuff
								  (concat "DESCRIBE " (match-string-no-properties 1) ";")
								  "^| *\\(\\w+\\)" 1))))
		   ((company-grab "WHERE ")
		    (and (looking-back " \\([[:alnum:]_-]+\\) WHERE ")
			 (cdr (sql-redirect-value sqlbuff
						  (concat "DESCRIBE " (match-string-no-properties 1) ";")
						  "^| *\\(\\w+\\)" 1))))
		   (t (all-completions
		       arg
		       '("FROM" "WHERE" "GROUP BY" "HAVING" "INNER JOIN" "ON" "PRIMARY KEY" "FOREIGN KEY" "NOT"
			 "ORDER BY" "VALUES" "SET" "LIMIT")))
		   )))
    (sorted t)))
;; (defun company-mysql2-backend (command &optional arg &rest _ignore)
;;   (interactive (list 'interactive))
;;   (cl-case command
;;     (interactive (company-begin-backend 'company-mysql-backend))
;;     (prefix (let ((case-fold-search t))
;; 	      (company-grab-symbol)))
;;     (candidates (let ((case-fold-search t)
;; 		      (sqlbuff sql-buffer)
;; 		      (arg (upcase arg)))
;; 		  (cond
;; 		   ;; ((company-grab "^.+" nil (line-beginning-position))
;; 		   ((company-grab " *\\(\\w+\\)" 1)
;; 		    (all-completions arg
;; 				     '("CREATE" "ALTER TABLE" "DROP" "SELECT" "INSERT" "UPDATE" "DELETE" "MERGE"
;; 				       "GRANT" "REVOKE" "DESCRIBE" "SHOW" "DESC" "INSERT INTO" "TRUNCATE TABLE")))
;; 		   ;; ((company-grab "SELECT \\([[:alnum:] ,]*\\)")
;; 		   ((company-grab "SELECT \\(\\(DISTINCT \\)?[[:alnum:].]*\\)\\( ?, ?[[:alnum:].]*\\)?*")
;; 		    (let* ((table-name-exists (and sqlbuff (looking-at ".*FROM \\([[:alnum:]_-]+\\)")))
;; 			   ;; table name exist, use that
;; 			   (table-name (if table-name-exists (match-string-no-properties 1)))
;; 			   (still-completing (looking-back "SELECT \\([[:alnum:] ,]+\\) ?"))
;; 			   (completed-values
;; 			    (if still-completing
;; 				(split-string (match-string-no-properties 1) "," t " ")))
;; 			   (table-attributes (if table-name-exists
;; 						 (cdr (sql-redirect-value sqlbuff
;; 									  (concat "DESCRIBE " table-name ";")
;; 									  "^| *\\([[:alnum:]_-]+\\)" 1))))
;; 			   (default (append '("*" "COUNT(*)" "DISTINCT")
;; 					    (and sqlbuff
;; 						 (cdr (sql-redirect-value sqlbuff "show tables;" "^| *\\([[:alnum:]_-]+\\)" 1))))))
;; 		      ;;user entered column names
;; 		      (if (looking-back "^.*?\\([[:alnum:]]+\\)\\.")
;; 			  ;; process table name
;; 			  (if (and sqlbuff (match-string-no-properties 1))
;; 			      (cdr (sql-redirect-value sqlbuff
;; 						       (concat "DESCRIBE " (match-string-no-properties 1) ";")
;; 						       "^| *\\([[:alnum:]_-]+\\)" 1))
;; 			    )
;; 			(if table-name
;; 			    (if completed-values
;; 				(seq-difference table-attributes completed-values)
;; 			      (seq-difference (append table-attributes default) completed-values))
;; 			  default
;; 			  ))
;; 		      ))
;; 		   ((company-grab "\\(FROM\\|DESCRIBE\\|DESC\\|INSERT INTO\\|UPDATE\\|DELETE FROM\\|TRUNCATE TABLE\\|ALTER TABLE\\) ")
;; 		    (and  sqlbuff (cdr (sql-redirect-value sqlbuff "show tables;" "^| *\\([[:alnum:]_-]+\\)" 1))))
;; 		   ((company-grab "\\(CREATE\\|DROP\\) ")
;; 		    (all-completions arg '("DATABASE" "TABLE")))
;; 		   ((company-grab "\\(USE\\|DROP DATABASE\\) ")
;; 		    (all-completions arg
;; 				     (and (cdr (sql-redirect-value sqlbuff "show databases;" "^| *\\([[:alnum:]_-]+\\)" 1)))))
;; 		   ((company-grab "SHOW ")
;; 		    (all-completions arg '("TABLES" "DATABASES")))
;; 		   ((company-grab "INSERT INTO \\(\\b.+\\b\\) (")
;; 		    (let* ((table-name (match-string-no-properties 1))
;; 						(attributes
;; 						 (and sqlbuff (cdr (sql-redirect-value sqlbuff
;; 									  (concat "DESCRIBE " table-name ";")
;; 									  "^| *\\([[:alnum:]_-]+\\)" 1)))))
;; 					   (if table-name
;; 					       (insert (string-join attributes ",")))))
;; 		   ((company-grab "INSERT INTO \\(\\b.+\\b\\)\\( (.+)\\)? VALUES ")
;; 		    (let* ((table-name (match-string-no-properties 1))
;; 						(attributes
;; 						 (and sqlbuff (cdr (sql-redirect-value sqlbuff
;; 									  (concat "DESCRIBE " table-name ";")
;; 									  "^| *\\([[:alnum:]_-]+\\)" 1)))))
;; 					   (if table-name
;; 					       (insert (mapconcat
;; 							(lambda (att) (read-from-minibuffer (concat att ": ")))
;; 							attributes)))))
;; 		   ((company-grab "UPDATE \\(\\b.+\\b\\) SET \\(\\b.+\\b\\)*?")
;; 		    (let* ((table-name (match-string-no-properties 1))
;; 			   (attributes
;; 			    (and sqlbuff (cdr (sql-redirect-value sqlbuff
;; 						     (concat "DESCRIBE " table-name ";")
;; 						     "^| *\\([[:alnum:]_-]+\\)" 1)))))
;; 		      (all-completions arg attributes)
;; 		      ))
;; 		   ((company-grab "ALTER TABLE [[:alnum:]_-]+ ")
;; 		    (all-completions arg '("ADD" "DROP" "MODIFY" "RENAME TO")))
;; 		   ((company-grab "ALTER TABLE \\([[:alnum:]_-]+\\) \\(ADD\\|DROP\\|MODIFY\\) ")
;; 		    (all-completions arg (and sqlbuff (cdr (sql-redirect-value sqlbuff
;; 						     (concat "DESCRIBE " (match-string-no-properties 1) ";")
;; 						     "^| *\\(\\w+\\)" 1)))))
;; 		   ((company-grab "WHERE ")
;; 		    (and (looking-back " \\(([[:alnum:]_-]+\\) WHERE ")
;; 			 (and (cdr (sql-redirect-value sqlbuff
;; 						     (concat "DESCRIBE " (match-string-no-properties 1) ";")
;; 						     "^| *\\(\\w+\\)" 1))))
;; )
;; 		   (t (all-completions
;; 		       arg
;; 		       '("FROM" "WHERE" "GROUP BY" "HAVING" "INNER JOIN" "ON" "PRIMARY KEY" "FOREIGN KEY" "NOT"
;; 			 "ORDER BY" "VALUES" "SET" "LIMIT")))
;; 		   )))
;;     (sorted t)))
;; (sql-redirect-value "*SQL: MySQL*" "describe userProfile;" "^| *\\(\\w+\\)" 1)
(setq-local company-backends '(company-mysql-backend))
(setq-local company-minimum-prefix-length 0)

;; (with-temp-buffer
;;   (sql-redirect "*SQL: MySQL*" "describe userProfile;" (current-buffer))
;;   (message "%s" (buffer-substring (point-min) (point-max))))

;; (cdr (sql-redirect-value "*SQL: MySQL*" "describe userProfile;" "^| *\\(\\w+\\)" 1))

;; (cdr (sql-redirect-value "*SQL: MySQL*" "show tables;" "^| *\\(\\w+\\)" 1))

;; (defun pcomplete/sql-interactive-mode/select ()
;;   (message "abcd:")
;;   (pcomplete-here '("1234" "5678"))
;;   ;; (pcomplete-here (pcomplete-entries))
;;   ;; ((pcomplete-match "from " 0)
;;   ;; 	  (pcomplete-here
;;   ;; 	   (list "==>ab" "==>cd")
;;   ;; 	   (pcomplete-match-string 1 0)))
;;   ;; (while (pcomplete-here (pcomplete-dirs)))
;;   )


;; (require 'cl-lib)

;; (defvar company-advanced-keywords
;;   '(("foo" "overload 1") ("foo" "overload 2") ("bar" "method 1")))

;; (defun company-advanced--make-candidate (candidate)
;;   (let ((text (car candidate))
;;         (meta (cadr candidate)))
;;     (propertize text 'meta meta)))

;; (defun company-advanced--candidates (prefix)
;;   (let (res)
;;     (dolist (item company-advanced-keywords)
;;       (when (string-prefix-p prefix (car item))
;;         (push (company-advanced--make-candidate item) res)))
;;     res
;;     ;; '("foobar" "foobaz" "foobarbaz")
;;     ))
;; ;; (defun company-advanced--candidates (prefix)
;; ;;   (message "prefl: %s" prefix)
;; ;;   (let (res)
;; ;;     (dolist (item company-advanced-keywords)
;; ;;       (when (string-prefix-p prefix (car item))
;; ;;         (push (company-advanced--make-candidate item) res)))
;; ;;     res
;; ;;     ;; '("foobar" "foobaz" "foobarbaz")
;; ;;     ))

;; (defun company-advanced--meta (candidate)
;;   (format "This will use %s of %s"
;;           (get-text-property 0 'meta candidate)
;;           (substring-no-properties candidate)))

;; (defun company-advanced--annotation (candidate)
;;   (format " (%s)" (get-text-property 0 'meta candidate)))

;; (defun company-advanced (command &optional arg &rest ignored)
;;   (interactive (list 'interactive))
;;   (cl-case command
;;     (interactive (company-begin-backend 'company-advanced))
;;     (prefix (company-grab-symbol-cons "\\.\\|->" 2))
;;     (candidates (company-advanced--candidates arg))
;;     ;; (annotation (company-advanced--annotation arg))
;;     ;; (meta (company-advanced--meta arg))
;;     ))
