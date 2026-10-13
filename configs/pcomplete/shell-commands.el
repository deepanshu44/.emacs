;; -*- lexical-binding: t; -*-
;;; custom pcomplete to provide annotation
(defun pcomplete-completions-at-point ()
  "Provide standard completion using pcomplete's completion tables.
Same as `pcomplete' but using the standard completion UI."
  ;; FIXME: it only completes the text before point, whereas the
  ;; standard UI may also consider text after point.
  ;; FIXME: the `pcomplete' UI may be used internally during
  ;; pcomplete-completions and then throw to `pcompleted', thus
  ;; imposing the pcomplete UI over the standard UI.
  (catch 'pcompleted
    (let* ((pcomplete-stub)
           pcomplete-seen pcomplete-norm-func
           pcomplete-args pcomplete-last pcomplete-index
           (pcomplete-autolist pcomplete-autolist)
           (pcomplete-suffix-list pcomplete-suffix-list)
           ;; Apparently the vars above are global vars modified by
           ;; side-effects, whereas pcomplete-completions is the core
           ;; function that finds the chunk of text to complete
           ;; (returned indirectly in pcomplete-stub) and the set of
           ;; possible completions.
           (completions (pcomplete-completions))
           ;; Usually there's some close connection between pcomplete-stub
           ;; and the text before point.  But depending on what
           ;; pcomplete-parse-arguments-function does, that connection
           ;; might not be that close.  E.g. in eshell,
           ;; pcomplete-parse-arguments-function expands envvars.
           ;;
           ;; Since we use minibuffer-complete, which doesn't know
           ;; pcomplete-stub and works from the buffer's text instead,
           ;; we need to trick minibuffer-complete, into using
           ;; pcomplete-stub without its knowledge.  To that end, we
           ;; use completion-table-subvert to construct a completion
           ;; table which expects strings using a prefix from the
           ;; buffer's text but internally uses the corresponding
           ;; prefix from pcomplete-stub.
           ;;
           (argbeg (pcomplete-begin))
           ;; When completing an envvar within an argument in Eshell
           ;; (e.g. "cd /home/$US TAB"), `pcomplete-stub' will just be
           ;; "US" whereas `argbeg' will point to the first "/".
           ;; We could rely on c-t-subvert to handle the difference,
           ;; but we try here to guess the "real" beginning so as to
           ;; rely less on c-t-subvert.
           (beg (max (- (point) (length pcomplete-stub))
                     argbeg))
           buftext)
      (setq pcomplete-shell-index-variable pcomplete-index)
      ;; Try and improve our guess of `beg' in case the difference
      ;; between pcomplete-stub and the buffer's text is simply due to
      ;; some chars removed by unquoting.  Again, this is not
      ;; indispensable but reduces the reliance on c-t-subvert and
      ;; improves corner case behaviors.
      (while (progn (setq buftext (pcomplete-unquote-argument
                                   (buffer-substring beg (point))))
                    (and (> beg argbeg)
                         (> (length pcomplete-stub) (length buftext))))
        (setq beg (max argbeg (- beg (- (length pcomplete-stub)
                                        (length buftext))))))
      (when completions
        (let ((table
               (completion-table-with-quoting
                (if (equal pcomplete-stub buftext)
                    completions
                  ;; This may not always be strictly right, but given the lack
                  ;; of any other info, it's about as good as it gets, and in
                  ;; practice it should work just fine (fingers crossed).
                  (let ((suf-len (pcomplete--common-suffix
                                  pcomplete-stub buftext)))
                    (completion-table-subvert
                     completions
                     (substring buftext 0 (- (length buftext) suf-len))
                     (substring pcomplete-stub 0
                                (- (length pcomplete-stub) suf-len)))))
                pcomplete-unquote-argument-function
                pcomplete-requote-argument-function))
              (pred
               ;; Pare it down, if applicable.
               (when (and pcomplete-use-paring pcomplete-seen)
                 ;; Capture the dynbound values for later use.
                 (let ((norm-func pcomplete-norm-func)
                       (seen
			(mapcar (lambda (f)
				  (funcall pcomplete-norm-func
					   (directory-file-name f)))
				pcomplete-seen)))
                   (lambda (f)
                     (not (member
                           (funcall norm-func (directory-file-name f))
                           seen)))))))
          (when completion-ignore-case
            (setq table (completion-table-case-fold table)))
          (list beg (point) table
                :predicate pred
                :exit-function
		;; If completion is finished, add a terminating space.
		;; We used to also do this if STATUS is `sole', but
		;; that does not work right when completion cycling.
                (unless (zerop (length pcomplete-termination-string))
                  (lambda (_s status)
                    (when (eq status 'finished)
                      (if (looking-at
                           (regexp-quote pcomplete-termination-string))
                          (goto-char (match-end 0))
                        (insert pcomplete-termination-string)))))
		:annotation-function (plist-get pcomplete--completion-extra-properties :annotation-function)
		:company-docsig (lambda (x)
				  (if (and (string= "shell-mode" (symbol-name major-mode))
					   (= pcomplete-shell-index-variable 0))
				      (string-trim
				       (shell-command-to-string
					;; (string-join (list "whatis" x "|grep" x "|cut -d'-' -f 2" ) " ")
					;; (string-join (list "whatis" x "|grep" "\"\\- .*\"" ) " ")
					(concat "whatis " x)
					))
				    ))
		))))))

(setq pcomplete--completion-extra-properties nil)
;; https://github.com/thierryvolpiatto/pcomplete-extension/blob/master/pcomplete-extension.el
;;; git
;;;; vars
(setq gitcmdmap '(("gitlog" . "gl") ("gitcheckout" . "gco") ("gitdiff" . "gd") ("gitmerge" . "gm") ("gitrebase" . "grb") ("gitcommit" . "gc")))

;;;; git
(defun pcomplete/git ()
  (pcomplete-here '("clone" "init" "add" "mv" "restore" "rm" "sparse-ch" "bisect" "diff" "grep" "log" "show" "status" "branch" "commit" "merge" "rebase" "reflog" "remote" "reset" "revert" "switch" "tag" "last" "fetch" "pull" "push" "checkout" "whatsnew"))
  ;; (funcall (pcomplete-find-completion-function (cdr (assoc (concat (pcomplete-arg 2) (pcomplete-arg 1)) gitcmdmap)))) 
  (if (assoc (concat (pcomplete-arg 2) (pcomplete-arg 1)) gitcmdmap)
      (funcall (pcomplete-find-completion-function (cdr (assoc (concat (pcomplete-arg 2) (pcomplete-arg 1)) gitcmdmap))))) 
  )

;;;; git commit
(defun pcomplete/gc ()
  (setq pcomplete--cmd-gc-data '(("-a" "commit modified and deleted") ("-p" "patch, pick changes to commit") ("-C" "Take details from commit object") ("-c" "Like -C, but with editor to edit") ("--fixup" "") ("--squash" "") ("--reset-author" "") ("--short" " When dry-run, give short output") ("--branch" " show branch and tracking info") ("--porcelain" " When doing a dry-run, give porcelain-ready") ("--long" " When dry-run, give long output") ("-z" "") ("-F" "Take commit message from file (- for standard input)") ("--author" "Override the commit author.") ("--date" "Override author date") ("-m" "provide the commit message (-m*x concatenated)") ("-t" "commit editor with contents from file") ("-s" "") ("--signoff" "") ("--cleanup" "=") ("-e" "") ("--edit" "") ("--no-edit" "") ("--amend" "see 'RECOVERING FROM UPSTREAM REBASE'") ("-i" "") ("--include" "") ("-o" "") ("--only" "") ("-u" "Show untracked files (no,normal,all).") ("--untracked-files" "") ("-v" "verbose") ("--verbose" "") ("-q" "quiet (Suppress commit summary message)") ("--quiet" "") ("--dry-run" "") ("--status" "") ("--no-status" "Don't include output of git-status in editor") ("-S" " GPG-sign commits") ("--gpg-sign" "GPG-sign commits") ("--no-gpg-sign" "") ("--" "Do not interpret any more arguments as options") ("-s" "")))
  (setq pcomplete--completion-extra-properties '(:annotation-function (lambda (x) 
									(let ((data (cadr (assoc x pcomplete--cmd-gc-data)))) (if data (concat "      " data))))))
  (while
      (cond ((pcomplete-match "^-" 0) (pcomplete-here pcomplete--cmd-gc-data))
	    ;; (t (pcomplete-here* (split-string (shell-command-to-string "git branch"))))
	    ;; (t (pcomplete-here* (split-string (shell-command-to-string "git branch;git branch -r"))))
	    )
    )
  )
;;;; git log
(setq pcomplete--cmd-gl-data '(("A" "Added") ("C" "Copied") ("D" "Deleted") ("M" "Modified") ("R" "Renamed") ("U" "Unmerged") ("X" "Unknown") ("B" "Broken")))
(defun pcomplete/gl ()
  ;; (setq pcomplete-termination-string nil)
  (setq pcomplete--completion-extra-properties
	'(:annotation-function (lambda (x) 
				 (concat "      " (cadr (assoc x pcomplete--cmd-gl-data))))))
  (let ((cm (split-string (shell-command-to-string "git branch;git branch -r;echo -e 'HEAD\n...origin\norigin...\n..origin\norigin..'")))
	;; unfortunately below line would be calculated multiple times. And putting this line here throws error
	;; (base (substring
	;;        (car (last pcomplete-args))
	;;        0 (1+ (cl-search "." (car (last pcomplete-args)) :from-end t))))
	)
    (while 
	(cond
	 ((pcomplete-match "^-\\([^= \t\n\f]*\\)\\'" 0) (pcomplete-here* '("--numstat" "--shortstat" "--author=" "--" "--since=" "--after=" "--until=" "--before=" "--diff-filter=" "--no-merges" "--compact-summary" "--branches" "--graph" "--oneline")))
	 ((pcomplete-match "\\`--author=\\(.*\\)" 0)
	  (pcomplete-here
	   (split-string (shell-command-to-string "git shortlog -s HEAD|cut -f 2"))
	   (pcomplete-match-string 1 0)))
	 ((pcomplete-match "\\`--diff-filter=\\(.*\\)" 0)
	  (pcomplete-here*
	   ;; '("A" "C" "D" "M" "R" "T" "U" "X" "B")
	   pcomplete--cmd-gl-data
	   (pcomplete-match-string 1 0)))
	 ((pcomplete-match "--" 1) (pcomplete-here* (pcomplete-entries)))
	 ((pcomplete-match "^[[:alnum:]-^]*\\.\\{2,3\\}" 0)
	  ;; 1) All completion values need to be prefixed with
	  ;; `pcomplete-args' otherwise it will not be shown eg
	  ;; HEAD..| <== cursor if origin is completion value, than
	  ;; make it HEAD..origin
	  ;; 2) `pcomplete-here' does accept
	  ;; function as argument but unfortunately, pcomplete
	  ;; variables are not in scope, dont know why
	  (pcomplete-here* (mapcar
			    ;; this complicated substring function
			    ;; need to be added to counter HEAD..ori
			    ;; ==> HEAD..oriori repeated till infinity
			    (lambda (x) (concat (substring
					    (car (last pcomplete-args))
					    0 (1+ (cl-search "." (car (last pcomplete-args)) :from-end t))) x))
			    (split-string
			     (shell-command-to-string "git branch;git branch -r"))))
	  )
	 (t (pcomplete-here* cm nil #'identity)))))
  )
;; (defalias pcomplete/g)
;;;; git branch
(defun pcomplete/gb ()
  (setq pcomplete--cmd-gb-data
	'(("-a" "all") ("-q" "quiet") ("-t" "track") ("-u" "set upstream to") ("--unset-upstream" "") ("--no-track" "no upstream/tracking") ("-r" "remotes") ("-d" "delete") ("-D" "force delete") ("-m" "move/rename") ("-M" "force move/rename")  ("-f" "force") ("--list" "") ("-c" "copy") ("--track" "set upstream") ("--set-upstream-to" "set upstream to") ("--delete" "") ("--force" "") ("--contains" "") ("--no-contains" "") ("--merged" "") ("--no-merged" "") ("--format" "") ("--points-at" "Only list branches of the given object") ("--sort" "")))
  (setq pcomplete--completion-extra-properties
	'(:annotation-function (lambda (x) 
				 (let ((data (cadr (assoc x pcomplete--cmd-gb-data)))) (if data (concat "      " data))))))
  (while
      (cond ((pcomplete-match "^-" 0) (pcomplete-here pcomplete--cmd-gb-data))
	    (t (pcomplete-here* (split-string (shell-command-to-string "git branch"))))
	    ;; (t (pcomplete-here* (split-string (shell-command-to-string "git branch;git branch -r"))))
	    )
    )
  )
;;;; git checkout
(defun pcomplete/gco ()
  (setq pcomplete--cmd-gco-data '(("-q" "quiet") ("-f" "force") ("-m" "merge") ("--detach" "") ("-b" "new branch") ("-t" "track") ("--no-track" "") ("-B" "force git branch") ("--track" "set upstream") ("--orphan" "one root unrelated branch") ("--ours" "") ("--theirs" "") ("--conflict=" "") ("--pathspec-from-file=" "") ("-p" "patch") ("--patch" "") ("--" "")))
  (setq pcomplete--completion-extra-properties
	'(:annotation-function (lambda (x) 
				 (concat "      " (cadr (assoc x pcomplete--cmd-gco-data))))))
  (let ((pcomplete-termination-string nil))
    (while (cond
	    ((pcomplete-match "^-" 0) (pcomplete-here* pcomplete--cmd-gco-data))
	    ((pcomplete-match "--" 1) (pcomplete-here (pcomplete-entries)))
	    ((pcomplete-match "-r" 1) (pcomplete-here (split-string (shell-command-to-string "git branch;git branch -r")) ))
	    (t (pcomplete-here (split-string (shell-command-to-string "git branch")) ))
	    ))
    )
  )

;;;; git diff
(defun pcomplete/gd ()
  ;; (setq pcomplete-termination-string nil)
  (setq pcomplete--completion-extra-properties
	'(:annotation-function (lambda (x) 
				 (concat "      " (cadr (assoc x pcomplete--cmd-gl-data))))))
  (let ((cm (split-string (shell-command-to-string "git branch;git branch -r;echo -e 'HEAD\n...origin\norigin...\n..origin\norigin..'"))))
    (while 
	(cond
	 ((pcomplete-match "^-\\([^= \t\n\f]*\\)\\'" 0) (pcomplete-here* '( "--" "--cached" "--no-commit" "--stat"
									    "--staged" "--compact-summary" "--shortstat" "--numstat" "--diff-filter=")))
	 ((pcomplete-match "--$" 1) (pcomplete-here* (pcomplete-entries)))
	 ((pcomplete-match "^[[:alnum:]-^]*\\.\\{2,3\\}" 0)
	  ;; commented in gl
	  (pcomplete-here* (mapcar
			    ;; this complicated substring function
			    ;; need to be added to counter HEAD..ori
			    ;; ==> HEAD..oriori repeated till infinity
			    (lambda (x) (concat (substring
					    (car (last pcomplete-args))
					    0 (1+ (cl-search "." (car (last pcomplete-args)) :from-end t))) x))
			    (split-string
			     (shell-command-to-string "git branch;git branch -r"))))
	  )
	 ((pcomplete-match "\\`--diff-filter=\\(.*\\)" 0)
	  (pcomplete-here
	   ;; '("A" "C" "D" "M" "R" "T" "U" "X" "B")
	   pcomplete--cmd-gl-data
	   (pcomplete-match-string 1 0)))
	 (t (pcomplete-here cm nil #'identity)))))
  )
(defalias 'pcomplete/gds 'pcomplete/gd)

;;;; git merge
(defun pcomplete/gm ()
  (let ((pcomplete-termination-string nil))
    (while (cond
	    ((pcomplete-match "^-" 0) (pcomplete-here* '("-n" "--stat" "--no-commit" "--squash" "--no-edit"  
							 "--no-verify" "-s"  "-X" "-S"
							 "--no-allow-unrelated-stories"
							 "--no-rerere-autoupdate" "-m"  "-F" 
							 "--continue" "--abort" "--quit" "--ff" "--no-ff" "--ff-only"
							 "--signoff" "--no-signoff" "--no-squash" "--abort" "--abort" "--quit"
							 "--continue"
							 )))
	    	    (t (pcomplete-here (split-string (shell-command-to-string "git branch;git branch -r")) ))))
    )
  )

;;;; git rebase
(defun pcomplete/grb ()
  (let ((pcomplete-termination-string nil))
    (while (cond
	    ((pcomplete-match "^-" 0) (pcomplete-here* '("-i"  "--interactive" "--exec"
							 "--onto" "--keep-base" "-i"  "--interactive"
							 "--exec"  "--onto" "--root" "--continue" "--skip" "--abort"
							 "--quit" "--edit-todo" "--show-current-patch"
							 )))
	    	    (t (pcomplete-here (split-string (shell-command-to-string "git branch;git branch -r")) ))))
    )
  )

;;; commands
;;;; sudo completion
;; sudo/xargs in /usr/local/share/emacs/28.2/lisp/pcmpl-unix.el.gz

;;;; systemctl completion
(defcustom pcomplete-systemctl-commands
  '("disable" "enable" "status" "start" "restart" "stop" "reenable"
    "list-units" "list-unit-files")
  "p-completion candidates for `systemctl' main commands"
  :type '(repeat (string :tag "systemctl command"))
  :group 'pcomplete)

(defvar pcomplete-systemd-units
  (split-string
   (shell-command-to-string
    "(systemctl list-units --all --full --no-legend;systemctl list-unit-files --full --no-legend)|while read -r a b; do echo \" $a\";done;"))
  "p-completion candidates for all `systemd' units")

(defvar pcomplete-systemd-user-units
  (split-string
   (shell-command-to-string
    "(systemctl list-units --user --all --full --no-legend;systemctl list-unit-files --user --full --no-legend)|while read -r a b;do echo \" $a\";done;"))
  "p-completion candidates for all `systemd' user units")

(defun pcomplete/systemctl ()
  "Completion rules for the `systemctl' command."
  (pcomplete-here (append pcomplete-systemctl-commands '("--user")))
  (cond ((pcomplete-test "--user")
         (pcomplete-here pcomplete-systemctl-commands)
         (pcomplete-here pcomplete-systemd-user-units))
        (t (pcomplete-here pcomplete-systemd-units))))

;;;; service command

;;;; man
;; https://www.emacswiki.org/emacs/EshellCompletion
;;;; man completion
(defvar pcomplete-man-user-commands
  (split-string
   (shell-command-to-string
    "apropos -s 1 .|while read -r a b; do echo \" $a\";done;"))
  "p-completion candidates for `man' command")

(defun pcomplete/man ()
  "Completion rules for the `man' command."
  (pcomplete-here pcomplete-man-user-commands))

;;;; node

(defun pcomplete/node ()
  (let ()
    (while (cond
	    ((pcomplete-match "^-" 0) (pcomplete-here* '("--watch" "-v" "-e")))
	    ;; (t (pcomplete-here (directory-files "" nil "\\.js\\'")))
	    ;; (t (pcomplete-here (pcomplete-entries nil (lambda (x) (or (f-directory-p x) (directory-files "" nil "\\.js\\'")))
	    ;; (t (pcomplete-here (pcomplete-entries ".*\\(\\.js$\\|/$\\)" )))
	    (t (pcomplete-here (pcomplete-entries ".*\\(\\.js$\\|\\.ts$\\|/$\\)" )))
	    ))
    )
  )
;;;;; npm
(defun pcomplete/npm ()
  ;FIXME: below is very slow
  ;; (setq pcomplete--cmd-npm-data (append (split-string (replace-regexp-in-string "\\( \\|\n\\)" "" (substring (shell-command-to-string "npm --help") 439 992)) ",") '("run")))
  (setq pcomplete--cmd-npm-data '("access" "adduser" "audit" "bugs" "cache" "ci" "completion" "config" "dedupe" "deprecate" "diff" "dist-tag" "docs" "doctor" "edit" "exec" "explain" "explore" "find-dupes" "fund" "get" "help" "help-search" "hook" "init" "install" "install-ci-test" "install-test" "link" "ll" "login" "logout" "ls" "org" "outdated" "owner" "pack" "ping" "pkg" "prefix" "profile" "prune" "publish" "query" "rebuild" "repo" "restart" "root" "run-script" "search" "set" "shrinkwrap" "star" "stars" "start" "stop" "team" "test" "token" "uninstall" "unpublish" "unstar" "update" "version" "view" "whoami" "run"))
     (while (cond
	    ((pcomplete-match "run") (pcomplete-here* (npm-mode--get-project-scripts)))
	    (t (pcomplete-here pcomplete--cmd-npm-data))
	    ))
  )
;;;; ps
(defun pcomplete/ps ()
  (setq pcomplete--cmd-ps-data '(("-C" "command name")
				 ("-G" "real group id or name")
				 ("-e" "all processes")
				 ("r" "only running processes")
				 ("T" "all processes on this terminal")
				 ("-g" "session or effective group name")
				 ("-p" "process id")
				 ("--ppid" "parent process id")
				 ("-q" "--quick-pid <PID>")
				 ("-s" "session id")
				 ("-t" "terminal")
				 ("-u" "effective user id or name")
				 ("-U" "real user id or name")
				 ))
  (setq pcomplete--completion-extra-properties
	'(:annotation-function (lambda (x) 
				 (concat "      " (cadr (assoc x pcomplete--cmd-ps-data))))))
  (let ((pcomplete-termination-string nil))
    (while (cond
	    ((pcomplete-match "-o") (pcomplete-here* '("%mem" "pid=" "comm=" "comm")))
	    ((pcomplete-match "\\(-u\\|-U\\)") (pcomplete-here* (list (eshell/whoami) "root")))
	    ((pcomplete-match "-C") (pcomplete-here* (split-string (shell-command-to-string (format "ps -U %s | grep -Eo \"[^[:space:]]+$\"" (user-login-name))))))
	    (t (pcomplete-here* pcomplete--cmd-ps-data))
	    ))
    )
  )
	    ;; ((pcomplete-match "^-" 0) (pcomplete-here* pcomplete--cmd-ps-data))
	    ;; ((pcomplete-match "^-" 0) (pcomplete-here* (split-string (shell-command-to-string "ps -U ${whoami} | grep -Eo \"[^[:space:]]+$\""))))
	    ;; (t (pcomplete-here (split-string (shell-command-to-string "ps -e | grep -Eo \"[^[:space:]]+$\""))))
	    ;; (t (pcomplete-here (split-string (shell-command-to-string (format "ps -U %s | grep -Eo \"[^[:space:]]+$\"" (user-login-name))))))
    ;; (mapcar (lambda (x) (split-string (replace-regexp-in-string " \\(-\\w\\),?.*> +\\(.*\\)" "\\1|\\2" x) "|"))
  ;; 	(split-string (shell-command-to-string "ps --help l|grep -E '^\\s+-\\w'") "\n"))
;; (setq pcomplete--cmd-ps-data (split-string (shell-command-to-string "ps -U ${whoami} | grep -Eo \"[^[:space:]]+$\"")))

;;;; haskell stack
(defun pcomplete/stack ()
  (setq pcomplete--cmd-stack-data '(("init" "")("new" "")("install" "")("uninstall" "")("build" "")("clean" "")("purge" "")("ls" "")
				    ("--resolver" "")
				    ))
  (setq pcomplete--completion-extra-properties
	'(:annotation-function (lambda (x) 
				 (concat "      " (cadr (assoc x pcomplete--cmd-stack-data))))))
  (pcomplete-here* pcomplete--cmd-stack-data)
  (let ((pcomplete-termination-string nil))
    (while (cond
	    ((pcomplete-match "ls") (pcomplete-here* '("dependencies")))
	    ((pcomplete-match "clean") (pcomplete-here* '("--full")))
	    ((pcomplete-match "--resolver") (pcomplete-here* '("lts-" "ghc-")))
	    ;; ((pcomplete-match "\\(-u\\|-U\\)") (pcomplete-here* (list (eshell/whoami) "root")))
	    ;; ((pcomplete-match "-C") (pcomplete-here* (split-string (shell-command-to-string (format "ps -U %s | grep -Eo \"[^[:space:]]+$\"" (user-login-name))))))
	    (t (pcomplete-here* pcomplete--cmd-stack-data))
	    ))
    )
  )
;;; annotations
;; (defun pcomplete/test ()
;;    ;FIXME: had to use global instead of let since let bound not working 
;;   (setq pcomplete--cmd-test-data '(("abc" "123") ("iop" "456")))
;;   (cadr (assoc "abc" pcomplete--cmd-test-data))
;;   (setq completion-extra-properties
;; 	'(:annotation-function (lambda (x)
;; 				 (concat "   ==> "
;; 					 (cadr (assoc x pcomplete--cmd-test-data))))))
;;     (setq pcomplete-termination-string "")
;;     ;; (message "==%s" (plist-get completion-extra-properties :annotation-function))
;;     (pcomplete-here* '("abc" "iop")))

  ;;  (pcomplete-here (process-lines "git" "branch" "-a"))
  ;; (pcomplete-opt "ar")
;;   (cond
;;    ((and (pcomplete-match "^-" 'last)
;;                 (string= "gb" (pcomplete-arg 'last -1)))
;;            (pcomplete-here '("-a" "-r" "-d" "-D" "--list")))
;;    ((pcomplete-match "^-" 'last)
;; ;;      (while 
;; ;;      ((pcomplete-match "-a" 0) (pcomplete-here
;; ;; 			      (split-string (shell-command-to-string "git branch -a"))
;; ;; 			      (pcomplete-match-string 1 0)
;; ;; 			      ))
;; ;;      ((pcomplete-match "-r" 0) (pcomplete-here
;; ;; 			      (split-string (shell-command-to-string "git branch -r"))
;; ;; 			      (pcomplete-match-string 1 0)
;; ;; 			      ))
;; ;;      ((pcomplete-match "--list" 0) (pcomplete-here
;; ;; 			      ;; (split-string (shell-command-to-string "git branch -r"))
;; ;; 			      (split-string (shell-command-to-string "git branch -r|grep -oE '[[:alnum:] -]+'"))
;; ;; 			      (pcomplete-match-string 1 0)
;; ;; 			      ))
;; ;; )
;; ))
;; (defun pcomplete/gb ()
;;   ;;  (pcomplete-here (process-lines "git" "branch" "-a"))
;;   ;; (pcomplete-opt "ar")
;;   (cond
;;    ((and (pcomplete-match "^-" 'last)
;;                 (string= "gb" (pcomplete-arg 'last -1)))
;;            (pcomplete-opt "ar"))
;;  (t (pcomplete-here (split-string (shell-command-to-string "git branch -r"))))
;;  ;; (t (pcomplete-here (split-string (shell-command-to-string "git branch"))))
;;    ;; ((pcomplete-match "^-" 'last)
;;    ;;   (while 
;;    ;;   ((pcomplete-match "-a" 'last) (pcomplete-here
;;    ;; 			      (split-string (shell-command-to-string "git branch -a"))
;;    ;; 			      (pcomplete-match-string 1 0)
;;    ;; 			      ))
;;    ;;   ((pcomplete-match "-r" 0) (pcomplete-here
;;    ;; 			      (split-string (shell-command-to-string "git branch -r"))
;;    ;; 			      (pcomplete-match-string 1 0)
;;    ;; 			      ))
;;    ;;   ))
;;   )
;;  ;; (while (pcomplete-here (split-string (shell-command-to-string "git branch")) nil #'identity))
;; )


;; (defun pcomplete-completions-at-point ()
;;   "Provide standard completion using pcomplete's completion tables.
;; Same as `pcomplete' but using the standard completion UI."
;;   ;; FIXME: it only completes the text before point, whereas the
;;   ;; standard UI may also consider text after point.
;;   ;; FIXME: the `pcomplete' UI may be used internally during
;;   ;; pcomplete-completions and then throw to `pcompleted', thus
;;   ;; imposing the pcomplete UI over the standard UI.
;;   (catch 'pcompleted
;;     (let* ((pcomplete-stub)
;;            pcomplete-seen pcomplete-norm-func
;;            pcomplete-args pcomplete-last pcomplete-index
;;            (pcomplete-autolist pcomplete-autolist)
;;            (pcomplete-suffix-list pcomplete-suffix-list)
;;            ;; Apparently the vars above are global vars modified by
;;            ;; side-effects, whereas pcomplete-completions is the core
;;            ;; function that finds the chunk of text to complete
;;            ;; (returned indirectly in pcomplete-stub) and the set of
;;            ;; possible completions.
;;            (completions (pcomplete-completions))
;;            ;; Usually there's some close connection between pcomplete-stub
;;            ;; and the text before point.  But depending on what
;;            ;; pcomplete-parse-arguments-function does, that connection
;;            ;; might not be that close.  E.g. in eshell,
;;            ;; pcomplete-parse-arguments-function expands envvars.
;;            ;;
;;            ;; Since we use minibuffer-complete, which doesn't know
;;            ;; pcomplete-stub and works from the buffer's text instead,
;;            ;; we need to trick minibuffer-complete, into using
;;            ;; pcomplete-stub without its knowledge.  To that end, we
;;            ;; use completion-table-subvert to construct a completion
;;            ;; table which expects strings using a prefix from the
;;            ;; buffer's text but internally uses the corresponding
;;            ;; prefix from pcomplete-stub.
;;            ;;
;;            (argbeg (pcomplete-begin))
;;            ;; When completing an envvar within an argument in Eshell
;;            ;; (e.g. "cd /home/$US TAB"), `pcomplete-stub' will just be
;;            ;; "US" whereas `argbeg' will point to the first "/".
;;            ;; We could rely on c-t-subvert to handle the difference,
;;            ;; but we try here to guess the "real" beginning so as to
;;            ;; rely less on c-t-subvert.
;;            (beg (max (- (point) (length pcomplete-stub))
;;                      argbeg))
;;            buftext)
;;       ;; Try and improve our guess of `beg' in case the difference
;;       ;; between pcomplete-stub and the buffer's text is simply due to
;;       ;; some chars removed by unquoting.  Again, this is not
;;       ;; indispensable but reduces the reliance on c-t-subvert and
;;       ;; improves corner case behaviors.
;;       (while (progn (setq buftext (pcomplete-unquote-argument
;;                                    (buffer-substring beg (point))))
;;                     (and (> beg argbeg)
;;                          (> (length pcomplete-stub) (length buftext))))
;;         (setq beg (max argbeg (- beg (- (length pcomplete-stub)
;;                                         (length buftext))))))
;;       (when completions
;;         (let ((table
;;                (completion-table-with-quoting
;;                 (if (equal pcomplete-stub buftext)
;;                     completions
;;                   ;; This may not always be strictly right, but given the lack
;;                   ;; of any other info, it's about as good as it gets, and in
;;                   ;; practice it should work just fine (fingers crossed).
;;                   (let ((suf-len (pcomplete--common-suffix
;;                                   pcomplete-stub buftext)))
;;                     (completion-table-subvert
;;                      completions
;;                      (substring buftext 0 (- (length buftext) suf-len))
;;                      (substring pcomplete-stub 0
;;                                 (- (length pcomplete-stub) suf-len)))))
;;                 pcomplete-unquote-argument-function
;;                 pcomplete-requote-argument-function))
;;               (pred
;;                ;; Pare it down, if applicable.
;;                (when (and pcomplete-use-paring pcomplete-seen)
;;                  ;; Capture the dynbound values for later use.
;;                  (let ((norm-func pcomplete-norm-func)
;;                        (seen
;; 			(mapcar (lambda (f)
;; 				  (funcall pcomplete-norm-func
;; 					   (directory-file-name f)))
;; 				pcomplete-seen)))
;;                    (lambda (f)
;;                      (not (member
;;                            (funcall norm-func (directory-file-name f))
;;                            seen)))))))
;;           (when completion-ignore-case
;;             (setq table (completion-table-case-fold table)))
;;           (list beg (point) table
;;                 :predicate pred
;;                 :exit-function
;; 		;; If completion is finished, add a terminating space.
;; 		;; We used to also do this if STATUS is `sole', but
;; 		;; that does not work right when completion cycling.
;;                 (unless (zerop (length pcomplete-termination-string))
;;                   (lambda (_s status)
;;                     (when (eq status 'finished)
;;                       (if (looking-at
;;                            (regexp-quote pcomplete-termination-string))
;;                           (goto-char (match-end 0))
;;                         (insert pcomplete-termination-string)))))
;; 		:annotation-function (plist-get pcomplete--completion-extra-properties :annotation-function)
;; 		;; :company-docsig (lambda (x) (concat "==> " x " and " pcomplete-args))
;; 		))))))
