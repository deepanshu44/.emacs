;; https://gist.github.com/anachronic/7af88c62db136727cd1fed17ee0a662f

(defhydra js2-refactor-hydra (:color blue :hint nil)
  "
^Functions^                    ^Variables^               ^Buffer^                      ^sexp^               ^Debugging^
------------------------------------------------------------------------------------------------------------------------------
[_lp_] Localize Parameter      [_ev_] Extract variable   [_wi_] Wrap buffer in IIFE    [_k_]  js2 kill      [_lt_] log this
[_ef_] Extract function        [_iv_] Inline variable    [_ig_] Inject global in IIFE  [_ss_] split string  [_dt_] debug this
[_ip_] Introduce parameter     [_rv_] Rename variable    [_ee_] Expand node at point   [_sl_] forward slurp
[_em_] Extract method          [_vt_] Var to this        [_cc_] Contract node at point [_ba_] forward barf
[_ao_] Arguments to object     [_sv_] Split var decl.    [_uw_] unwrap
[_tf_] Toggle fun exp and decl [_ag_] Add var to globals [_q_]  quit
[_ta_] Toggle fun expr and =>  [_ti_] Ternary to if      
[_ts_] Toggle sync/async       [_tm_] Toggle require import
[_st_] String to Template"
  ("ee" js2r-expand-node-at-point)
  ("cc" js2r-contract-node-at-point)
  ("ef" js2r-extract-function)
  ("em" js2r-extract-method)
  ("tf" js2r-toggle-function-expression-and-declaration)
  ("ta" js2r-toggle-arrow-function-and-expression)
  ("ts" js2r-toggle-function-async)
  ("tm" js2-import-require)
  ("ip" js2r-introduce-parameter)
  ("lp" js2r-localize-parameter)
  ("wi" js2r-wrap-buffer-in-iife)
  ("ig" js2r-inject-global-in-iife)
  ("ag" js2r-add-to-globals-annotation)
  ("ev" js2r-extract-var)
  ("iv" js2r-inline-var)
  ("rv" js2r-rename-var)
  ("vt" js2r-var-to-this)
  ("ao" js2r-arguments-to-object)
  ("ti" js2r-ternary-to-if)
  ("sv" js2r-split-var-declaration)
  ("ss" js2r-split-string)
  ("uw" js2r-unwrap)
  ("lt" js2r-log-this)
  ("dt" js2r-debug-this)
  ("sl" js2r-forward-slurp)
  ("st" js2r-string-to-template)
  ("ba" js2r-forward-barf)
  ("k" js2r-kill)
  ("q" nil)
  )
(define-key js2-refactor-mode-map (kbd "C-c C-g") 'js2-refactor-hydra/body)

(defun js2-import-require (beg end)
  "Convert import to require and vis-a-vis in javascript, in marked region"
  (interactive "r")
  (let* ((limit (count-lines beg end)))
    (save-excursion
      (goto-char beg)
      (while (> limit 0)
	(if (string-search "=" (buffer-substring (line-beginning-position) (line-end-position)))
	    (replace-regexp-in-region "const \\([[:alnum:]-{}, ]+\\)=\s*require(\\(.+\\))\s*\\(;\\)?" "import \\1from \\2\\3" (point-at-bol) (point-at-eol))
	  (ignore-errors (replace-regexp-in-region "import \\([[:alnum:]-{}, ]+\\) from \\(.+\\)\s*\\(;\\)?" "const \\1 = require(\\2)\\3" (point-at-bol) (point-at-eol)))
	  )
	(forward-line)
	(setq limit (- limit 1))
	))
    )
  )
;; (defun js2-import-require (beg end)
;;   "Convert import to require and vis-a-vis in javascript, in marked region"
;;   (interactive "r")
;;     (let* ((limit (- end beg)))
;;     (while (> limit 0)
;;       (if (string-search "=" (buffer-substring (point-at-bol) (point-at-eol)))
;; 	  (replace-regexp-in-region "const \\([[:alnum:]-{}, ]+\\)=\s*require(\\(.+\\))\s*\\(;\\)" "import \\1from \\2\\3" (point-at-bol) (point-at-eol))
;; 	(replace-regexp-in-region "import \\([[:alnum:]-{}, ]+\\) from \\(.+\\)\s*\\(;\\)" "const \\1 = require(\\2)\\3" (point-at-bol) (point-at-eol))
;; 	)
;; 	(forward-line)
;; 	(setq limit (- limit 1))
;;       )
;;     )
;; )
;;   (let* ((text-collection
;; 	  ;; (buffer-substring (point-at-bol) (point-at-eol)))
;; 	 (split-string (buffer-substring beg end) "
;; " t))
;; 	 ;; (output
;; 	 ;;  (if (string-search "=" text)
;; 	 ;;      (replace-regexp-in-string "const \\([[:alnum:]-{}, ]+\\)\s*=\s*require(\\(.+\\))\s*\\(;\\)" "import \\1 from \\2\\3" text)
;; 	 ;;    (replace-regexp-in-string "import \\([[:alnum:]-{}, ]+\\) from \\(.+\\)\s*\\(;\\)" "const \\1 = require(\\2)\\3" text)
;; 	 ;;    ))
;; 	 ;; )
;;     ;; (beginning-of-line)
;;     ;; (kill-line)
;;     ;; (insert output)
;; 	 )
;;     (delete-region beg end)
;;     (while text-collection
;;       (setq text (car text-collection))
;;       (insert (if (string-search "=" text)
;; 		  (replace-regexp-in-string "const \\([[:alnum:]-{}, ]+\\)\s*=\s*require(\\(.+\\))\s*\\(;\\)" "import \\1 from \\2\\3" text)
;; 		(replace-regexp-in-string "import \\([[:alnum:]-{}, ]+\\) from \\(.+\\)\s*\\(;\\)" "const \\1 = require(\\2)\\3" text)
;; 		))
;;       (forward-line)
;;       (setq text-collection (cdr text-collection))
;;       )
  ;;     )
