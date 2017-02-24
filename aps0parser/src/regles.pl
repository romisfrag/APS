% identificateur;

%list for functions c'est la fonction g(x) du cours


getTypeVar([(VAR,TYPE)|_],VAR,TYPE).
getTypeVar([_|TL],VAR,R) :- getTypeVar(TL,VAR,R).

% environnement



%--------------PROG--------------------------
%end of the file now


% ------------- EXPRESSION ----------------------------------------

/* typeExp(G,E,TYPE) :- env(G) */


% constante:
typeExp(_,true,bool).
typeExp(_,false,bool).
typeExp(_,V,int) :- integer(V).



% expression boolean
typeExp(G,or(E1,E2),bool) :- typeExp(G,E1,bool) , typeExp(G,E2,bool).
typeExp(G,and(E1,E2),bool) :- typeExp(G,E1,bool) , typeExp(G,E2,bool). 
typeExp(G,not(E),bool) :- typeExp(G,E,bool).

% type operation de comparaison
typeExp(G,eq(E1,E2), bool) :- typeExp(G,E1,int) , typeExp(G,E2,int).
typeExp(G,lt(E1,E2), bool) :- typeExp(G,E1,int) , typeExp(G,E2,int).

% type operation arithmetique
typeExp(G,add(E1,E2), int) :- typeExp(G,E1,int) , typeExp(G,E2,int).
typeExp(G,mul(E1,E2), int) :- typeExp(G,E1,int) , typeExp(G,E2,int).
typeExp(G,sub(E1,E2), int) :- typeExp(G,E1,int) , typeExp(G,E2,int).
typeExp(G,div(E1,E2), int) :- typeExp(G,E1,int) , typeExp(G,E2,int).

%variables
typeExp(G,IDENT,TYPE) :- getTypeVar(G,IDENT,TYPE).

%cas de base
typeExp(_,_,_) :- false.



% ------------- INSTRUCTION ---------------------------------------

typeStat(G,if(E1,CMDS1,CMDS2),void) :- typeExp(G,E1,bool), typeCmds(G,CMDS1,void),
				       typeCmds(G,CMDS2,void).
typeStat(G,set(IDENT, EXPR),void) :- getTypeVar(G,IDENT,R), typeExp(G,EXPR,R).
typeStat(G,while(E1,CMDS),void) :- typeExp(G,E1,bool), typeCmds(G,CMDS,void).


typeStat(_,_,_) :- false.				     




% ------------- COMMANDE ------------------------------------------

typeCmds(_,[],void).

typeCmds(G,[STAT],void) :- typeStat(G,STAT,void).
typeCmds(G,[var(IDENT,TYPE)|CMDS],void) :- typeCmds([(IDENT,TYPE)|G],CMDS,void).



typeCmds(G,[const(IDENT,TYPE,EXPR)|CMDS],void) :- typeExpr(G,EXPR,TYPE),
					    typeCmds([(IDENT,TYPE)|G],CMDS,void).
typeCmds(G,[STAT|CMDS],void) :- typeStat(G,STAT,void), typeCmds(G,CMDS,void).

typeCmds(_,_,_) :- false.





typeProg(prog(PROG),true) :- typeCmds([],PROG,void).
typeProg(_,false).

typeFile(F) :-
    open(F,read,IC),
    read(IC,T),
    typeProg(T,R),
    print(R),
    nl.


main([Args|_]):-
    %current_prolog_flags(argv[Args]),
    %atom_codes(Args,F),
    typeFile(Args),
    halt.
	
    
	 
 




