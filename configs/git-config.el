;; -*-lexical-binding: t-*-
;; http://snarfed.org/emacs-vc-git-tweaks
;; In vc-git and vc-dir for git buffers, make (C-x v) a run git add, u run git
;; reset, and r run git reset and checkout from head.
(defun my-vc-git-command (verb fn)
  (let* ((fileset-arg (or vc-fileset (vc-deduce-fileset nil t)))
         (backend (car fileset-arg))
         (files (nth 1 fileset-arg)))
    (if (eq backend 'Git)
        (progn (funcall fn files)
               (message (concat verb " " (number-to-string (length files))
                                " file(s).")))
      (message "Not in a vc git buffer."))))

;; (defun my-vc-git-add (&optional revision vc-fileset comment)
;;   (interactive "P")
;;   (my-vc-git-command "Staged" 'vc-git-register)
;;   (vc-dir-refresh)
;;   )

(defun my-vc-git-reset (&optional revision vc-fileset comment)
  (interactive "P")
  (my-vc-git-command "Unstaged"
		     (lambda (files) (vc-git-command nil 0 files "reset" "-q" "--")))
  (vc-dir-refresh)
  )

(defun my-vc-dir ()
  "docstring"
  (interactive "")
  (if (project-current)
      (vc-dir (project-root (project-current t)))
    (let ((input (completing-read "Not VC: Create VC Directory? " '("no" "yes"))))
      (if (string= input "yes")
	  (let ((name (read-from-minibuffer "Enter dir name: ")))
	    (if (length> name 0) (progn
 				   (make-directory name)
				   (dired name)))  
	    (vc-git-create-repo)
	    )
	(vc-git-create-repo)
	))
    )
  )
;; (define-key vc-prefix-map [(r)] 'vc-revert-buffer)
;; (define-key vc-dir-mode-map [(r)] 'vc-revert-buffer)
;; (define-key vc-prefix-map [(a)] 'my-vc-git-add)
(define-key vc-dir-mode-map [(a)] 'my-vc-git-add)
(define-key vc-prefix-map [(u)] 'my-vc-git-reset)
(define-key vc-dir-mode-map [(u)] 'my-vc-git-reset)
(define-key vc-prefix-map [(b)] 'vc-retrieve-tag)
(define-key vc-dir-mode-map [(b)] 'vc-retrieve-tag)
(define-key vc-prefix-map [(f)] 'vc-log-incoming)
(define-key vc-dir-mode-map [(f)] 'vc-log-incoming)
(define-key vc-dir-mode-map (kbd "c f") 'vc-log-incoming)
(define-key vc-dir-mode-map (kbd "c p") 'vc-log-outgoing)
(define-key vc-dir-mode-map (kbd "e") 'project-eshell)
(define-key vc-dir-mode-map (kbd "d") 'vc-diff)
(define-key vc-dir-mode-map (kbd "k") 'vc-dir-clean-files)
(define-key vc-prefix-map [(d)] 'my-vc-dir)

(define-key vc-dir-mode-map (kbd "e")
  (lambda () (interactive "")
    (let* ((wind (split-window (selected-window))))
      (select-window wind)
      (project-eshell)
      ))
  )
;; hide up to date files after refreshing in vc-dir
(define-key vc-dir-mode-map [(g)]
  (lambda () (interactive) (vc-dir-refresh) (vc-dir-hide-up-to-date)))
;; In vc-git and vc-dir for git buffers, make (C-x v) a run git add, u run git
;; reset, and r run git reset and checkout from head.
(defun my-vc-git-command (verb fn)
  (let* ((fileset-arg (or vc-fileset (vc-deduce-fileset nil t)))
         (backend (car fileset-arg))
         (files (nth 1 fileset-arg)))
    (if (eq backend 'Git)
        (progn (funcall fn files)
               (message (concat verb " " (number-to-string (length files))
                                " file(s).")))
      (message "Not in a vc git buffer."))))

(defun my-vc-git-add (&optional revision vc-fileset comment)
  (interactive "P")
  (my-vc-git-command "Staged" 'vc-git-register)
  (vc-dir-refresh)
  )

(defun my-vc-git-reset (&optional revision vc-fileset comment)
  (interactive "P")
  (my-vc-git-command "Unstaged"
    (lambda (files) (vc-git-command nil 0 files "reset" "-q" "--"))))

(define-key vc-prefix-map [(r)] 'vc-revert)
(define-key vc-dir-mode-map [(r)] 'vc-revert)
(define-key vc-prefix-map [(a)] 'my-vc-git-add)
(define-key vc-dir-mode-map [(a)] 'my-vc-git-add)
(define-key vc-prefix-map [(u)] 'my-vc-git-reset)
(define-key vc-dir-mode-map [(u)] 'my-vc-git-reset)
;; (define-key vc-prefix-map [(L)] 'vc-print-log)
(define-key vc-dir-mode-map [(L)] 'vc-git-log-basic-infixes)
;; (define-key vc-dir-mode-map [(L)] (lambda () (interactive)(if current-prefix-arg (vc-git-log-basic-infixes) (vc-print-log))))
(define-key vc-dir-mode-map [(\,)] 'vc-dir-unmark)
(define-key vc-dir-mode-map [(F)] 'vc-pull)
(define-key vc-prefix-map [(F)] 'vc-pull)

;; hide up to date files after refreshing in vc-dir
(define-key vc-dir-mode-map [(g)]
  (lambda () (interactive) (vc-dir-refresh) (vc-dir-hide-up-to-date)))


(defun my/gco()
  (interactive)
  (condition-case err
      (let* (
	     (val   (buffer-substring (point-at-bol) (point-at-eol)))
	     (dir (caddr (project-current)))
	     (cur-buff (buffer-name (current-buffer)))
	     ;; Capture groups, shy group doesn't hamper ordering  
	     (out (if (or
		       (string= cur-buff "*vc-change-log*")
		       (string= cur-buff "*VC-history*"))
		      (read-from-minibuffer "Enter commit (will be detached): " (log-view-current-tag))
		    ;; (progn (string-match "\\(?:tag: \\)?\\(\\b[[:alnum:]]+\\b\\)" val)
		    ;; 	     ;; get value in second group
		    ;; 	     (match-string 1 val))
		    ))
	     (branch (if (not out)
			 (vc-read-revision "Enter new branch name (default detached): "
					     (list dir)
					     (vc-responsible-backend dir)))))
	 ;;  (vc-retrieve-tag dir
	 ;; 		   (vc-read-revision "Tag name to retrieve (default latest revisions): "
	 ;; 				     (list dir)
	 ;; 				     (vc-responsible-backend dir))))
	;; if user does not edit branch, create detached HEAD
	(cond
	 (out (vc-git-retrieve-tag dir out t))
	 ;; (branch (if (string= (completing-read "Create branch" '("y" "n")) "n")
	 ;; 	     (vc-git-retrieve-tag dir out t)))
	 ;; (t (vc-git-command nil 0 nil "checkout" "-b" branch out))
	 )
	 
	 ;; create branch
	 
	(vc-resynch-buffer dir))
    (error nil (error-message-string err))))
(add-hook 'vc-git-log-view-mode-hook (lambda () (define-key vc-git-log-view-mode-map [(c)] 'my/gco))
	  )

;; (defun my/gl (&optional revision vc-fileset comment)
;;   "prints project log"
;;   (interactive "P")
;;   (cond
;;    (current-prefix-arg (vc-print-log))
;;    (t   (vc-print-log-internal (car (vc-deduce-fileset t)) (list (cdr (project-current))) nil nil nil))

;;    )
;;   )
;; (define-key vc-prefix-map [(l)] 'my/gl)
;; (define-key vc-dir-mode-map [(l)] 'my/gl)
(define-key vc-dir-mode-map [(A)] 'vc-annotate)
(define-key vc-dir-mode-map [(V)] 'vc-version-diff)
(define-key vc-prefix-map [(V)] 'vc-version-diff)


;; my edit in vc
;; to display filename in vc log diff "="
(defun diff-bounds-of-hunk ()
  "Return the bounds of the diff hunk at point.
The return value is a list (BEG END), which are the hunk's start
and end positions.  Signal an error if no hunk is found.  If
point is in a file header, return the bounds of the next hunk."
  (save-excursion
    (let* ((pos (point))
	  (beg1 (diff-beginning-of-hunk t))
	  (beg (line-beginning-position -4))
	  (end (diff-end-of-hunk)))
      (cond ((>= end pos)
	     (list beg end))
	    ;; If this hunk ends above POS, consider the next hunk.
	    ((re-search-forward diff-hunk-header-re nil t)
	     (list (match-beginning 0) (diff-end-of-hunk)))
	    (t (error "No hunk found"))))))
;; add file changes in vc log
(defun vc-git-expanded-log-entry (revision)
  (with-temp-buffer
    (apply #'vc-git-command t nil nil (list "log" revision "-1" "--compact-summary" "--graph" "--no-color" "--"))
    (goto-char (point-min))
    (unless (eobp)
      ;; Indent the expanded log entry.
      (while (re-search-forward "^  " nil t)
        (replace-match "")
        (forward-line))
      (buffer-string))))
;;(define-key vc-git-log-view-mode-map (kbd "s") 'vc-log-search)
;; (global-set-key (kbd "C-x g") 'my-vc-dir)

;;; vc git log buffer
(require 'transient)
(transient-define-argument git-log-filter--exclusive-switches ()
  "This is a specialized infix for only selecting one of several values."
  :class 'transient-switches
  :argument-format "--diff-filter=%s"
  :argument-regexp "\\(--\\(grape\\|orange\\|cherry\\|lime\\)-snowcone\\)"
  :choices '("A" "C" "D" "M" "R" "T" "U" "X" "B"))

(setq vc-git-log--args nil)
(setq vc-git-log--files nil)
(transient-define-prefix vc-git-log-basic-infixes ()
  "Preferably used in vc log with C-u to filter as per users need"
  :value '("log" "--no-color" "--graph" "--decorate" "--date=short" "--pretty=tformat:%d%h..: %an %ad %s" "--abbrev-commit")
  :incompatible '(("--merges" "--no-merges"))
  ["Infixes"
   ("d" "--diff-filter=" git-log-filter--exclusive-switches)
   ("m" "filter by message" "--grep=" :prompt "Commit message includes: ")
   ("c" "filter by content" "-S" :prompt "Content in commit includes: ")
   ("a" "author" "--author="
    (lambda (a b c) (completing-read
		"Complete a username: "
		(split-string (shell-command-to-string "git shortlog -s HEAD|cut -f 2"))
		nil t)))
   ("n" "limit" "-n " :prompt "an integer: " :reader transient-read-number-N+ :class transient-option)
   ]
  ["Default"
   ("-f" "follow" "--follow")
   ("-c" "no colour" "--no-color")
   ("-g" "graph" "--graph")
   ("-e" "decorate" "--decorate")
   ("-d" "date" "--date=short")
   ("-l" "log format" "--pretty=tformat:%d%h..: %an %ad %s")
   ("-a" "abbrev commit" "--abbrev-commit")
   ("-m" "merges" "--merges")
   ("-nm" "no merges" "--no-merges")
   ]

  ["Branch"
   ("b" "branch or commit" " "
    ;; below commented line includes tags as well 
    ;; (lambda (a b c) (vc-read-revision "commit or branch name: " (caddr (project-current)) (cadr (project-current)))))
    (lambda (a b c) (completing-read
		"Enter branch: "
		(split-string (string-replace "*" " " (shell-command-to-string "git branch")))
		nil t)))
   ;; ("p" "file or dir" "-- " :choices (lambda (a b c) (project-files (project-current t))) :class transient-option)
   ("p" "file or dir" (lambda () (interactive)
			;; used in modified `vc-git-print-log' function
		        (setq vc-git-log--files
			      ;; (completing-read-multiple "abcd: " (lambda (a b c) (project-files (project-current t))))
			      (list (funcall project-read-file-name-function "Select file" (project-files (project-current t)) nil 'file-name-history))
			      )
			      ;; (project--read-file-cpd-relative "Find file" (project-files (project-current t)))
		        ;; (setq vc-git-log--files
			      ;; (list (funcall project-read-file-name-function "Find file" (project-files (project-current t)) nil 'file-name-history))
			      ;; (if (vc-dir-current-file)
			      ;; 	  (vc-dir-current-file)
			      ;; 	(list (funcall project-read-file-name-function "Find file" (project-files (project-current t)) nil 'file-name-history)))
			      ;; )
			;; (message "%s" vc-git-log--files)
			)
    :transient t)
   ]
  ["Actions"
   ("l" "log"
    (lambda () (interactive)
      ;; used in modified `vc-git-print-log' function
      (setq vc-git-log--args (append '("log") (transient-args (oref transient-current-prefix command))))
      (if vc-git-log--files vc-git-log--files (vc-dir-current-file))
      ;; (message "abcd:%s" vc-git-log--args)
      (vc-print-log)
      (setq vc-git-log--args nil)
      (setq vc-git-log--files nil)
      ))
   ("q" "quit" (lambda ()(interactive) (transient-quit-one)))
   ("i" "print" (lambda ()(interactive) (message "%s \n%s" (append '("log") (transient-args (oref transient-current-prefix command))) vc-git-log--files)) :transient t)
   ])

(transient-define-argument vc-git-log-commit--exclusive-switches ()
  "This is a specialized infix for only selecting one of several values."
  :class 'transient-switches
  :argument-format "%s"
  :argument-regexp "\\(--\\(grape\\|orange\\|cherry\\|lime\\)-snowcone\\)"
  :choices (lambda (a b c)(interactive) (vc-read-revision "commit or branch name: " (caddr (project-current)) (cadr (project-current)))))

(defun vc-git-print-log (files buffer &optional shortlog start-revision limit)
  "Print commit log associated with FILES into specified BUFFER.
If SHORTLOG is non-nil, use a short format based on `vc-git-root-log-format'.
\(This requires at least Git version 1.5.6, for the --graph option.)
If START-REVISION is non-nil, it is the newest revision to show.
If LIMIT is a number, show no more than this many entries.
If LIMIT is a revision string, use it as an end-revision."
  (let ((coding-system-for-read
         (or coding-system-for-read vc-git-log-output-coding-system)))
    ;; `vc-do-command' creates the buffer, but we need it before running
    ;; the command.
    (vc-setup-buffer buffer)
    ;; If the buffer exists from a previous invocation it might be
    ;; read-only.
    (let ((inhibit-read-only t)
	  (vc-git-log--args nil)
	  ;; (vc-git-log--files nil)
	  )
      (with-current-buffer buffer
	(apply #'vc-git-command buffer
	       ;; 'async (if (boundp 'vc-git-log--files) vc-git-log--files files)
	       'async (if vc-git-log--files vc-git-log--files files)
	       (if vc-git-log--args
		   vc-git-log--args
		 (append
		  '("log" "--no-color")
                  (when (and vc-git-print-log-follow
                             (null (cdr files))
                             (car files)
                             (not (file-directory-p (car files))))
                    ;; "--follow" on directories or multiple files is broken
                    ;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=8756
                    ;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=16422
                    (list "--follow"))
		  (when shortlog
		    `("--graph" "--decorate" "--date=short"
                      ,(format "--pretty=tformat:%s"
                               (car vc-git-root-log-format))
                      "--abbrev-commit"))
                  (ensure-list vc-git-log-switches)
                  (when (numberp limit)
                    (list "-n" (format "%s" limit)))
		  (when start-revision
                    (if (and limit (not (numberp limit)))
			(list (concat start-revision ".." (if (equal limit "")
                                                              "HEAD"
                                                            limit)))
                      (list start-revision)))
                  (when (eq vc-log-view-type 'with-diff)
                    (list "-p"))
		  '("--"))))))))
;;By default, in vc-dir, B-c creates tag and with prefix create branch. Reverse it:
;;===== edited out for later
;; (defun vc-create-tag (dir name branchp)
;;   "Descending recursively from DIR, make a tag called NAME.
;; For each registered file, the working revision becomes part of
;; the named configuration.  If the prefix argument BRANCHP is
;; given, the tag is made as a new branch and the files are
;; checked out in that new branch."
;;   (interactive
;;    (let ((granularity
;; 	  (vc-call-backend (vc-responsible-backend default-directory)
;; 			   'revision-granularity)))
;;      (list
;;       (if (eq granularity 'repository)
;; 	  ;; For VC's that do not work at file level, it's pointless
;; 	  ;; to ask for a directory, branches are created at repository level.
;; 	  default-directory
;; 	(read-directory-name "Directory: " default-directory default-directory t))
;;       (read-string (if current-prefix-arg "New tag name: " "New branch name: ")
;;                    nil 'vc-revision-history)
;;       (not current-prefix-arg))))
;;   (message "Making %s... " (if branchp "branch" "tag"))
;;   (when (file-directory-p dir) (setq dir (file-name-as-directory dir)))
;;   (vc-call-backend (vc-responsible-backend dir)
;; 		   'create-tag dir name branchp)
;;   (vc-resynch-buffer dir t t t)
;;   (message "Making %s... done" (if branchp "branch" "tag")))

;; git eshell completion
;; https://github.com/szermatt/emacs-bash-completion/issues/24#issuecomment-421969539
;; (use-package esh-mode
;;   :config
;;   (progn
;;     (defun my/esh-mode-completion-at-point ()
;;       "Same as `completion-at-point' except for some commands."
;;       (interactive)
;;       ;; unbinding pcomplete/make gives a chance to `bash-completion'
;;       ;; to complete make rules. Bash-completion is indeed more
;;       ;; powerfull than `pcomplete-make'.
;;       (cl-letf (((symbol-function 'pcomplete/make) nil))
;;         (completion-at-point)))

;;     ;; We can't use use-package's :bind here as eshell insists on
;;     ;; recreating a fresh eshell-mode-map for each new eshell buffer.
;;     (defun my/configure-esh-mode ()
;;       (bind-key "C-i" #'my/esh-mode-completion-at-point eshell-mode-map))))

;; (use-package em-cmpl
;;   :hook (eshell-mode . eshell-cmpl-initialize)
;;   :init
;;   (progn
;;     (defun my/eshell-bash-completion ()
;;       (let ((bash-completion-nospace t))
;;         (while (pcomplete-here
;;                 (nth 2 (bash-completion-dynamic-complete-nocomint
;;                         (save-excursion (eshell-bol) (point))
;;                         (point)))))))

;;     (when (require 'bash-completion nil t)
;;       (setq eshell-default-completion-function #'my/eshell-bash-completion))))
;; https://www.emacswiki.org/emacs/EshellCompletion

;;; testing
;; (defun vc-git-log-filter ()
;;   "customize git log filter in vc"
;;   ;; completion-extra-properties :annotation-function
;;   ;; (setq trees '((username . (lambda () (completing-read
;;   ;; 				   "Complete a username: "
;;   ;; 				   (split-string (shell-command-to-string "git shortlog -s HEAD|cut -f 2"))
;;   ;; 				   nil t)))
;;   ;; 		(oak . acorns) (maple . seeds)))

;;   (let*
;;       ((trees '((username . (lambda () (completing-read
;; 				   "Complete a username: "
;; 				   (split-string (shell-command-to-string "git shortlog -s HEAD|cut -f 2"))
;; 				   nil t)))
;; 		(oak . acorns) (maple . seeds)))
;;        (val (completing-read
;;              "Complete a tree: "
;;              trees
;;              nil t))
;;        (ans (funcall (cdr (assoc (intern val) trees))))
;;        )
;;     (message "you selected %s and answer is %s" val ans)
;;     )
;;   )
