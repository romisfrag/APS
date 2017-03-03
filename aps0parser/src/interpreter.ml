open Ast

exception Error of string
  
       
type value =
  | Int of int
  | Bool of bool
  | Null

type addr = int
      
type element =
  | Addr of addr
  | Valeur of value


	      
type environment = (iDENT*element) list

type memoire = (addr*value) list

type return = (value * environment * memoire)

                        
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
     then v
     else get_value_mem t addr
  | [] -> raise (Error "l'adresse n'existe pas")

    

(* ------------------------- environnement --------------------- *)

let rec equal (id1 : iDENT) (id2 : iDENT) =
  match (id1,id2) with
  | (Ident i1,Ident i2) -> i1 = i2
			    
		
	      
let rec get_value_env (env : environment) (id : iDENT) : element =
  match env with
  | [] -> raise (Error "ident is not declared")
  | (i,e)::t -> if equal id i then e
		      else get_value_env t id

		

(* ----------------------------------- eval expressions ----------------------------- *)
let rec eval_expr expr (env : environment) (mem : memoire) : (value*environment*memoire)=
  match expr with
  | True -> (Bool true,env,mem)
  | False -> (Bool false,env,mem)
  | Num i -> (Int i,env,mem)
  | Id i -> (eval_ident i env mem,env,mem)
  | Unop u -> eval_unop u env mem
  | Binop b -> eval_binop b env mem

(* THINKING :: it's not really ident it would be better if we call it VAR *)			  
and eval_ident (id : iDENT) (env : environment) (mem : memoire) =
  let elem = get_value_env env id in
  match elem with
  | Addr a -> get_value_mem mem a
  | Valeur v -> v
                  
		  
and eval_unop expr (env : environment) mem =
  match expr with
  | Not e -> match eval_expr e env mem with
              | (Bool b,_,_) -> (Bool(not b),env,mem)
              | _ -> failwith "probleme de type"
                           
and eval_binop expr (env : environment) (mem : memoire) =
  match expr with
  | And (e1,e2) -> 
     (match eval_expr e1 env mem with
      | (Bool a,_,_) -> if a then (match eval_expr e2 env mem with
				   | (Bool b,_,_) -> (Bool b,env,mem)
				   | _ -> failwith "type error")
			else (Bool false ,env,mem)
      | _ -> failwith "type error")
       
  | Or (e1,e2) ->
     (match eval_expr e1 env mem with
      | (Bool a,_,_) -> if a then (Bool true ,env,mem)
			else (match eval_expr e2 env mem with
			      | (Bool b,_,_) -> (Bool b,env,mem)
			      | _ -> failwith "type error") 
      | _ -> failwith "type error")
              
  | Add (e1,e2) ->
     (match eval_expr e1 env mem with
      | (Int a,_,_) -> (match eval_expr e2 env mem with
			| (Int b,_,_) -> (Int(a + b),env,mem)
			| _ -> failwith "type error")
      |  _ -> failwith "type error")
       
  | Sub (e1,e2) ->
     (match eval_expr e1 env mem with
      | (Int a,_,_) -> (match eval_expr e2 env mem with
		  | (Int b,_,_) -> (Int(a - b),env,mem)
		  | _ -> failwith "type error")
      |  _ -> failwith "type error")
       
  | Mul (e1,e2) ->
     (match eval_expr e1 env mem with
      | (Int a,_,_) -> (match eval_expr e2 env mem with
		  | (Int b,_,_) -> (Int(a * b),env,mem)
		   | _ -> failwith "type error")
      |  _ -> failwith "type error")
       
  | Div (e1,e2) ->
     (match eval_expr e1 env mem with
      | (Int a,_,_) -> (match eval_expr e2 env mem with
		  | (Int b,_,_) -> (Int(a / b),env,mem)
		  | _ -> failwith "type error")
      |  _ -> failwith "type error")
       
  | Lt (e1,e2) ->
     (match eval_expr e1 env mem with
      | (Int a,_,_) -> (match eval_expr e2 env mem with
		  | (Int b,_,_) -> (Bool(a < b),env,mem)
		  | _ -> failwith "type error")
      |  _ -> failwith "type error")
       
  | Eq (e1,e2) ->
     (match eval_expr e1 env mem with
      | (Int a,_,_) -> (match eval_expr e2 env mem with
		  | (Int b,_,_) -> (Bool(a = b),env,mem)
		  | _ -> failwith "type error")
      |  _ -> failwith "type error")


(* -------------------------------------- eval instructions -------------------------------- *)
       
and eval_stat ins (env : environment) (mem : memoire) : return =
  match ins with
  | Set (id,e) -> (match get_value_env env id with
		   | Addr a -> (match eval_expr e env mem with
				| (v,_,_) -> let new_mem = modif_value_mem mem a v in
					     (Null,env,new_mem))
		   | _ -> failwith "Set error : id is not an addr")
		    
  | If (e,blk1,blk2) -> (match eval_expr e env mem with
			 | (Bool true,_,_) -> (match eval_prog blk1 env mem with
					      | (_,_,new_mem) -> (Null,env,new_mem))
			 | (Bool false,_,_) -> (match eval_prog blk2 env mem with
						| (_,_,new_mem) -> (Null,env,new_mem))						 
			 | _ -> failwith "type error")

  | While(e,blk) -> (match eval_expr e env mem with
		     | (Bool true,_,_) -> (match eval_prog blk env mem with
					      | (_,_,new_mem) -> eval_stat ins env new_mem)
		     | (Bool false,_,_) -> (Null,env,mem)
		     | _ -> failwith "type error")
		      
(* -------------------------------------- eval declaration -------------------------------- *)
and eval_dec ins (env : environment) (mem : memoire) : return =
  match ins with
  | Variable (id,_) -> let new_mem = alloc_mem mem in
		       (match new_mem with
			| (a,_) :: suite -> (Null,((id,(Addr a))::env),new_mem)
			| _ -> failwith "eval_dec error supposed not to append, it might be because you change alloc_mem")
  | Const (id,e1,_) -> (match eval_expr e1 env mem with
			| (v,_,_) -> (Null,(id,(Valeur v))::env,mem))


(* ---------------------------------- suite de commandes ---------------------- *)
(* TODO :: dire qu'il y a une faute au prof pour la regle d'évaluations suite de cmds avec statement *)
and eval_cmds ins (env : environment) (mem : memoire) : return =
  match ins with
  | Statement s -> eval_stat s env mem		   
  | Statements (s,cs) -> (match eval_stat s env mem with
			  | (_,_,new_mem) -> eval_cmds cs env new_mem)
  | Declaration (d,cs) -> (match eval_dec d env mem with
			   | (_,new_env,new_mem) -> eval_cmds cs new_env new_mem)


(* ---------------------------------- prog -------------------------- ---------------------- *)
and eval_prog prog (env : environment) (mem : memoire) : return =
  match prog with
  | Prog cs -> eval_cmds cs env mem

			    
			 

		      
		      
					    
			  
     
     
  
