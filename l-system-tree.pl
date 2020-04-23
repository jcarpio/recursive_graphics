
/*
 l-system tree prolog

 Alphabet A, B
 
 A -> A, B
 B -> A

Example from:

https://www.rosettacode.org/wiki/Fractal_tree#Prolog

 
*/

fractal(Deep) :-
	new(D, window('Fractal')),
	send(D, size, size(800, 600)),
	drawTree(D, 400, 500, -90, Deep),
	send(D, open).
 
angleA(150.0).
angleB(150.0).
random(20).
 
drawTree(_D, _X, _Y, _Angle, 0).
 
drawTree(D, X1, Y1, Angle, Depth) :-
        angleA(AngA), angleB(AngB),
		random(Rnd), 
		RndA is random(Rnd),
		RndB is random(Rnd),
		RndAngA is RndA + AngA,
		RndAngB is RndB + AngB,
        X2 is X1 + cos(Angle * pi / RndAngA) * Depth * 10.0,
        Y2 is Y1 + sin(Angle * pi / RndAngB) * Depth * 10.0,
	new(Line, line(X1, Y1, X2, Y2, none)),
	send(D, display, Line),
	A1 is Angle - 30,
	A2 is Angle + 30,
	De is Depth - 1,
        drawTree(D, X2, Y2, A1, De),
        drawTree(D, X2, Y2, A2, De).
