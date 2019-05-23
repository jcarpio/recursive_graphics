
:- use_module(library(pce)).

ini :- new(@p, picture('Recursive Graphics 1')), send(@p, open).

play(1, X, Y):- send(P, display, new(P, point(X, Y))). 

play(N, X, Y):- N2 is N-1, play(N2, X, Y),
  X2 is X+N, Y2 is Y+N,
  send(C, display, new(C, circle(5)), point(X2,Y2)), free(@ci).