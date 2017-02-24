open Ast

exception Error of string
  
type ident = string
       
type value =
  | Int of int
  | Bool of bool
  | Null
       
type element =
  | Addr of int
  | Valeur of value

type addr = int
	      
type environnment = (ident*element) list

type mem = (addr*value) list

(* ------------------------- memoire --------------------- *)			  

let cpt_memoire = ref 0
let genere_addr x =
  x := !x + 1; !x
		
	  			
let alloc_mem mem  =
  ((genere_addr cpt_memoire),Null)::mem
  

let rec modif_value_mem mem addr value =
  match mem with
  | (a,v)::t ->
     if addr = a then (a,value)::t
     else modif t addr value
  | [] -> raise (Error "l'adresse n'existe pas")

let rec get_value_mem mem addr =
  match mem with
  | (a,v)::t ->
     if addr = a
     then (match v with
	   | Int i -> i
	   | Bool b -> b
	   | Null -> raise (Error "var is not initialised"))       
     else get_value t addr
  | [] -> raise (Error "l'adresse n'existe pas")

    

(* ------------------------- environnement --------------------- *)

	      
let rec get_value_env env id =
  match env with
  | [] -> raise (Error "ident is not declared")
  | (i,e)::t -> if id = i then e
		else get_value_env t id

(* ------------------------------------------------------------- *)

let rec eval_prog (p : pROG) =
  let prog_mem : mem = []
  and prog_env : env = []
  and c = match p with Prog c -> c
  in
  eval_cmds c prog_env prog_mem
	    
and eval_cmds c prog_env prog_mem =
  match c with
  | Statement s -> eval_statement s prog_env prog_mem
  | Statements (s,c) -> (eval_statement s prog_env prog_mem;
			 eval_cmds c prog_env prog_mem)
  |

	       
		
