% type:
type(int).
type(bool).
type(void).
type(undef).

% identificateur;


% environnement


% ------------- EXPRESSION ----------------------------------------

/* typeExp(G,E,TYPE) :- env(G) */

% constante:
typeExp(_,true,bool).
typeExp(_,false,bool).
typeExp(_,V,int) :- integer(V).

% operation boolean
typeExp(G,or(E1,E2),bool) :- typeExp(G,E1,bool) , typeExp(G,E2,bool).
typeExp(G,and(E1,E2),bool) :- typeExp(G,E1,bool) , typeExp(G,E2,bool). 
typeExp(G,not(E),bool) :- typeExp(G,E,bool).

% type operation de comparaison
typeExp(G,eq(E1,E2), bool) :- typeExp(G,E1,int) , typeExp(G,E2,int).

% type operation arithmetique
typeExp(G,add(E1,E2), int) :- typeExp(G,E1,int) , typeExp(G,E2,int).
typeExp(G,mul(E1,E2), int) :- typeExp(G,E1,int) , typeExp(G,E2,int).
typeExp(G,sub(E1,E2), int) :- typeExp(G,E1,int) , typeExp(G,E2,int).
typeExp(G,div(E1,E2), int) :- typeExp(G,E1,int) , typeExp(G,E2,int).

% ------------- DECLARATION ---------------------------------------
/*
typeDec(G,var(X,E1,TYPE),void) :- typeExp(G,E1,TYPE) , type(TYPE).
typeDec(G,const(X,E1,TYPE),void) :- tpeExp(G,E1,TYPE) , type(TYPE).

% ------------- INSTRUCTION ---------------------------------------

typeStat(G,if(E1,BLK1,BLK2),void) :- typeExp(G,E1,bool) ,

% ------------- COMMANDE ------------------------------------------

typeCmds(G,[T|Q],void) :- typeExp(G,T,_) , typeCmds(G,Q,void).
typeCmds(G,[T|Q],void) :- typeStat(G,T,_) , typeCmds(G,Q,void).

% ------------- COMMANDE ------------------------------------------
*/
