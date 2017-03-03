LEX_ML = ocamllex
YACC_ML = ocamlyacc
OCAMLC = ocamlc


all: src/lexer.mll src/parser.mly src/main.ml src/ast.ml src/interpreter.ml
	$(OCAMLC) -o ast -c src/ast.ml

	$(LEX_ML) -o lexer.ml src/lexer.mll
	$(YACC_ML) -b parser_yacc src/parser.mly
	$(OCAMLC) -o parser_yacc.ml -c parser_yacc.mli
	$(OCAMLC) -o lexer -c lexer.ml
	$(OCAMLC) -o parser_yacc -c parser_yacc.ml
	$(OCAMLC) -o main lexer.cmo parser_yacc.cmo ast.cmo -c src/main.ml
	$(OCAMLC) -o interpreter lexer.cmo parser_yacc.cmo ast.cmo main.cmo src/interpreter.ml
	$(OCAMLC) -o exec lexer.cmo parser_yacc.cmo ast.cmo src/main.ml



clean:
	rm exec *.cmi *.cmo src/*.cmo src/*.cmi parser_yacc.ml parser_yacc.mli lexer.ml
