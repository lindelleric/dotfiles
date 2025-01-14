 ; ((pair
 ;   key: (string) @key (#eq? @key "scripts")
 ;   value: (object
 ;     (pair
 ;       key: (string) @subkey
 ;       value: (string) @bash_script
 ;     )
 ;   )
 ; )
 ; (#set! injection.language "bash")
 ; (#set! injection.combined))

 ; (#set! injection.language "bash")
 ; (#set! injection.combined))

; (pair
;   key: (string) @key (#eq? @key "scripts")
;   value: (object
;     (pair
;       key: (string)
;       value: (string) @bash
;     )
;   )
; )

; mark scripts as bash
; (pair
;   key: (string) @key (#eq? @key "scripts")
;   value: (object
;     (pair
;       key: (string) @subkey
;       value: (string) @bash_script
;     )
;   )
; )
; (#set! injection.language "bash")
; (#set! injection.combined)


; Inject Bash syntax highlighting into script values in package.json
; this doesnt work...
; ((pair
;   key: (string) @key (#eq? @key "scripts")
;   value: (object
;     (pair
;       key: (string)
;       value: (string) @bash
;     )
;   )
; )
;  (#set! injection.language "bash"))

; ; el.innerHTML = '<html>'
; (assignment_expression
;   left: (member_expression
;     property: (property_identifier) @_prop
;     (#any-of? @_prop "outerHTML" "innerHTML"))
;   right: (string
;     (string_fragment) @injection.content)
;   (#set! injection.language "html"))

; ;---- Angular injections -----
; ; @Component({
; ;   template: `<html>`
; ; })
; (decorator
;   (call_expression
;     function: ((identifier) @_name
;       (#eq? @_name "Component"))
;     arguments: (arguments
;       (object
;         (pair
;           key: ((property_identifier) @_prop
;             (#eq? @_prop "template"))
;           value: ((template_string) @injection.content
;             (#offset! @injection.content 0 1 0 -1)
;             (#set! injection.include-children)
;             (#set! injection.language "angular")))))))

; (pair
;     key: (string)
;     value: (object
;         (pair
;             key: (string)
;             value: ((string) @injection.content
;                 (#set! injection.language "bash")(#set! injection.combined))
;         )
;     )
;   )

 ; (pair
 ;   key: (string) ;@key (#eq? @key "scripts")
 ;   value: (object
 ;     (pair
 ;       key: (string) 
 ;       value: ((string) @injection.content
 ;        ; (#offset! @injection.content 0 1 0 -1)
 ;        (#set! injection.include-children)
 ;        (#set! injection.language "bash")
 ;        ; (#set! injection.combined)
 ;     )
 ;   )
 ; ))

 (pair
   key: (string (string_content) @key (#eq? @key "scripts"))
   value: (object
     (pair
       key: (string) 
       value: (string
        (string_content) @injection.content
        ; (#offset! @injection.content 0 1 0 -1)
        (#set! injection.language "bash")
        )
     
   )
 ))

; (pair
;   key: (string) @key (#eq? @key "scripts")
;     ;  (string) @_prop
;     ; (#any-of? @_prop "script"))
;   value: (object
;     (pair
;       key: (string)
;       value: (string) @injextion.content
;     )
;     ; (string_fragment) @injection.content)
;       (#set! injection.language "bash")))
