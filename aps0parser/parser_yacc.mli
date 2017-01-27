type token =
  | AND
  | OR
  | ADD
  | SUB
  | MUL
  | DIV
  | LT
  | EQ
  | NOT
  | TRUE
  | FALSE
  | NUM of (int)
  | IDENT of (string)
  | BOOL
  | INT
  | SET
  | IF
  | WHILE
  | CONST
  | VAR
  | EOF
  | SEMICOLON
  | LBRACKET
  | RBRACKET

val start :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.pROG
