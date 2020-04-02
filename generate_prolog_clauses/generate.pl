
%problem #3

generate(X):- program(X).

program([]).
program([H|T]):- print_prolog(H), program(T). 


print_prolog(l(1, sub1(x, 5))) :- write('p2(X, Y) :- p1(s(X), Y).'), nl, write('p5(0, Y) :- p1(0, Y).'), nl.
print_prolog(l(2, add1(y))) :- write('p3(X, s(Y)) :- p2(X, Y).'), nl.
print_prolog(l(3, add1(y))) :- write('p4(X, s(Y)) :- p3(X, Y).'), nl.
print_prolog(l(4, goto(1))) :- write('p1(X, Y) :- p4(X, Y).'), nl.
print_prolog(l(5, sub1(y, 8))) :- write('p6(X, Y) :- p5(X, s(Y)).'), nl, write('p8(X, 0) :- p5(X, 0).'), nl.
print_prolog(l(6, add1(x))) :- write('p7(s(X), Y) :- p6(X, Y).'), nl.
print_prolog(l(7, goto(5))) :- write('p5(X, Y) :- p7(X, Y).'), nl.
print_prolog(l(8, end)).