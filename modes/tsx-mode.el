;; -*- lexical-binding: t; -*-
;; (treesit-query-validate 'tsx '(((jsx_element (jsx_opening_element name: (identifier) @diff-removed))
;;      (:match "\\`[<>]*\\'" @diff-removed))
;;      ))

;; had to inlude otherwise complaines

(require 'typescript-ts-mode)
(define-derived-mode my-tsx-ts-mode tsx-ts-mode "TSX-MODE"
  "abcdefgh"
  (when (treesit-ready-p 'tsx)
    ;; (message "======%s" (car typescript-ts-mode--keywords))
    
  (setq-local treesit-font-lock-settings
                my-tsx-ts-mode--font-lock
              ;; (typescript-ts-mode--font-lock-settings 'tsx)
		)
  )
  )
(defvar my-tsx-ts-mode--font-lock 
  (when (and (fboundp 'treesit-ready-p) (treesit-ready-p 'tsx t))
    (treesit-font-lock-rules
   :language 'tsx
   :feature 'comment
   `([(comment) (hash_bang_line)] @font-lock-comment-face)

   :language 'tsx
   :feature 'constant
   `(((expression_statement (identifier) @diff-removed) 
      (:match "\\`[A-Z_][0-9A-Z_]*\\'" @diff-removed))
     [(true) (false) (null)] @font-lock-constant-face
     ((lexical_declaration (variable_declarator name: (identifier) value: (number)))
      @diff-refine-added)
     )

   :language 'tsx
   :feature 'keyword
   `([,@typescript-ts-mode--keywords] @org-table
     [(this) (super)] @font-lock-keyword-face
     )

   :language 'tsx
   :feature 'keyword-return
   :override t
   `("return" @keyword @vc-dir-header)

   :language 'tsx
   :feature 'string
   `((regex pattern: (regex_pattern)) @font-lock-regexp-face
     (string) @font-lock-string-face
     (template_string) @js--fontify-template-string
     (template_substitution ["${" "}"] @font-lock-misc-punctuation-face))

   :language 'tsx
   :override t ;; for functions assigned to variables
   :feature 'declaration
   `((function_declaration
      name: (identifier) @font-lock-function-name-face)
     (function_declaration
      name: (identifier) @font-lock-function-name-face)
     (function_signature
      name: (identifier) @font-lock-function-name-face)

     (method_definition
      name: (property_identifier) @font-lock-function-name-face)
     (method_signature
      name: (property_identifier) @font-lock-function-name-face)
     (required_parameter (identifier) @font-lock-variable-name-face)
     (optional_parameter (identifier) @font-lock-variable-name-face)

     (variable_declarator
      name: (identifier) @font-lock-function-name-face
      value: [(function_declaration) (arrow_function)])

     (variable_declarator
      name: (identifier) @font-lock-variable-name-face)

     (enum_declaration (identifier) @font-lock-type-face)

     (extends_clause value: (identifier) @font-lock-type-face)
     ;; extends React.Component<T>
     (extends_clause value: (member_expression
                             object: (identifier) @font-lock-type-face
                             property: (property_identifier) @font-lock-type-face))

     (arrow_function
      parameter: (identifier) @font-lock-variable-name-face)

     (variable_declarator
      name: (array_pattern
             (identifier)
             (identifier) @font-lock-function-name-face)
      value: (array (number) (function_expression)))

     (catch_clause
      parameter: (identifier) @font-lock-variable-name-face)

     ;; full module imports
     (import_clause (identifier) @font-lock-variable-name-face)
     ;; named imports with aliasing
     (import_clause (named_imports (import_specifier
                                    alias: (identifier) @font-lock-variable-name-face)))
     ;; named imports without aliasing
     (import_clause (named_imports (import_specifier
                                    !alias
                                    name: (identifier) @font-lock-variable-name-face)))

     ;; full namespace import (* as alias)
     (import_clause (namespace_import (identifier) @font-lock-variable-name-face)))

   :language 'tsx
   :feature 'identifier
   `((nested_type_identifier
      module: (identifier) @font-lock-type-face)

     (type_identifier) @font-lock-type-face

     (predefined_type) @font-lock-type-face

     (new_expression
      constructor: (identifier) @font-lock-type-face)

     (enum_body (property_identifier) @font-lock-type-face)

     (enum_assignment name: (property_identifier) @font-lock-type-face)

     (variable_declarator
      name: (identifier) @font-lock-variable-name-face)

     (for_in_statement
      left: (identifier) @font-lock-variable-name-face)

     (arrow_function
      parameters:
      [(_ (identifier) @font-lock-variable-name-face)
       (_ (_ (identifier) @font-lock-variable-name-face))
       (_ (_ (_ (identifier) @font-lock-variable-name-face)))]))

   :language 'tsx
   :feature 'property
   `((property_signature
      name: (property_identifier) @font-lock-property-name-face)
     (public_field_definition
      name: (property_identifier) @font-lock-property-name-face)

     (pair key: (property_identifier) @font-lock-property-use-face)

     ((shorthand_property_identifier) @font-lock-property-use-face))

   :language 'tsx
   :feature 'expression
   '((assignment_expression
      left: [(identifier) @font-lock-function-name-face
             (member_expression
              property: (property_identifier) @font-lock-function-name-face)]
      right: [(function_expression) (arrow_function)]))

   :language 'tsx
   :feature 'function
   '((call_expression
      function:
      [(identifier) @font-lock-function-call-face
       (member_expression
        property: (property_identifier) @font-lock-function-call-face)])
     ;;  (call_expression function: (identifier) @js2-private-function-call
     ;; arguments: (arguments)  @js2-private-function-call)
     )

   :language 'tsx
   :feature 'pattern
   `((pair_pattern
      key: (property_identifier) @font-lock-property-use-face
      value: [(identifier) @font-lock-variable-name-face
              (assignment_pattern left: (identifier) @font-lock-variable-name-face)])

     (array_pattern (identifier) @font-lock-variable-name-face)

     ((shorthand_property_identifier_pattern) @font-lock-variable-name-face))

   :language 'tsx
   :feature 'jsx
   :override t
   (append (tsx-ts-mode--font-lock-compatibility-bb1f97b 'tsx)
	   `((jsx_attribute (property_identifier) @typescript-ts-jsx-attribute-face)))
   ;; `((jsx_opening_element name: (identifier) @minibuffer-prompt))

 ; commented-out should highlight "<,>" ;
   ;; :language 'tsx
   ;; :feature 'jsx-tag
   ;; :override t
   ;; `((jsx_element
   ;;    open_tag: (jsx_opening_element "<" @typescript-ts-jsx-tag-face
   ;; 				     name: (identifier) @typescript-ts-jsx-tag-face
   ;; 				     ;; (jsx_attribute "=" @typescript-ts-jsx-tag-face)
   ;; 				     ">" @typescript-ts-jsx-tag-face
   ;; 				     )
   ;;    close_tag: (jsx_closing_element "</" @typescript-ts-jsx-tag-face
   ;; 				      name: (identifier) @typescript-ts-jsx-tag-face
   ;; 				      ">" @typescript-ts-jsx-tag-face
   ;; 				      )
   ;;    )
   ;;   (jsx_attribute (property_identifier) "=" @typescript-ts-jsx-tag-face)
   ;;   (jsx_attribute (jsx_expression ["{" "}"] @typescript-ts-jsx-tag-face))
   ;;   )
   ;;----------------------- another version for above
   ;; `((jsx_opening_element "<" @font-lock-builtin-face
   ;; 			  name: (identifier) @font-lock-builtin-face
   ;; 			  (jsx_attribute "=" @font-lock-builtin-face)
   ;; 			  ">" @font-lock-builtin-face
   ;; 			  )
   ;;   (jsx_opening_element "<" @font-lock-builtin-face
   ;; 			  name: (identifier) @font-lock-builtin-face
   ;; 			  ">" @font-lock-builtin-face
   ;; 			  )
   ;;-----------------------  
   ;;   )

   ;; :language 'tsx
   ;; :feature 'jsx-text
   ;; :override t
   ;; `((jsx_text) @font-lock-builtin-face)

   :language 'tsx
   :feature 'number
   `((number) @font-lock-number-face
     ((identifier) @font-lock-number-face
      (:match "\\`\\(?:NaN\\|Infinity\\)\\'" @font-lock-number-face)))

   :language 'tsx
   :feature 'operator
   `([,@typescript-ts-mode--operators] @font-lock-operator-face
     (ternary_expression ["?" ":"] @font-lock-operator-face))

   :language 'tsx
   :feature 'bracket
   '((["(" ")" "[" "]" "{" "}"]) @font-lock-bracket-face)

   :language 'tsx
   :feature 'delimiter
   '((["," "." ";" ":"]) @font-lock-delimiter-face)

   :language 'tsx
   :feature 'escape-sequence
   :override t
   '((escape_sequence) @font-lock-escape-face)

;;    :language 'tsx
;;    :feature 'test
;;    :override t
;; ;;    `((function_declaration name: (identifier) @font-lock-escape-face
;; ;;        ;; parameters: (formal_parameters ( ))
;; ;;        ;; body: (statement_block { })
;; ;; ))
;;    ;; `((call-expression @minibuffer-prompt))
;;    `((jsx_opening_element name: (identifier) @minibuffer-prompt))
   ))
    "My-TSX Tree-sitter font-lock settings."
    )

