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
| "set"		{SET}
| "if" 		{IF}
| "while"	{WHILE}
| "const" 	{CONST}
| "var" 	{VAR}
| ';'		{SEMICOLON}
| '['		{LBRACKET}
| ']'		{RBRACKET}
| '-'?['0'-'9']+ as n {NUM(int_of_string n)}
| ['a'-'z''A'-'Z']['a'-'z''A'-'Z''0'-'9']* as s {IDENT s}
| eof 		{EOF}
| _ 		{failwith "unknown char"}
