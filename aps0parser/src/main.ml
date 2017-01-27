open Ast

let printProgram p =
  match p with
  | Prog x -> "lol"


let _ =
  try
    let lexbuf = Lexing.from_channel stdin in
    while true do 
      let result = Parser_yacc.start Lexer.token lexbuf in      
      print_newline();
      Printf.printf "%s" (printProgram result) ;
      print_newline();
      flush stdout
    done
  with Lexer.Eof ->
    Printf.printf "test"
