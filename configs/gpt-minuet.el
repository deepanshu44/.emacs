;; -*- lexical-binding: t; -*-
;; (package-vc-install "https://github.com/milanglacier/minuet-ai.el")

;; (require 'minuet)
;; (defvar minuet-codestral-options
;;     '(:model "codestral-latest"
;;       :end-point "https://codestral.mistral.ai/v1/fim/completions"
;;       :api-key "<your_api>"
;;       :template (:prompt minuet--default-fim-prompt-function
;;                  :suffix minuet--default-fim-suffix-function)
;;       :optional nil)
;;     "config options for Minuet Codestral provider")
;; (minuet-set-optional-options minuet-codestral-options :stop ["\n\n"])
;; (minuet-set-optional-options minuet-codestral-options :max_tokens 256)


;; (setenv "CODESTRAL_API_KEY" "<your_api>")
;; install with straight
(use-package minuet
    :bind
    ;; (("M-y" . #'minuet-complete-with-minibuffer) ;; use minibuffer for completion
     ;; ("M-i" . #'minuet-show-suggestion) ;; use overlay for completion

    ;;  :map minuet-active-mode-map
    ;;  ;; These keymaps activate only when a minuet suggestion is displayed in the current buffer
    ;;  ("M-p" . #'minuet-previous-suggestion) ;; invoke completion or cycle to next completion
     ("M-i" . #'minuet-next-suggestion) ;; invoke completion or cycle to previous completion
     ("M-RET" . #'minuet-accept-suggestion) ;; accept whole completion
    ;;  ;; Accept the first line of completion, or N lines with a numeric-prefix:
    ;;  ;; e.g. C-u 2 M-a will accepts 2 lines of completion.
    ;;  ("M-a" . #'minuet-accept-suggestion-line)
    ;;  ("M-e" . #'minuet-dismiss-suggestion))

    :init
    ;; if you want to enable auto suggestion.
    ;; Note that you can manually invoke completions without enable minuet-auto-suggestion-mode
    ;; (add-hook 'prog-mode-hook #'minuet-auto-suggestion-mode)

    :config
    (setq minuet-provider 'codestral)
    (defvar minuet-codestral-options
      '(:api-key "<your_api>"
	;; :model "codestral-latest"
      ;; :end-point "https://codestral.mistral.ai/v1/fim/completions"
      ;; :template (:prompt minuet--default-fim-prompt-function
      ;;            :suffix minuet--default-fim-suffix-function)
      :optional nil)
    ;; Required when defining minuet-ative-mode-map in insert/normal states.
    ;; Not required when defining minuet-active-mode-map without evil state.
    ;; (add-hook 'minuet-active-mode-hook #'evil-normalize-keymaps)
    ;; (minuet-set-optional-options minuet-openai-fim-compatible-options :max_tokens 1256)
    (minuet-set-optional-options minuet-openai-fim-compatible-options :max_tokens 500)
    ))

;; (require "minuet")
;; (load-library "~/.emacs.d/elpa/dash-20230304.2223/dash")
;; (load-library "~/.emacs.d/elpa/plz-0.9.1/plz")
;; (load-library "~/.emacs.d/elpa/minuet-20250205.1919/minuet.el")

;; (setenv "CODESTRAL_API_KEY" "<your_api>")
;; (setq minuet-provider 'codestral)


;; local provider

(use-package minuet
  :bind
  (
   ;; ("M-y" . #'minuet-complete-with-minibuffer)
   ("M-i" . #'minuet-show-suggestion)
   :map minuet-active-mode-map
   ;; ("M-p" . #'minuet-previous-suggestion)
   ;; ("M-n" . #'minuet-next-suggestion)
   ("M-RET" . #'minuet-accept-suggestion)
   ;; ("M-e" . #'minuet-dismiss-suggestion)
   )

  :init
  ;; if you want to enable auto suggestion (uncomment hook to enable)
  ;; (add-hook 'prog-mode-hook #'minuet-auto-suggestion-mode)

  :config
  (setq minuet-n-completions 1)
  (setq minuet-provider 'openai-fim-compatible)
  (setq minuet-context-window 512)
  (plist-put minuet-openai-fim-compatible-options :end-point "http://localhost:11434/v1/completions")
  (plist-put minuet-openai-fim-compatible-options :name "Ollama")
  (plist-put minuet-openai-fim-compatible-options :api-key "TERM")
  ;; (plist-put minuet-openai-fim-compatible-options :model "qwen-gpu:latest")
  (plist-put minuet-openai-fim-compatible-options :model "qwen2.5-coder-fim-gpu:1.5b")
  ;; (plist-put minuet-openai-fim-compatible-options :model "qwen2.5-coder:1.5b")
  ;; (minuet-set-optional-options minuet-openai-fim-compatible-options :max_tokens 256 :top_p 0.9 :temperature 0.2)
  (setq minuet-auto-suggestion-delay 1.0)
  (setq minuet-request-timeout 5.0)
  )
