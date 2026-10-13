(setq org-journal-dir (expand-file-name "journal" user-emacs-directory))

(defun org-journal-save-entry-and-exit()
  "Simple convenience function.
  Saves the buffer of the current day's entry and kills the window
  Similar to org-capture like behavior"
  (interactive)
  (save-buffer)
  (kill-buffer-and-window))
  (org-journal-mode)  ;;need to add otherwise give error void 
(define-key org-journal-mode-map (kbd "C-x C-s") 'org-journal-save-entry-and-exit)

