type bINOP =
  | And of eXPR * eXPR
  | Or of eXPR * eXPR
  | Add of eXPR * eXPR
  | Sub of eXPR * eXPR
  | Mul of eXPR * eXPR
  | Div of eXPR * eXPR
  | Lt of eXPR * eXPR
  | Eq of eXPR * eXPR

 and uNOP =
   | Not of eXPR

 and iDENT =
   | Ident of string

 and eXPR =
   | True
   | False
   | Num of int
   | Id of iDENT
   | Unop of uNOP
   | Binop of bINOP
   | Lambda of aRGS * eXPR
   | Application of eXPRS
 and eXPRS =
   | Expr of eXPR
   | Exprs of eXPR * eXPRS
 and aRG =
   | Argument of iDENT * tYPE
 and aRGS =
   | Arg of aRG
   | Args of aRG * aRGS
 and tYPE =
   | Bool
   | Int
   | Fleche of tYPES * tYPE 
 and tYPES =
   | Type of tYPE
   | Types of tYPE * tYPES
 and sTAT =
   | Set of iDENT * eXPR
   | If of eXPR * pROG * pROG
   | While of eXPR * pROG

 and dEC =
   | Variable of iDENT * tYPE
   | Const of iDENT * eXPR * tYPE

 and cMDS =
   | Statement of sTAT
   | Statements of sTAT * cMDS
   | Declaration of dEC * cMDS

 and pROG =
   | Prog of cMDS

