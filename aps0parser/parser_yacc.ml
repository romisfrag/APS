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

open Parsing;;
let _ = parse_error;;
let yytransl_const = [|
  257 (* AND *);
  258 (* OR *);
  259 (* ADD *);
  260 (* SUB *);
  261 (* MUL *);
  262 (* DIV *);
  263 (* LT *);
  264 (* EQ *);
  265 (* NOT *);
  266 (* TRUE *);
  267 (* FALSE *);
  270 (* BOOL *);
  271 (* INT *);
  272 (* SET *);
  273 (* IF *);
  274 (* WHILE *);
  275 (* CONST *);
  276 (* VAR *);
    0 (* EOF *);
  277 (* SEMICOLON *);
  278 (* LBRACKET *);
  279 (* RBRACKET *);
    0|]

let yytransl_block = [|
  268 (* NUM *);
  269 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\003\000\003\000\005\000\005\000\004\000\
\004\000\004\000\006\000\006\000\007\000\007\000\007\000\007\000\
\007\000\007\000\008\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\009\000\000\000"

let yylen = "\002\000\
\002\000\003\000\001\000\003\000\003\000\003\000\004\000\003\000\
\004\000\003\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\002\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\028\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\013\000\014\000\015\000\016\000\000\000\017\000\018\000\000\000\
\000\000\000\000\002\000\000\000\000\000\008\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\019\000\000\000\
\010\000\000\000\011\000\012\000\006\000\005\000\004\000\020\000\
\021\000\022\000\023\000\024\000\025\000\026\000\027\000\009\000\
\007\000"

let yydgoto = "\002\000\
\004\000\005\000\011\000\012\000\013\000\053\000\029\000\030\000\
\031\000"

let yysindex = "\016\000\
\252\254\000\000\010\255\000\000\019\000\008\255\038\255\038\255\
\009\255\011\255\000\255\031\255\032\255\000\000\038\255\038\255\
\038\255\038\255\038\255\038\255\038\255\038\255\038\255\038\255\
\000\000\000\000\000\000\000\000\252\254\000\000\000\000\252\254\
\038\255\244\254\000\000\010\255\010\255\000\000\038\255\038\255\
\038\255\038\255\038\255\038\255\038\255\038\255\000\000\252\254\
\000\000\244\254\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\033\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\228\255\225\255\000\000\000\000\004\000\248\255\000\000\
\000\000"

let yytablesize = 56
let yytable = "\032\000\
\048\000\051\000\052\000\049\000\054\000\055\000\038\000\039\000\
\040\000\041\000\042\000\043\000\044\000\045\000\046\000\047\000\
\001\000\003\000\014\000\064\000\015\000\033\000\035\000\034\000\
\050\000\006\000\007\000\008\000\009\000\010\000\056\000\057\000\
\058\000\059\000\060\000\061\000\062\000\063\000\016\000\017\000\
\018\000\019\000\020\000\021\000\022\000\023\000\024\000\025\000\
\026\000\027\000\028\000\036\000\037\000\065\000\000\000\003\000"

let yycheck = "\008\000\
\029\000\014\001\015\001\032\000\036\000\037\000\015\000\016\000\
\017\000\018\000\019\000\020\000\021\000\022\000\023\000\024\000\
\001\000\022\001\000\000\048\000\013\001\013\001\023\001\013\001\
\033\000\016\001\017\001\018\001\019\001\020\001\039\000\040\000\
\041\000\042\000\043\000\044\000\045\000\046\000\001\001\002\001\
\003\001\004\001\005\001\006\001\007\001\008\001\009\001\010\001\
\011\001\012\001\013\001\021\001\021\001\050\000\255\255\023\001"

let yynames_const = "\
  AND\000\
  OR\000\
  ADD\000\
  SUB\000\
  MUL\000\
  DIV\000\
  LT\000\
  EQ\000\
  NOT\000\
  TRUE\000\
  FALSE\000\
  BOOL\000\
  INT\000\
  SET\000\
  IF\000\
  WHILE\000\
  CONST\000\
  VAR\000\
  EOF\000\
  SEMICOLON\000\
  LBRACKET\000\
  RBRACKET\000\
  "

let yynames_block = "\
  NUM\000\
  IDENT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'prog) in
    Obj.repr(
# 18 "src/parser.mly"
                (_1)
# 169 "parser_yacc.ml"
               : Ast.pROG))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'cmds) in
    Obj.repr(
# 22 "src/parser.mly"
                       ( Ast.Prog _2 )
# 176 "parser_yacc.ml"
               : 'prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stat) in
    Obj.repr(
# 25 "src/parser.mly"
                       ( Ast.Statement _1 )
# 183 "parser_yacc.ml"
               : 'cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'dec) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmds) in
    Obj.repr(
# 26 "src/parser.mly"
                       ( Ast.Declaration (_1,_3) )
# 191 "parser_yacc.ml"
               : 'cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'stat) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmds) in
    Obj.repr(
# 27 "src/parser.mly"
                       ( Ast.Statements (_1,_3) )
# 199 "parser_yacc.ml"
               : 'cmds))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'ttype) in
    Obj.repr(
# 30 "src/parser.mly"
                         ( Ast.Variable ((Ast.Ident _2),_3) )
# 207 "parser_yacc.ml"
               : 'dec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'ttype) in
    Obj.repr(
# 31 "src/parser.mly"
                         ( Ast.Const ((Ast.Ident _2),_3,_4) )
# 216 "parser_yacc.ml"
               : 'dec))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 34 "src/parser.mly"
                        ( Ast.Set ((Ast.Ident _2),_3) )
# 224 "parser_yacc.ml"
               : 'stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'prog) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'prog) in
    Obj.repr(
# 35 "src/parser.mly"
                        ( Ast.If (_2,_3,_4) )
# 233 "parser_yacc.ml"
               : 'stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'prog) in
    Obj.repr(
# 36 "src/parser.mly"
                  ( Ast.While (_2,_3) )
# 241 "parser_yacc.ml"
               : 'stat))
; (fun __caml_parser_env ->
    Obj.repr(
# 39 "src/parser.mly"
                        (Ast.Bool)
# 247 "parser_yacc.ml"
               : 'ttype))
; (fun __caml_parser_env ->
    Obj.repr(
# 40 "src/parser.mly"
        (Ast.Int)
# 253 "parser_yacc.ml"
               : 'ttype))
; (fun __caml_parser_env ->
    Obj.repr(
# 43 "src/parser.mly"
         (Ast.True)
# 259 "parser_yacc.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 44 "src/parser.mly"
          (Ast.False)
# 265 "parser_yacc.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 45 "src/parser.mly"
        (Ast.Num _1)
# 272 "parser_yacc.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 46 "src/parser.mly"
          (Ast.Id (Ast.Ident _1))
# 279 "parser_yacc.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'unop) in
    Obj.repr(
# 47 "src/parser.mly"
         (Ast.Unop _1)
# 286 "parser_yacc.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'binop) in
    Obj.repr(
# 48 "src/parser.mly"
          (Ast.Binop _1)
# 293 "parser_yacc.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 51 "src/parser.mly"
                        ( Ast.Not _2 )
# 300 "parser_yacc.ml"
               : 'unop))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 54 "src/parser.mly"
                 (Ast.And (_2,_3))
# 308 "parser_yacc.ml"
               : 'binop))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 55 "src/parser.mly"
                (Ast.Or (_2,_3))
# 316 "parser_yacc.ml"
               : 'binop))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 56 "src/parser.mly"
                 (Ast.Add (_2,_3))
# 324 "parser_yacc.ml"
               : 'binop))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 57 "src/parser.mly"
                 (Ast.Sub (_2,_3))
# 332 "parser_yacc.ml"
               : 'binop))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 58 "src/parser.mly"
                 (Ast.Mul (_2,_3))
# 340 "parser_yacc.ml"
               : 'binop))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 59 "src/parser.mly"
                 (Ast.Div (_2,_3))
# 348 "parser_yacc.ml"
               : 'binop))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 60 "src/parser.mly"
                (Ast.Lt (_2,_3))
# 356 "parser_yacc.ml"
               : 'binop))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 61 "src/parser.mly"
                 (Ast.Eq (_2,_3))
# 364 "parser_yacc.ml"
               : 'binop))
(* Entry start *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let start (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.pROG)
