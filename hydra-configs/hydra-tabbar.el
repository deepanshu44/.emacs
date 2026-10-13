;;    (defhydra hydra-tab-bar (:color amaranth)
;;     "Tab Bar Operations"
;;     ("t" tab-new "Create a new tab" :column "Creation")
;;     ("d" dired-other-tab "Open Dired in another tab")
;;     ("f" find-file-other-tab "Find file in another tab")
;;     ("0" tab-close "Close current tab")
;;     ("m" tab-move "Move current tab" :column "Management")
;;     ("r" tab-rename "Rename Tab")
;;     ("<return>" tab-bar-select-tab-by-name "Select tab by name" :column "Navigation")
;;     ("l" tab-next "Next Tab")
;;     ("j" tab-previous "Previous Tab")
;;     ("q" nil "Exit" :exit t))

;;   (defhydra hydra-tab-bar (:pre (setq which-key-inhibit t)
;;                                 :post (setq which-key-inhibit nil)
;;                                 :color amaranth)
;;     ... ;; same as previous
;;     ("w" (progn
;;            (hydra-window/body)
;;            (hydra-push '(hydra-tab-bar/body)))
;;      "Manage Windows" :exit t :column "Others")
;;     ("q" hydra-pop "Exit" :exit t)
;;   )
;; (global-set-key (kbd "C-x t") 'hydra-tab-bar/body)
