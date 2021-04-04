# CSE-4102
Lab works of Compiler Design Course.

-------
Lab-1:
-------

- lex <filename.l>                # Generate finite state machine file
- gcc lex.yy.c                    # Generate exe file
- gcc lex.yy.c -o b               # Generate exe file with name (say) b.exe
- b                               # Run
- b <input.txt> output.txt        # Run, but read & write from & to files

-------
Lab-2:
-------
** Push Down Automaton

- yacc <filename.y>                # Generate finite state machine file
- gcc 1.tab.c                      # Generate exe file
- b                                # Run

Source: https://silcnitc.github.io/yacc.

-------
Lab-3:
-------
** merge yacc and lex together.

- %option noyywrap                  # it helps not to write yywrap(){}
- Makefile is an automation file for running all files.