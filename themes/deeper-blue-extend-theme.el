;;; deeper-blue-theme.el --- Custom theme for faces  -*- lexical-binding:t -*-

;; Copyright (C) 2011-2021 Free Software Foundation, Inc.

;; Author: Scott Frazer <frazer.scott@gmail.com>

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:

(deftheme deeper-blue-extend
  "Face colors using a deep blue background.")

(let ((class '((class color) (min-colors 89))))
  (custom-theme-set-faces
   'deeper-blue-extend
   `(Info-title-1-face ((,class (:family "helv" :weight bold :height 1.728))))
   `(Info-title-2-face ((,class (:family "helv" :weight bold :height 1.44))))
   `(Info-title-3-face ((,class (:family "helv" :weight bold :height 1.2))))
   `(Info-title-4-face ((,class (:family "helv" :weight bold))))
   `(compilation-column-number ((,class (:foreground "LightGreen"))))
   `(compilation-error ((,class (:foreground "Red1"))))
   `(compilation-info ((,class (:weight normal :foreground "LightSkyBlue"))))
   `(compilation-line-number ((,class (:foreground "LightGreen"))))
   `(compilation-mode-line-exit ((,class (:foreground "blue4"))))
   `(cperl-array-face ((,class (:foreground "yellow2"))))
   `(cperl-hash-face ((,class (:foreground "coral1"))))
   `(cursor ((,class (:background "green"))))
   `(default ((,class (:background "#181a26" :foreground "gray80"))))
   ;; `(diff-added ((,class (nil))))
   ;; `(diff-changed ((,class (nil))))
   `(diff-context ((,class (:foreground "seashell4"))))
   `(diff-file-header ((,class (:background "grey60"))))
   `(diff-function ((,class (:inherit diff-header))))
   `(diff-header ((,class (:background "grey45"))))
   `(diff-hunk-header ((,class (:inherit diff-header))))
   `(diff-index ((,class (:inherit diff-file-header))))
   `(diff-indicator-added ((,class (:foreground "white" :background "darkolivegreen"))))
   `(diff-indicator-changed ((,class (:foreground "white" :background "dodgerblue4"))))
   `(diff-indicator-removed ((,class (:foreground "white" :background "indianred4"))))
   `(diff-refine-change ((,class (:background "skyblue4"))))
   ;; `(diff-removed ((,class (nil))))
   `(dired-marked ((,class (:background "dodgerblue3" :foreground "white"))))
   `(ediff-current-diff-A ((,class (:background "green4" :foreground "white"))))
   `(ediff-current-diff-B ((,class (:background "darkorange3" :foreground "white"))))
   `(ediff-even-diff-B ((,class (:background "Grey50" :foreground "White"))))
   `(ediff-fine-diff-A ((,class (:background "skyblue4" :foreground "white"))))
   `(ediff-fine-diff-B ((,class (:background "cyan4" :foreground "white"))))
   `(ediff-odd-diff-A ((,class (:background "Grey50" :foreground "White"))))
   `(flymake-errline ((,class (:background nil :underline "red"))))
   `(flymake-warnline ((,class (:background nil :underline "magenta3"))))
   `(font-lock-builtin-face ((,class (:foreground "LightCoral"))))
   `(font-lock-comment-delimiter-face ((,class (:foreground "gray50"))))
   `(font-lock-comment-face ((,class (:foreground "gray50"))))
   `(font-lock-constant-face ((,class (:foreground "DarkOliveGreen3"))))
   `(font-lock-doc-face ((,class (:foreground "moccasin"))))
   `(font-lock-function-name-face ((,class (:foreground "goldenrod"))))
   `(font-lock-keyword-face ((,class (:foreground "DeepSkyBlue1"))))
   `(font-lock-preprocessor-face ((,class (:foreground "gold"))))
   `(font-lock-reference-face ((,class (:foreground "LightCoral"))))
   `(font-lock-regexp-grouping-backslash ((,class (:weight bold))))
   `(font-lock-regexp-grouping-construct ((,class (:weight bold))))
   `(font-lock-string-face ((,class (:foreground "burlywood"))))
   `(font-lock-type-face ((,class (:foreground "CadetBlue1"))))
   `(font-lock-variable-name-face ((,class (:foreground "SeaGreen2"))))
   `(fringe ((,class (:background "black"))))
   `(highlight ((,class (:background "DodgerBlue4"))))
   `(ido-first-match ((,class (:weight normal :foreground "orange"))))
   `(ido-only-match ((,class (:foreground "green"))))
   `(ido-subdir ((,class (:foreground nil :inherit font-lock-keyword-face))))
   `(info-header-node ((,class (:foreground "DeepSkyBlue1"))))
   `(info-header-xref ((,class (:foreground "SeaGreen2"))))
   `(info-menu-header ((,class (:family "helv" :weight bold))))
   `(info-node ((,class (:foreground "DeepSkyBlue1"))))
   `(info-xref ((,class (:foreground "SeaGreen2"))))
   `(isearch ((,class (:background "coral2" :foreground "white"))))
   `(isearch-lazy-highlight-face ((,class (:background "coral4" :foreground "white"))))
   `(lazy-highlight ((,class (:background "cadetblue" :foreground "white"))))
   `(match ((,class (:background "DeepPink4"))))
   `(minibuffer-prompt ((,class (:foreground "CadetBlue1"))))
   ;; `(mode-line ((,class (:background "gray75" :foreground "black" :box (:line-width 1 :style released-button)))))
   ;; `(mode-line-buffer-id ((,class (:weight bold :background nil :foreground "blue4"))))
   ;; '(mode-line ((t (:background "grey9" :foreground "grey45" :box (:line-width (1 . -1) :color "black")))))
   '(mode-line ((t (:family "Purisa" :width normal :height 150 :box (:line-width (1 . -1) :color "black") :foreground "grey45" :background "grey9"))))
   ;; '(mode-line ((t (:background "#132947" :foreground "#E8F0FF" :box (:line-width (1 . -1) :style released-button)))))
   '(mode-line-buffer-id ((t (:weight bold))))
   '(mode-line-emphasis ((t (:weight bold))))
   '(mode-line-highlight ((t (:inherit highlight))))
   `(mode-line-inactive ((,class (:background "grey13" :foreground "grey30"))))
   ;; `(mode-line-inactive ((,class (:background "black" :foreground "grey13" :box (:line-width 1 :color "gray40" :style nil)))))
   `(outline-1 ((,class (:foreground "SkyBlue1"))))
   `(outline-2 ((,class (:foreground "CadetBlue1"))))
   `(outline-3 ((,class (:foreground "LightSteelBlue1"))))
   `(outline-4 ((,class (:foreground "turquoise2"))))
   `(outline-5 ((,class (:foreground "aquamarine1"))))
   `(primary-selection ((,class (:background "blue3"))))
   `(region ((,class (:background "#103050"))))
   `(show-paren-match-face ((,class (:background "dodgerblue1" :foreground "white"))))
   `(show-paren-mismatch-face ((,class (:background "red1" :foreground "white"))))
   `(success ((,class (:foreground "SeaGreen2"))))
   `(warning ((,class (:foreground "Yellow"))))
   '(error ((t (:foreground "red3"))))
   '(outline-8 ((t (:foreground "orange2" :slant italic :weight bold :height 1.0))))
   '(minibuffer-prompt ((t (:foreground "gold" :weight bold))))
   '(tab-bar ((t (:inherit variable-pitch :background "black" :foreground "black"))))
   '(tab-bar-tab ((t (:box (:line-width (1 . 1) :style released-button) :foreground "color-19" :background "color-233" :inherit tab-bar))))
   '(tab-bar-tab-inactive ((t (:foreground "gray60" :background "black" :inherit tab-bar-tab))))
   '(why-this-face ((t (:background "color-99" :foreground "color-233" :slant italic))))
   ))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-function-call ((t (:foreground "gold" :inherit default))))
 '(js2-function-param ((t (:foreground "orange"))))
 '(js2-object-property ((t (:foreground "green4" :inherit default))))
 '(font-lock-builtin-face ((t (:foreground "tan3"))))
 '(font-lock-string-face ((t (:foreground "purple3"))))
 '(font-lock-constant-face ((t (:foreground "DeepPink"))))
 '(font-lock-variable-name-face ((t (:foreground "IndianRed"))))
 ;; '(font-lock-variable-name-face ((t (:foreground "yellow3"))))
 ;; '(default ((t (:inherit nil :extend nil :stipple nil :background "#181a26" :foreground "gray80" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 156 :width normal :family "Purisa"))))
 '(error ((t (:foreground "red3"))))
 '(link ((t (:foreground "DeepSkyBlue3" :underline t))))
 '(minibuffer-prompt ((t (:foreground "gold"))))
 '(show-paren-match ((t (:background "grey29"))))
 '(rainbow-delimiters-depth-1-face ((t (:height 1.3 :foreground "#707183" :inherit rainbow-delimiters-base-face))))
 '(rainbow-delimiters-depth-2-face ((t (:height 1.2 :foreground "#707183" :inherit rainbow-delimiters-base-face))))
 '(rainbow-delimiters-depth-3-face ((t (:height 1.1 :foreground "#707183" :inherit rainbow-delimiters-base-face))))
 )

(provide-theme 'deeper-blue-extend)

;;; deeper-blue-theme.el ends here


;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "Terminus (TTF) for Powerline" :foundry "PfEd" :slant normal :weight normal :height 202 :width normal))))
;;  '(button ((t (:inherit (link default) :foreground "color-93"))))
;;  '(custom-group-tag ((t (:height 1.2 :weight bold :foreground "color-40" :inherit variable-pitch))))
;;  '(custom-variable-tag ((t (:foreground "color-33" :weight bold))))
;;  '(diff-added ((t (:foreground "color-28" :background "black" :extend t :inherit diff-changed))))
;;  '(diff-file-header ((t (:extend t :background "color-99" :weight bold))))
;;  '(diff-header ((t (:extend t :background "color-65"))))
;;  '(diff-refine-removed ((t (:foreground "color-52" :background "#ffbbbb" :inherit diff-refine-changed))))
;;  '(diff-removed ((t (:foreground "red" :background "black" :extend t :inherit diff-changed))))
;;  '(dired-directory ((t (:foreground "color-33" :inherit font-lock-function-name-face))))
;;  '(ediff-current-diff-A ((t (:extend t :background "#555753"))))
;;  '(ediff-current-diff-B ((t (:extend t :background "#41423f"))))
;;  '(ediff-current-diff-C ((t (:extend t :background "color-236"))))
;;  '(ediff-even-diff-A ((t (:extend t :background "color-234"))))
;;  '(ediff-even-diff-B ((t (:extend t :background "color-234"))))
;;  '(ediff-even-diff-C ((t (:extend t :background "color-234" :distant-foreground "Black"))))
;;  '(ediff-fine-diff-C ((t (:background "color-233"))))
;;  '(ediff-odd-diff-A ((t (:extend t :background "color-234"))))
;;  '(ediff-odd-diff-B ((t (:extend t :background "color-234"))))
;;  '(font-lock-comment-face ((t (:foreground "color-239"))))
;;  '(font-lock-function-name-face ((t (:foreground "color-111"))))
;;  '(font-lock-string-face ((t (:foreground "magenta"))))
;;  '(isearch ((t (:background "color-53" :foreground "lightskyblue1"))))
;;  '(js2-function-call ((t (:foreground "color-39" :inherit default))))
;;  '(js2-function-param ((t (:foreground "color-40"))))
;;  '(js2-object-property ((t (:foreground "color-184" :inherit default))))
;;  '(log-view-message ((t (:extend t :background "color-16"))))
;;  '(magit-diff-added ((t (:extend t :background "black" :foreground "#22aa22"))))
;;  '(magit-diff-added-highlight ((t (:extend t :background "color-233" :foreground "brightgreen"))))
;;  '(magit-diff-context-highlight ((t (:extend t :background "color-232" :foreground "color-102"))))
;;  '(magit-diff-removed ((t (:extend t :background "black" :foreground "color-88"))))
;;  '(magit-diff-removed-highlight ((t (:extend t :background "color-233" :foreground "brightred"))))
;;  '(magit-section-highlight ((t (:extend t :background "color-234"))))
;;  '(match ((t (:background "color-90"))))
;;  '(minibuffer-prompt ((t (:distant-foreground "color-34" :foreground "color-99"))))
;;  '(org-document-title ((t (:foreground "color-34" :weight bold))))
;;  '(reb-match-0 ((t (:background "color-56"))))
;;  '(rjsx-tag ((t (:foreground "color-242"))))
;;  '(show-paren-match ((t (:background "#555" :foreground "#D83441" :weight ultra-bold))))
;;  '(smerge-lower ((t (:extend t :background "color-22"))))
;;  '(smerge-markers ((t (:extend t :background "color-235"))))
;;  '(smerge-upper ((t (:extend t :background "color-52"))))
;;  '(tab-bar ((t (:inherit variable-pitch :background "black" :foreground "black"))))
;;  '(tab-bar-tab ((t (:box (:line-width (1 . 1) :style released-button) :foreground "color-19" :background "color-233" :inherit tab-bar))))
;;  '(tab-bar-tab-inactive ((t (:foreground "color-235" :background "black" :inherit tab-bar-tab))))
;;  '(why-this-face ((t (:background "color-99" :foreground "color-233" :slant italic)))))
