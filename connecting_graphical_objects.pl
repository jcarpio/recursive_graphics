:- use_module(library(pce)).
:- pce_global(@in_out_link, make_in_out_link).

make_in_out_link(L) :-
        new(L, link(in, out, line(arrows := second))).

linked_box_demo :-
        new(P, picture('Linked Box demo')),
        send(P, open),
        send(P, display, new(B1, box(50,50)), point(20,20)),
        send(P, display, new(B2, box(25,25)), point(100,100)),
        send(B1, handle, handle(w, h/2, in)),
        send(B2, handle, handle(w/2, 0, out)),
        send_list([B1, B2], recogniser, new(move_gesture)),
        send(B1, connect, B2, @in_out_link).