;; (defvar my-tsx-ts-mode--font-lock 
;;   (treesit-font-lock-rules
;;    :language 'tsx
;;    :feature 'comment
;;    `([(comment) (hash_bang_line)] @font-lock-comment-face)

;;    :language 'tsx
;;    :feature 'constant
;;    `(((identifier) @font-lock-constant-face
;;       (:match "\\`[A-Z_][0-9A-Z_]*\\'" @font-lock-constant-face))
;;      [(true) (false) (null)] @font-lock-constant-face)

;;    :language 'tsx
;;    :feature 'keyword
;;    `([,@typescript-ts-mode--keywords] @minibuffer-prompt
;;      [(this) (super)] @font-lock-keyword-face)

;;    :language 'tsx
;;    :feature 'string
;;    `((regex pattern: (regex_pattern)) @font-lock-regexp-face
;;      (string) @font-lock-string-face
;;      (template_string) @js--fontify-template-string
;;      (template_substitution ["${" "}"] @font-lock-misc-punctuation-face))

;;    :language 'tsx
;;    :override t ;; for functions assigned to variables
;;    :feature 'declaration
;;    `((function
;;       name: (identifier) @font-lock-function-name-face)
;;      (function_declaration
;;       name: (identifier) @font-lock-function-name-face)
;;      (function_signature
;;       name: (identifier) @font-lock-function-name-face)

;;      (method_definition
;;       name: (property_identifier) @font-lock-function-name-face)
;;      (method_signature
;;       name: (property_identifier) @font-lock-function-name-face)
;;      (required_parameter (identifier) @font-lock-variable-name-face)
;;      (optional_parameter (identifier) @font-lock-variable-name-face)

;;      (variable_declarator
;;       name: (identifier) @font-lock-function-name-face
;;       value: [(function) (arrow_function)])

;;      (variable_declarator
;;       name: (identifier) @font-lock-variable-name-face)

;;      (enum_declaration (identifier) @font-lock-type-face)

;;      (extends_clause value: (identifier) @font-lock-type-face)
;;      ;; extends React.Component<T>
;;      (extends_clause value: (member_expression
;;                              object: (identifier) @font-lock-type-face
;;                              property: (property_identifier) @font-lock-type-face))

;;      (arrow_function
;;       parameter: (identifier) @font-lock-variable-name-face)

;;      (variable_declarator
;;       name: (array_pattern
;;              (identifier)
;;              (identifier) @font-lock-function-name-face)
;;       value: (array (number) (function)))

;;      (catch_clause
;;       parameter: (identifier) @font-lock-variable-name-face)

;;      ;; full module imports
;;      (import_clause (identifier) @font-lock-variable-name-face)
;;      ;; named imports with aliasing
;;      (import_clause (named_imports (import_specifier
;;                                     alias: (identifier) @font-lock-variable-name-face)))
;;      ;; named imports without aliasing
;;      (import_clause (named_imports (import_specifier
;;                                     !alias
;;                                     name: (identifier) @font-lock-variable-name-face)))

;;      ;; full namespace import (* as alias)
;;      (import_clause (namespace_import (identifier) @font-lock-variable-name-face)))

;;    :language 'tsx
;;    :feature 'identifier
;;    `((nested_type_identifier
;;       module: (identifier) @font-lock-type-face)

;;      (type_identifier) @font-lock-type-face

;;      (predefined_type) @font-lock-type-face

;;      (new_expression
;;       constructor: (identifier) @font-lock-type-face)

;;      (enum_body (property_identifier) @font-lock-type-face)

;;      (enum_assignment name: (property_identifier) @font-lock-type-face)

;;      (variable_declarator
;;       name: (identifier) @font-lock-variable-name-face)

;;      (for_in_statement
;;       left: (identifier) @font-lock-variable-name-face)

;;      (arrow_function
;;       parameters:
;;       [(_ (identifier) @font-lock-variable-name-face)
;;        (_ (_ (identifier) @font-lock-variable-name-face))
;;        (_ (_ (_ (identifier) @font-lock-variable-name-face)))]))

;;    :language 'tsx
;;    :feature 'property
;;    `((property_signature
;;       name: (property_identifier) @font-lock-property-name-face)
;;      (public_field_definition
;;       name: (property_identifier) @font-lock-property-name-face)

;;      (pair key: (property_identifier) @font-lock-property-use-face)

;;      ((shorthand_property_identifier) @font-lock-property-use-face))

;;    :language 'tsx
;;    :feature 'expression
;;    '((assignment_expression
;;       left: [(identifier) @font-lock-function-name-face
;;              (member_expression
;;               property: (property_identifier) @font-lock-function-name-face)]
;;       right: [(function) (arrow_function)]))

;;    :language 'tsx
;;    :feature 'function
;;    '((call_expression
;;       function:
;;       [(identifier) @font-lock-function-call-face
;;        (member_expression
;;         property: (property_identifier) @font-lock-function-call-face)]))

;;    :language 'tsx
;;    :feature 'pattern
;;    `((pair_pattern
;;       key: (property_identifier) @font-lock-property-use-face
;;       value: [(identifier) @font-lock-variable-name-face
;;               (assignment_pattern left: (identifier) @font-lock-variable-name-face)])

;;      (array_pattern (identifier) @font-lock-variable-name-face)

;;      ((shorthand_property_identifier_pattern) @font-lock-variable-name-face))

;;    :language 'tsx
;;    :feature 'jsx
;;    (append (tsx-ts-mode--font-lock-compatibility-bb1f97b 'tsx)
;; 	   `((jsx_attribute (property_identifier) @typescript-ts-jsx-attribute-face)))

;;    :language 'tsx
;;    :feature 'number
;;    `((number) @font-lock-number-face
;;      ((identifier) @font-lock-number-face
;;       (:match "\\`\\(?:NaN\\|Infinity\\)\\'" @font-lock-number-face)))

;;    :language 'tsx
;;    :feature 'operator
;;    `([,@typescript-ts-mode--operators] @font-lock-operator-face
;;      (ternary_expression ["?" ":"] @font-lock-operator-face))

;;    :language 'tsx
;;    :feature 'bracket
;;    '((["(" ")" "[" "]" "{" "}"]) @font-lock-bracket-face)

;;    :language 'tsx
;;    :feature 'delimiter
;;    '((["," "." ";" ":"]) @font-lock-delimiter-face)

;;    :language 'tsx
;;    :feature 'escape-sequence
;;    :override t
;;    '((escape_sequence) @font-lock-escape-face))

;;     "My-TSX Tree-sitter font-lock settings."
;;   )





;; (define-derived-mode my-tsx-ts-mode tsx-ts-mode "TSX-MODE"
;;   "abcdefgh"
;;   (when (treesit-ready-p 'typescript)
;;     (setq-local treesit-font-lock-settings
;;                 (my-tsx-ts-mode--font-lock)
;; 		;; (typescript-ts-mode--font-lock-settings 'tsx)
;; 		)
;;          (treesit-major-mode-setup))
;;   )

;; (defvar my-tsx-ts-mode--font-lock 
;;   (treesit-font-lock-rules
;;    :language 'tsx
;;    :feature 'comment
;;    `([(comment) (hash_bang_line)] @font-lock-comment-face)

;;    :language 'tsx
;;    :feature 'constant
;;    `(((identifier) @font-lock-constant-face
;;       (:match "\\`[A-Z_][0-9A-Z_]*\\'" @font-lock-constant-face))
;;      [(true) (false) (null)] @font-lock-constant-face)

;;    :language 'tsx
;;    :feature 'keyword
;;    `([,@typescript-ts-mode--keywords] @font-lock-keyword-face
;;      [(this) (super)] @font-lock-keyword-face)

;;    :language 'tsx
;;    :feature 'string
;;    `((regex pattern: (regex_pattern)) @font-lock-regexp-face
;;      (string) @font-lock-string-face
;;      (template_string) @js--fontify-template-string
;;      (template_substitution ["${" "}"] @font-lock-misc-punctuation-face))

;;    :language 'tsx
;;    :override t ;; for functions assigned to variables
;;    :feature 'declaration
;;    `((function
;;       name: (identifier) @font-lock-function-name-face)
;;      (function_declaration
;;       name: (identifier) @font-lock-function-name-face)
;;      (function_signature
;;       name: (identifier) @font-lock-function-name-face)

;;      (method_definition
;;       name: (property_identifier) @font-lock-function-name-face)
;;      (method_signature
;;       name: (property_identifier) @font-lock-function-name-face)
;;      (required_parameter (identifier) @font-lock-variable-name-face)
;;      (optional_parameter (identifier) @font-lock-variable-name-face)

;;      (variable_declarator
;;       name: (identifier) @font-lock-function-name-face
;;       value: [(function) (arrow_function)])

;;      (variable_declarator
;;       name: (identifier) @font-lock-variable-name-face)

;;      (enum_declaration (identifier) @font-lock-type-face)

;;      (extends_clause value: (identifier) @font-lock-type-face)
;;      ;; extends React.Component<T>
;;      (extends_clause value: (member_expression
;;                              object: (identifier) @font-lock-type-face
;;                              property: (property_identifier) @font-lock-type-face))

;;      (arrow_function
;;       parameter: (identifier) @font-lock-variable-name-face)

;;      (variable_declarator
;;       name: (array_pattern
;;              (identifier)
;;              (identifier) @font-lock-function-name-face)
;;       value: (array (number) (function)))

;;      (catch_clause
;;       parameter: (identifier) @font-lock-variable-name-face)

;;      ;; full module imports
;;      (import_clause (identifier) @font-lock-variable-name-face)
;;      ;; named imports with aliasing
;;      (import_clause (named_imports (import_specifier
;;                                     alias: (identifier) @font-lock-variable-name-face)))
;;      ;; named imports without aliasing
;;      (import_clause (named_imports (import_specifier
;;                                     !alias
;;                                     name: (identifier) @font-lock-variable-name-face)))

;;      ;; full namespace import (* as alias)
;;      (import_clause (namespace_import (identifier) @font-lock-variable-name-face)))

;;    :language 'tsx
;;    :feature 'identifier
;;    `((nested_type_identifier
;;       module: (identifier) @font-lock-type-face)

;;      (type_identifier) @font-lock-type-face

;;      (predefined_type) @font-lock-type-face

;;      (new_expression
;;       constructor: (identifier) @font-lock-type-face)

;;      (enum_body (property_identifier) @font-lock-type-face)

;;      (enum_assignment name: (property_identifier) @font-lock-type-face)

;;      (variable_declarator
;;       name: (identifier) @font-lock-variable-name-face)

;;      (for_in_statement
;;       left: (identifier) @font-lock-variable-name-face)

;;      (arrow_function
;;       parameters:
;;       [(_ (identifier) @font-lock-variable-name-face)
;;        (_ (_ (identifier) @font-lock-variable-name-face))
;;        (_ (_ (_ (identifier) @font-lock-variable-name-face)))]))

;;    :language 'tsx
;;    :feature 'property
;;    `((property_signature
;;       name: (property_identifier) @font-lock-property-name-face)
;;      (public_field_definition
;;       name: (property_identifier) @font-lock-property-name-face)

;;      (pair key: (property_identifier) @font-lock-property-use-face)

;;      ((shorthand_property_identifier) @font-lock-property-use-face))

;;    :language 'tsx
;;    :feature 'expression
;;    '((assignment_expression
;;       left: [(identifier) @font-lock-function-name-face
;;              (member_expression
;;               property: (property_identifier) @font-lock-function-name-face)]
;;       right: [(function) (arrow_function)]))

;;    :language 'tsx
;;    :feature 'function
;;    '((call_expression
;;       function:
;;       [(identifier) @font-lock-function-call-face
;;        (member_expression
;;         property: (property_identifier) @font-lock-function-call-face)]))

;;    :language 'tsx
;;    :feature 'pattern
;;    `((pair_pattern
;;       key: (property_identifier) @font-lock-property-use-face
;;       value: [(identifier) @font-lock-variable-name-face
;;               (assignment_pattern left: (identifier) @font-lock-variable-name-face)])

;;      (array_pattern (identifier) @font-lock-variable-name-face)

;;      ((shorthand_property_identifier_pattern) @font-lock-variable-name-face))

;;    :language 'tsx
;;    :feature 'jsx
;;    (append (tsx-ts-mode--font-lock-compatibility-bb1f97b 'tsx)
;; 	   `((jsx_attribute (property_identifier) @typescript-ts-jsx-attribute-face)))

;;    :language 'tsx
;;    :feature 'number
;;    `((number) @font-lock-number-face
;;      ((identifier) @font-lock-number-face
;;       (:match "\\`\\(?:NaN\\|Infinity\\)\\'" @font-lock-number-face)))

;;    :language 'tsx
;;    :feature 'operator
;;    `([,@typescript-ts-mode--operators] @font-lock-operator-face
;;      (ternary_expression ["?" ":"] @font-lock-operator-face))

;;    :language 'tsx
;;    :feature 'bracket
;;    '((["(" ")" "[" "]" "{" "}"]) @font-lock-bracket-face)

;;    :language 'tsx
;;    :feature 'delimiter
;;    '((["," "." ";" ":"]) @font-lock-delimiter-face)

;;    :language 'tsx
;;    :feature 'escape-sequence
;;    :override t
;;    '((escape_sequence) @font-lock-escape-face))

;;     "My-TSX Tree-sitter font-lock settings."
;;   )

;;; errors in `typescript-ts-mode--font-lock-settings' in typescritp-ts-mode. Below is corrected code
(defun typescript-ts-mode--font-lock-settings (language)
  "Tree-sitter font-lock settings.
Argument LANGUAGE is either `typescript' or `tsx'."
  (treesit-font-lock-rules
   :language language
   :feature 'comment
   `([(comment) (hash_bang_line)] @font-lock-comment-face)

   :language language
   :feature 'constant
   `(((identifier) @font-lock-constant-face
      (:match "\\`[A-Z_][0-9A-Z_]*\\'" @font-lock-constant-face))
     [(true) (false) (null)] @font-lock-constant-face)

   :language language
   :feature 'keyword
   `([,@typescript-ts-mode--keywords] @font-lock-keyword-face
     [(this) (super)] @font-lock-keyword-face)

   :language language
   :feature 'string
   `((regex pattern: (regex_pattern)) @font-lock-regexp-face
     (string) @font-lock-string-face
     (template_string) @js--fontify-template-string
     (template_substitution ["${" "}"] @font-lock-misc-punctuation-face))

   :language language
   :override t ;; for functions assigned to variables
   :feature 'declaration
   `((function_declaration
      name: (identifier) @font-lock-function-name-face)
     (function_declaration
      name: (identifier) @font-lock-function-name-face)
     (function_signature
      name: (identifier) @font-lock-function-name-face)

     (method_definition
      name: (property_identifier) @font-lock-function-name-face)
     (method_signature
      name: (property_identifier) @font-lock-function-name-face)
     (required_parameter (identifier) @js2-function-param)
     (optional_parameter (identifier) @js2-function-param)

     (variable_declarator
      name: (identifier) @font-lock-function-name-face
      value: [(function_declaration) (arrow_function)])

     (variable_declarator
      name: (identifier) @font-lock-variable-name-face)

     (enum_declaration (identifier) @font-lock-type-face)

     (extends_clause value: (identifier) @font-lock-type-face)
     ;; extends React.Component<T>
     (extends_clause value: (member_expression
                             object: (identifier) @font-lock-type-face
                             property: (property_identifier) @font-lock-type-face))

     (arrow_function
      parameter: (identifier) @font-lock-variable-name-face)

     (variable_declarator
      name: (array_pattern
             (identifier)
             (identifier) @font-lock-function-name-face)
      value: (array (number) (function_expression)))

     (catch_clause
      parameter: (identifier) @font-lock-variable-name-face)

     ;; full module imports
     (import_clause (identifier) @font-lock-variable-name-face)
     ;; named imports with aliasing
     (import_clause (named_imports (import_specifier
                                    alias: (identifier) @font-lock-variable-name-face)))
     ;; named imports without aliasing
     (import_clause (named_imports (import_specifier
                                    !alias
                                    name: (identifier) @font-lock-variable-name-face)))

     ;; full namespace import (* as alias)
     (import_clause (namespace_import (identifier) @font-lock-variable-name-face)))

   :language language
   :feature 'identifier
   `((nested_type_identifier
      module: (identifier) @font-lock-type-face)

     (type_identifier) @font-lock-type-face

     (predefined_type) @font-lock-type-face

     (new_expression
      constructor: (identifier) @font-lock-type-face)

     (enum_body (property_identifier) @font-lock-type-face)

     (enum_assignment name: (property_identifier) @font-lock-type-face)

     (variable_declarator
      name: (identifier) @font-lock-variable-name-face)

     (for_in_statement
      left: (identifier) @font-lock-variable-name-face)

     (arrow_function
      parameters:
      [(_ (identifier) @font-lock-variable-name-face)
       (_ (_ (identifier) @font-lock-variable-name-face))
       (_ (_ (_ (identifier) @font-lock-variable-name-face)))]))

   :language language
   :feature 'property
   `((property_signature
      name: (property_identifier) @font-lock-property-name-face)
     (public_field_definition
      name: (property_identifier) @font-lock-property-name-face)

     ;; (pair key: (property_identifier) @font-lock-property-use-face)
     (pair key: (property_identifier) @js2-object-property)

     ((shorthand_property_identifier) @font-lock-property-use-face))

   :language language
   :feature 'expression
   '((assignment_expression
      left: [(identifier) @font-lock-function-name-face
             (member_expression
              property: (property_identifier) @font-lock-function-name-face)]
      right: [(function_expression) (arrow_function)]))

   :language language
   :feature 'function
   ;; '((member_expression property: (property_identifier) @outline-7))
   '((call_expression
      function:
      [(identifier) @font-lock-function-call-face
       (member_expression
        property: (property_identifier) @font-lock-function-call-face)]))

   :language language
   :feature 'pattern
   `((pair_pattern
      key: (property_identifier) @font-lock-property-use-face
      value: [(identifier) @font-lock-variable-name-face
              (assignment_pattern left: (identifier) @font-lock-variable-name-face)])

     (array_pattern (identifier) @font-lock-variable-name-face)

     ((shorthand_property_identifier_pattern) @font-lock-variable-name-face))

   :language language
   :feature 'jsx
   (append (tsx-ts-mode--font-lock-compatibility-bb1f97b language)
	   `((jsx_attribute (property_identifier) @typescript-ts-jsx-attribute-face)))

   :language language
   :feature 'number
   `((number) @font-lock-number-face
     ((identifier) @font-lock-number-face
      (:match "\\`\\(?:NaN\\|Infinity\\)\\'" @font-lock-number-face)))

   :language language
   :feature 'operator
   `([,@typescript-ts-mode--operators] @font-lock-operator-face
     (ternary_expression ["?" ":"] @font-lock-operator-face))

   :language language
   :feature 'bracket
   '((["(" ")" "[" "]" "{" "}"]) @font-lock-bracket-face)

   :language language
   :feature 'delimiter
   '((["," "." ";" ":"]) @font-lock-delimiter-face)

   :language language
   :feature 'escape-sequence
   :override t
   '((escape_sequence) @font-lock-escape-face)

   
   :language language
   :feature 'test
   :override t
   ;; '((expression_statement property: (property_identifier) @outline-7))
   '((pair key: (property_identifier) @diff-refine-added))
   ))

;; (treesit-query-validate 'typescript '((lexical_declaration kind: "let" @diff-refine-added)))
