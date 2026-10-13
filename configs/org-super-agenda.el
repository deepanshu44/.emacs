(org-super-agenda-mode 1) 
(setq org-super-agenda-groups
     '( (:deadline past)
         (:deadline today)
          (:deadline future)
           (:discard (:anything t))))
           
(let ((org-agenda-span 'day)
      (org-super-agenda-groups
       '((:name "Time grid items in all-uppercase with RosyBrown1 foreground"
                :time-grid t
                :transformer (--> it
                                  (upcase it)
                                  (propertize it 'face '(:foreground "RosyBrown1"))))
         (:name "Priority >= C items underlined, on black background"
                :face (:background "black" :underline t)
                :not (:priority>= "C")
                :order 100))))
  (org-agenda nil "a"))

