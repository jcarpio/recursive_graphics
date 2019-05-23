% https://rosettacode.org/wiki/Sierpinski_triangle/Graphical#Recursive_version

:- use_module(library(pce)).

% window(MaxX, MaxY).
window(690, 690).

my_tree(N) :-
    window(MaxX, MaxY),
	sformat(A, 'My tree dimension ~w - ~w x ~w', [N, MaxX, MaxY]),
	new(D, picture(A)),
	starting_point(X,Y),
	draw_tree(D, N, [point(X,Y)], 120),
	send(D, size, size(MaxX,MaxY)),
	send(D, open).
	
starting_point(X, Y):- window(MaxX, MaxY), X is MaxX div 2, Y is MaxY - 10.	
	
draw_tree(_, 1, _, _).
	
draw_tree(Window, N, BranchesList, Length):-
  N > 1,
  N2 is N - 1,
  draw_branches(Window, BranchesList,NewBranches, Length),
  Length2 is Length * 0.8,
  draw_tree(Window, N2, NewBranches, Length2).
  
  
  
draw_branches(_, [], [], _).	
draw_branches(Window, [point(X,Y)|Tail], [point(X1,Y1), point(X2, Y1)|NewBranches], Length):-
    X1 is X - Length,
	Y1 is Y - Length,
	X2 is X + Length,
    send(Window, display, new(Pa, path)),
        (
	   send(Pa, append, point(X, Y)),
	   send(Pa, append, point(X1, Y1))
	),
	send(Window, display, new(Pa2, path)),
        (
	   send(Pa2, append, point(X, Y)),
	   send(Pa2, append, point(X2, Y1))
	),
    draw_branches(Window, Tail, NewBranches, Length).	

   
 

	
	
	

 
