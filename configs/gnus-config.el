;; -*- lexical-binding: t; -*-
;; https://www.emacswiki.org/emacs/GnusStripes
;; the color of the stripes is obtained by dimming the frame background color
(defvar stripe-intensity 12
  "*intensity of the shade. Used to compute the color of the stripes.
     0 means no shading of the background color, nil means gray80")

;; a command that computes the rgb code of the shaded background color
(defun shade-color (intensity)
  "print the #rgb color of the background, dimmed according to intensity"
  (interactive "nIntensity of the shade : ")
  (apply 'format "#%02x%02x%02x" 
	 (mapcar (lambda (x)
		   (if (> (lsh x -8) intensity)
		       (- (lsh x -8) intensity)
		     0))
		 (color-values (cdr (assoc 'background-color (frame-parameters)))))))

;; the command that actually puts the stripes in the current buffer
(defun stripe-alternate ()
  "stripes all down the current buffer"
  (interactive)
  ;; compute the color of the stripes from the value of stripe-intensity
  (if stripe-intensity 
      (setq stripe-overlay-face (shade-color stripe-intensity))
    (setq stripe-overlay-face "gray80"))
  ;; put the overlay in the current buffer
  (save-excursion
    (goto-char (point-min))
    (let (stripe-overlay)
      (while (not (eobp))
	(forward-line)
	(setq stripe-overlay 
              (make-overlay (line-beginning-position)
                            (line-beginning-position 2)))
	(overlay-put stripe-overlay 'face (list :background stripe-overlay-face))
	(overlay-put stripe-overlay 'priority -1)
	(forward-line)))))

;; activate the stripes for the mail buffers only
(add-hook 'gnus-summary-prepare-hook (lambda ()
				       (with-current-buffer gnus-summary-buffer 
					 (unless (gnus-news-group-p gnus-newsgroup-name)   
					   (stripe-alternate)))))                          

;;; https://www.emacswiki.org/emacs/GnusTopics
(defun gnus-topic-fold-this-topic nil
  "Toggle folding of current topic."
  (interactive)
  (gnus-topic-goto-topic (gnus-current-topic))
  (gnus-topic-fold))
(defun gnus-topic-goto-previous-topic-line nil
  "Goto the previous visible topic line.
    A replacement for `gnus-topic-goto-previous-topic'."
  (interactive)
  (goto-char (previous-single-property-change
              (line-beginning-position) 'gnus-topic nil (point-min))))

(defun gnus-topic-goto-next-topic-line nil
  "Goto the next visible topic line.
    A replacement for `gnus-topic-goto-next-topic'."
  (interactive)
  (goto-char (next-single-property-change
              (line-end-position) 'gnus-topic nil (point-max))))

;; (add-hook 'gnus-group-mode-hook
(add-hook 'gnus-startup-hook
	  (lambda ()
	    (gnus-demon-init)
	    (gnus-topic-mode)
	    (define-key gnus-group-mode-map (kbd "TAB") 'gnus-topic-fold-this-topic)
	    (define-key gnus-group-mode-map (kbd "M-p") 'gnus-topic-goto-previous-topic)

	    (gnus-add-configuration
	     '(article
               (horizontal 1.0
			   (vertical 25
				     (group 1.0))
			   (vertical 1.0
				     (summary 0.25 point)
				     (article 1.0)))))
	    (gnus-add-configuration
	     '(summary
               (horizontal 1.0
			   (vertical 25
				     (group 1.0))
			   (vertical 1.0
				     (summary 1.0 point)))))

	    ;; Question 6.6
	    ;; ............
	    ;; I don’t want expiration to delete my mails but to move them to another
	    ;; group.
	    ;; Answer
	    ;; ......
	    ;; Say something like this in ‘~/.gnus.el’:
	    (setq nnmail-expiry-target "nnml:expired")

	    ;;https://www.emacswiki.org/emacs/GnusDemon
	    (gnus-demon-add-handler 'gnus-demon-scan-news 2 t) ; this does a call to gnus-group-get-new-news)
	    ))

;; https://old.reddit.com/r/emacs/comments/jurtos/gnus_notifications/gcf3u1w/
(add-hook 'gnus-after-getting-new-news-hook
	  (lambda ()
	    (gnus-notifications)
	    (shell-command "stumpish notifications-add 'gnus update'" nil)
	    )
	  )
