;; -*- lexical-binding: t -*-

;; thanks to twb for cl-loop and suggestion to go against macros and
;; use functions instead, rpav for solving lexical-binding problem :)
;; and corwin for advising not to set lexical-binding in .emacs

(setq cmd-list '(("n" flymake-goto-next-error)
		("p" flymake-goto-prev-error)
		("f" flymake-mode)
		("l" flymake-show-buffer-diagnostics)
		("P" flymake-show-project-diagnostics)
		("a" eglot-code-actions)
		("e f" eglot-format)
		("e e" eglot-code-action-extract)
		;; ("e r" eglot-code-action-rewrite)
		("e r" eglot-rename)
		("e i" eglot-code-action-inline)
		("e q" eglot-code-action-quickfix)
		("e o" eglot-code-action-organize-imports)))

(defun hook-macro (mode keys)
  (lambda ()
    (funcall
     'define-key
     (symbol-value (intern (concat mode "-mode-map")))
     (kbd (concat "C-c f " (car keys)))
     (cadr keys))
    ))
(cl-loop for mode in '("js2" "rjsx" "tsx-ts" "typescript-ts") 
         do (progn
	      (funcall #'add-hook (intern (concat mode "-mode-hook")) #'eglot-ensure) 
	      (cl-loop for keys in cmd-list
		       do (let* ((hk (intern (concat mode "-mode-hook")))
				 (fn (hook-macro mode keys)))
			    (funcall #'add-hook hk fn) 
			    ))))
