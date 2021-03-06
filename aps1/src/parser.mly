%token AND OR ADD SUB MUL DIV LT EQ
%token NOT
%token STAR ARROW DOUBLEDOT
%token TRUE FALSE
%token <int>NUM
%token <string> IDENT
%token BOOL INT
%token SET IF WHILE
%token CONST VAR
%token EOF
%token SEMICOLON
%token LBRACKET RBRACKET
%token RROUNDBRACKET LROUNDBRACKET
%start start
%type <Ast.pROG> start

%%

start:
prog EOF	       {$1}
;

prog:
  LBRACKET cmds RBRACKET { Ast.Prog $2 }
;
cmds:
| stat                 { Ast.Statement $1 }
| dec SEMICOLON cmds   { Ast.Declaration ($1,$3) }
| stat SEMICOLON cmds  { Ast.Statements ($1,$3) }
;
dec:
| VAR IDENT ttype        { Ast.Variable ((Ast.Ident $2),$3) }
| CONST IDENT ttype expr { Ast.Const ((Ast.Ident $2),$4,$3) }
;
stat:
| SET IDENT expr        { Ast.Set ((Ast.Ident $2),$3) }
| IF expr prog prog     { Ast.If ($2,$3,$4) }
| WHILE expr prog	{ Ast.While ($2,$3) }
;
ttypes:
| ttype			{Ast.Type $1}
| ttype STAR ttypes 	{Ast.Types ($1,$3)}
;
ttype:
| BOOL                  {Ast.Bool}
| INT			{Ast.Int}
| LROUNDBRACKET ttypes ARROW ttype RROUNDBRACKET 	{Ast.Fleche ($2,$4)}
;
arg:
| IDENT DOUBLEDOT ttype	{Ast.Argument ((Ast.Ident $1),$3)}
;
args:
| arg			{Ast.Arg $1}
| arg args 		{Ast.Args ($1,$2)}
;
exprs:
| expr			{Ast.Expr $1}
| expr exprs 		{Ast.Exprs ($1,$2)}
;
expr:
| TRUE			{Ast.True}
| FALSE			{Ast.False}
| NUM			{Ast.Num $1}
| IDENT 		{Ast.Id (Ast.Ident $1)}
| LBRACKET args RBRACKET expr				{Ast.Lambda ($2,$4)}
| LROUNDBRACKET exprs RROUNDBRACKET			{Ast.Application $2}
| LROUNDBRACKET unop RROUNDBRACKET			{Ast.Unop $2}
| LROUNDBRACKET binop RROUNDBRACKET 		{Ast.Binop $2}
;
unop:
| NOT expr              { Ast.Not $2 }
;
binop:
| AND expr expr		{Ast.And ($2,$3)}
| OR expr expr		{Ast.Or ($2,$3)}
| ADD expr expr		{Ast.Add ($2,$3)}
| SUB expr expr		{Ast.Sub ($2,$3)}
| MUL expr expr		{Ast.Mul ($2,$3)}
| DIV expr expr		{Ast.Div ($2,$3)}
| LT expr expr		{Ast.Lt ($2,$3)}
| EQ expr expr 		{Ast.Eq ($2,$3)}
;
