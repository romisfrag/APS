open Ast


let rec printProgram p =
  match p with
  | Prog x -> "prog([" ^ printcMDS x ^ "])."
and printcMDS c =
  match c with 
  | Statement s -> printsTAT s
  | Statements (s,c) -> printsTAT s ^ "," ^ printcMDS c
  | Declaration (d,c) -> printdEC d ^ "," ^ printcMDS c
and printdEC d =
  match d with 
  | Variable (i,t) -> "var(" ^ (printiDENT i) ^ "," ^ printtYPE t ^ ")" 
  | Const (i,e,t) -> "const(" ^ (printiDENT i) ^ "," ^ printtYPE t ^ "," ^ printeXPR e ^ ")" 
and printsTAT s =
  match s with
  | Set(i,e) -> "set(" ^ (printiDENT i) ^ "," ^ printeXPR e ^ ")"
  | If(e,(Prog c1),(Prog c2)) -> "if(" ^ printeXPR e ^ ",[" ^ printcMDS c1 ^ "],[" ^ printcMDS c2 ^ "])"
  | While(e,(Prog c)) -> "while(" ^ printeXPR e ^ ",[" ^ printcMDS c ^ "])"
and printeXPR e =
  match e with
  | True -> "true"
  | False -> "false"
  | Num i -> string_of_int i
  | Id i -> printiDENT i
  | Unop u -> printuNOP u
  | Binop b -> printbINOP b
and printuNOP u =
  match u with   
  | Not e -> "not(" ^ printeXPR e ^ ")"
and printbINOP b =
  match b with
  | And(e1,e2) -> "and(" ^ printeXPR e1 ^ "," ^ printeXPR e2 ^ ")"
  | Or(e1,e2) -> "or(" ^ printeXPR e1 ^ "," ^ printeXPR e2 ^ ")"
  | Add(e1,e2) -> "add(" ^ printeXPR e1 ^ "," ^ printeXPR e2 ^ ")"
  | Sub(e1,e2) -> "sub(" ^ printeXPR e1 ^ "," ^ printeXPR e2 ^ ")"
  | Mul(e1,e2) -> "mul(" ^ printeXPR e1 ^ "," ^ printeXPR e2 ^ ")"
  | Div(e1,e2) -> "div(" ^ printeXPR e1 ^ "," ^ printeXPR e2 ^ ")"
  | Lt(e1,e2) -> "lt(" ^ printeXPR e1 ^ "," ^ printeXPR e2 ^ ")"
  | Eq(e1,e2) -> "eq(" ^ printeXPR e1 ^ "," ^ printeXPR e2 ^ ")"
and printtYPE t =
  match t with
  | Bool -> "bool"
  | Int -> "int"
and printiDENT i =
  match i with
  | Ident s -> s



let file = "files/test.aps"

let rec fulfill_string ic s: string =
  try 
    let line = input_line ic in
    fulfill_string ic (s ^ line)
  with e -> let _ = close_in_noerr in
	    s

			

    

    
  (*   let line = input_line ic in *)
  (*   print_endline line; *)
  (*   flush stdout; *)
  (*   close_in ic *)
  (* with e -> *)
  (*   close_in_noerr ic; *)
  (*   raise e *)
	     
		

let _ =
  if Array.length Sys.argv = 3
  then 
    (let ic = open_in Sys.argv.(1) in
     let s = fulfill_string ic "" in
    try
      let lexbuf = Lexing.from_string s in
      let result = Parser_yacc.start Lexer.token lexbuf  in
      let print_prog_res = printProgram result in
      let oc = open_out Sys.argv.(2) in
      Printf.fprintf oc "%s" print_prog_res;
      Printf.printf "%s" print_prog_res
	       with Lexer.Eof ->
		 Printf.printf "mdr")
			       (* while true do  *)
			       (*   let result = Parser_yacc.start Lexer.token lexbuf in       *)
			       (*   print_newline(); *)
			       (*   Printf.printf "%s xd" (printProgram result); *)
			       (*   print_newline(); *)
			       (*   flush stdout *)
      (*done *)
      
  else failwith "i need 1 arg : input file 2 arg : out lol"
