let _ =
  try
    let lexbuf = Lexing.from_channel stdin in
      while true do
        let result = Calc_yacc.main Calc_lex.token lexbuf in
          Printf.printf"Résultat: %f\n" result; print_newline(); flush stdout
      done
  with Calc_lex.Eof ->
    exit 0
