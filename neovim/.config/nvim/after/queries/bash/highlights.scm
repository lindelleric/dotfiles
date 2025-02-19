; extends


; ;; Common script commands
; ((word) @bash.command
;  (#match? @bash.command "^(npm|yarn|pnpm|nx|next|tsc|jest|eslint|prettier|vite|webpack|nodemon)$"))
;
; ;; Flag arguments
; (command
;   argument: (word) @bash.argumentFlag 
;   (#match? @bash.argumentFlag "^(-[a-z]|--[a-z-]+)$"))
;
; ;; Path arguments
; (command
;   argument: (word) @bash.path
;   (#match? @bash.path "^(\.{1,2}/|/|src/|dist/)"))
;
; ;; Build/environment modifiers
; (word) @bash.env (#match? @bash.env "^(development|production|test|build|dev|prod)$")



; ;; Common script commands
; ((word) @bash.command
;  (#match? @bash.command "^(npm|yarn|pnpm|vitest|cross-env|node|next|tsc|jest|eslint|prettier|vite|webpack|webpack|node-git-hooks|npx|git|expo|wrangler)$"))

(command_name
  (word) @bash.specialCommand
  (#any-of? @bash.specialCommand
    "yarn" "next" "tsc" "vitest" "cross-env" "node" "wrangler" "npx" "git" "eslint" "prettier" "jest" "webpack" "node-git-hooks" "expo"
  )
)

(command
  argument: 
  (word) @bash.specialCommand
  (#any-of? @bash.specialCommand
    "yarn" "next" "tsc" "vitest" "cross-env" "node" "wrangler" "npx" "git" "eslint" "prettier" "jest" "webpack" "node-git-hooks" "expo"
))

(command
  argument: (word) @bash.argumentFlag (#match? @bash.argumentFlag "^(-|--)")
)

;; Build/environment modifiers
(word) @bash.env (#match? @bash.env "^(development|production|test|build|dev|prod)$")

;; Path arguments
(command
  argument: (word) @bash.path
  (#match? @bash.path "^(\.{1,2}/|/|src/|dist/)"))
