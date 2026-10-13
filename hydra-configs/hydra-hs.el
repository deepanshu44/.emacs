(defhydra hydra-fold (:columns 2 :pre (hs-minor-mode 1) )
  "fold"
  ("t" hs-toggle-hiding "toggle")
  ("h" hs-hide-all "hide-all")
  ("s" hs-show-all "show-all")
  ("l" hs-hide-level "hide-level")
  ("q" nil "quit"))

(global-set-key (kbd "C-c `") 'hydra-fold/body)






