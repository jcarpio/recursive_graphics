% https://rosettacode.org/wiki/Sierpinski_triangle/Graphical#Recursive_version

:- use_module(library(pce)).

% window(MaxX, MaxY).
window(690, 690).

my_fractal(N) :-
    window(MaxX, MaxY),
	sformat(A, 'My fractal dimension ~w - ~w x ~w', [N, MaxX, MaxY]),
	new(D, picture(A)),
	X is MaxX div 2, Y is MaxY div 2,
	draw_tree(D, N, point(X, Y), 10),
	send(D, size, size(MaxX,MaxY)),
	send(D, open).
	

	
	
	

 
