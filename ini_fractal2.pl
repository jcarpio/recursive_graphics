% https://rosettacode.org/wiki/Sierpinski_triangle/Graphical#Recursive_version

:- use_module(library(pce)).

% window(MaxX, MaxY).
window(690, 690).

my_fractal(N) :-
    window(MaxX, MaxY),
	sformat(A, 'My fractal dimension ~w - ~w x ~w', [N, MaxX, MaxY]),
	new(D, picture(A)),
	X is MaxX div 2, Y is MaxY div 2,
	draw_fractal1(D, N, point(X, Y), 5),
	send(D, size, size(MaxX,MaxY)),
	send(D, open).
	
draw_fractal1(Window, 1, point(X, Y), Len) :-
	X1 is X + Len,
	Y1 is Y - Len,
	Color is 30,
	send(Window, display, new(Pa, path)),
        (
	   send(Pa, append, point(X, Y)),
	   send(Pa, append, point(X1, Y)),
	   send(Pa, append, point(X1, Y1)),
	   send(Pa, append, point(X, Y1)),
	   send(Pa, closed, @on),
	   send(Pa, fill_pattern,  colour(@default, 0, 0, Color))
	).
	
draw_fractal1(Window, N, point(X, Y), Len) :-
    N > 1,
    N2 is N-1,
	Color is (N*30 div 255),

    X11 is X + Len,
	Y11 is Y - Len,
    send(Window, display, new(Pa, path)),
        (
	   send(Pa, append, point(X, Y)),
	   send(Pa, append, point(X11, Y)),
	   send(Pa, append, point(X11, Y11)),
	   send(Pa, append, point(X, Y11)),
	   send(Pa, closed, @on),
	   send(Pa, fill_pattern,  colour(@default, 0, 0, Color))
	),

	X1 is X - (N2 * Len + 1) ,
	Y1 is Y - ( N2 * Len + 1),
	X2 is X + (N2 * Len + 1),
	Y3 is Y + (N2 * Len + 1),
	draw_fractal1(Window, N2, point(X1, Y1), Len),
	draw_fractal1(Window, N2, point(X2, Y1), Len),
	draw_fractal1(Window, N2, point(X2, Y3), Len),
	draw_fractal1(Window, N2, point(X1, Y3), Len).

	
	
	

 
