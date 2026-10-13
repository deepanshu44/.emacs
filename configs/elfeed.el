;; -*- lexical-binding: t; -*-
;;; start
(use-package elfeed-dashboard
  :ensure t
  :config
  (setq elfeed-dashboard-file (expand-file-name "elfeed-dashboard.org" user-emacs-directory))
  ;; update feed counts on elfeed-quit
  (advice-add 'elfeed-search-quit-window :after #'elfeed-dashboard-update-links)
  :bind ("C-x w" . elfeed-dashboard))
  

;; Initialize elfeed-org
;; This hooks up elfeed-org to read the configuration when elfeed
;; is started with =M-x elfeed=


(elfeed-org)
;; Optionally specify a number of files containing elfeed
;; configuration. If not set then the location below is used.
;; Note: The customize interface is also supported.
(setq rmh-elfeed-org-files (list (expand-file-name "elfeed.org" user-emacs-directory)))

;;; faces
;;;; important
(defface important-elfeed-entry
  '((t :foreground "#f77"))
  "Marks an important Elfeed entry.")

(push '(important important-elfeed-entry)
      elfeed-search-face-alist)

;;;; linux
(defface linux-elfeed-entry
  `((t :foreground "dodger blue"))
  "Marks an linux Elfeed entry.")
(push '(linux linux-elfeed-entry)
      elfeed-search-face-alist)
;;;; mustread
(defface mustread-elfeed-entry
  `((t :foreground "orange"))
  "Marks an mustread Elfeed entry.")
(push '(mustread mustread-elfeed-entry)
      elfeed-search-face-alist)
;;;; news
(defface news-elfeed-entry
  `((t :foreground "green yellow"))
  "Marks an news Elfeed entry.")
(push '(news news-elfeed-entry)
      elfeed-search-face-alist)
;;;; news-international
(defface international-elfeed-entry
  `((t :foreground "spring green"))
  "Marks an news Elfeed entry.")
(push '(international international-elfeed-entry)
      elfeed-search-face-alist)      

;;;; news-national
(defface national-elfeed-entry
  `((t :foreground "lime green"))
  "Marks an news Elfeed entry.")
(push '(national national-elfeed-entry)
      elfeed-search-face-alist)      

;;;; news-state
(defface state-elfeed-entry
  `((t :foreground "lawn green"))
  "Marks an news Elfeed entry.")
(push '(state state-elfeed-entry)
      elfeed-search-face-alist)      

;;;; security
(defface security-elfeed-entry
  `((t :foreground "#5F5F0000D7D7"))
  "Marks an news Elfeed entry.")
(push '(security security-elfeed-entry)
      elfeed-search-face-alist)
;;;; commented out
;; (defface unread-tag
;; '((t :background "brown"))
;; "Marks foo tags.")

;; (push '(unread unread-tag)
;; elfeed-search-face-alist)
;; (defface linux-tag
;; '((t :background "blue"))
;; "Marks foo tags.")

;; (push '(linux linux-tag)
;; elfeed-search-face-alist)

;;; functions
;;https://github.com/skeeto/elfeed/issues/392
(defun sk/elfeed-db-remove-entry (id)
  "Removes the entry for ID"
  (avl-tree-delete elfeed-db-index id)
  (remhash id elfeed-db-entries))

(defun sk/elfeed-search-remove-selected ()
  "Remove selected entries from database"
  (interactive)
  (let* ((entries (elfeed-search-selected))
	 (count (length entries)))
    (when (y-or-n-p (format "Delete %d entires?" count))      
      (cl-loop for entry in entries
	       do (sk/elfeed-db-remove-entry (elfeed-entry-id entry)))))
  (elfeed-search-update--force))
 (define-key elfeed-search-mode-map (kbd "d") 'sk/elfeed-search-remove-selected)
;;


;; https://github.com/skeeto/elfeed/issues/394#issuecomment-899808190
(with-eval-after-load 'elfeed
  (setq-default elfeed-search-remain-on-entry t)
  (defun my/elfeed-search-peek-entry (entry)
    """Display the currently selected item while keeping it unread."""
    (interactive (list (elfeed-search-selected :ignore-region)))
    (elfeed-search-show-entry entry)
    (elfeed-show-tag 'unread))
  (define-key elfeed-search-mode-map (kbd "v") 'my/elfeed-search-peek-entry))



