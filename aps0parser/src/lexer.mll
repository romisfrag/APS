{
  open Parser_yacc
  exception Eof
}
rule token = parse
|[ '\n' ' ' '\t' ]        { token lexbuf }	
|"and"		{AND}
| "or" 		{OR}
| "add"		{ADD}
| "sub" 	{SUB}
| "mul"		{MUL}
| "div" 	{DIV}
| "lt" 		{LT}
| "eq" 		{EQ}
| "not"		{NOT}
| "true" 	{TRUE}
| "false"	{FALSE}
| "bool"	{BOOL}
| "int" 	{INT}
| "SET"		{SET}
| "IF" 		{IF}
| "WHILE"	{WHILE}
| "CONST" 	{CONST}
| "VAR" 	{VAR}
| ';'		{SEMICOLON}
| '['		{LBRACKET}
| ']'		{RBRACKET}
| '('  		{LROUNDBRACKET}
| ')'		{RROUNDBRACKET}
| '-'?['0'-'9']+ as n {NUM(int_of_string n)}
| ['a'-'z''A'-'Z']['a'-'z''A'-'Z''0'-'9']* as s {IDENT s}
| eof 		{EOF}
| _ 		{failwith "unknown char"}
