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
     else modif_value_mem t addr value
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
(*
let rec eval_prog (p : pROG) env mem =
(* ca c'est faux *)
  and c = match p with Prog c -> c
  in
  eval_cmds c env mem
	    
and eval_cmds c env mem =
  match c with
  | Statement s -> eval_statement s env mem
  | Statements (s,c) -> (eval_statement s prog_env prog_mem;
			 eval_cmds c prog_env prog_mem)
  |
    *)
	       
		


let rec eval_expr expr env mem =
  match expr with
  | True -> Bool true
  | False -> Bool false
  | Num i -> Int i
  | Ident id ->
     
  | Unop u -> eval_unop u env mem
  | Binop b -> eval_binop b env mem

and eval_ident id env mem =
  let elem = get_value_env env id in
  match elem with
  | Addr a -> get_value_mem mem a in
  | Valeur i -> i
                 

and eval_unop expr env mem =
  match expr with
  | Not e -> (let res =eval_expr e env mem in
              match res with
              | Bool b -> if b then Bool false else Bool true
              | _ -> raise (Error "probleme de type)
                                   
(** cette fonction renvoie un int ou un bool 
faut peut etre creer un type constante non ou un type res ? 
 **)
and eval_binop expr env mem =
  match expr with
  | And (e1,e2) -> 
     if eval_expr e1 env mem
     then eval_expr e2 env mem
     else Bool false
  | Or (e1,e2) ->
     if eval_expr e1 env mem
     then 
     else eval_expr e2 env mem
  | Add (e1,e2) ->
     (eval_expr e1 env mem) + (eval_expr e2 env mem)
  | Sub (e1,e2) ->
     (eval_expr e1 env mem) - (eval_expr e2 env mem)
  | Mul (e1,e2) ->
     (eval_expr e1 env mem) * (eval_expr e2 env mem)
  | Div (e1,e2) ->
     (eval_expr e1 env mem) / (eval_expr e2 env mem)
  | Lt (e1,e2) ->
     (eval_expr e1 env mem) < (eval_expr e2 env mem)
  | Eq (e1,e2) ->
     (eval_expr e1 env mem) == (eval_expr e2 env mem)
                             
and eval_stat ins env mem =
  match ins with
  | Set (id,e) ->
     (let addr = get_value_env env id
      and value = eval_expr e env mem in
      match addr with
      | Addr a -> modif_value_mem mem addr value
      | Valeur i -> raise (Error "try to modifie a constant"))
  | If (e,blk1,blk2) ->
     if eval_expr e env mem
     then eval_prog
     
  
