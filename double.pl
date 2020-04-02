/*
% doubles the value in register x; y=0 initially:
   L1: sub1 x, L5
   L2: add1 y
   L3: add1 y
   L4: goto L1
   L5: sub1 y, L8
   L6: add1 x
   L7: goto L5
   L8: end

       % from L1:
p2(X, Y) :- p1(s(X), Y).
p5(0, Y) :- p1(0, Y).

       % from L2:
p3(X, s(Y)) :- p2(X, Y).

       % from L3:
p4(X, s(Y)) :- p3(X, Y).

       % from L4:
p1(X, Y) :- p4(X, Y).

       % from L5:
p6(X, Y) :- p5(X, s(Y)).
p8(X, 0) :- p5(X, 0).

       % from L6:
p7(s(X), Y) :- p6(X, Y).

       % from L7:
p5(X, Y) :- p7(X, Y).
*/

% initial value
p1(s(s(0)), 0) :- write('L1: [s(s(0)), 0]'), nl.

% Sort clauses by head and add trace messages.
       % from L4:
p1(X, Y) :- p4(X, Y), write('L1: '), write([X,Y]), nl.
       % from L1:
p2(X, Y) :- p1(s(X), Y), write('L2: '), write([X,Y]), nl.
       % from L2:
p3(X, s(Y)) :- p2(X, Y), write('L3: '), write([X,s(Y)]), nl.
       % from L3:
p4(X, s(Y)) :- p3(X, Y), write('L4: '), write([X,s(Y)]), nl.
       % from L1:
p5(0, Y) :- p1(0, Y), write('L5: '), write([0,Y]), nl.
       % from L7:
p5(X, Y) :- p7(X, Y), write('L5: '), write([X,Y]), nl.
       % from L5:
p6(X, Y) :- p5(X, s(Y)), write('L6: '), write([X,Y]), nl.
       % from L6:
p7(s(X), Y) :- p6(X, Y), write('L7: '), write([s(X),Y]), nl.
       % from L5:
p8(X, 0) :- p5(X, 0), write('L8: '), write([X,0]), nl. 

/*
GNU Prolog 1.4.5 (64 bits)
Compiled Feb 11 2019, 08:23:49 with gcc
By Daniel Diaz
Copyright (C) 1999-2019 Daniel Diaz
| ?- [doub].
[double].
compiling /mnt/nfs/clasnetappvm/fs3/hzhang/c188/doub.pl for byte code...
/mnt/nfs/clasnetappvm/fs3/hzhang/c188/doub.pl compiled, 26 lines read - 5072 bytes written, 23 ms

(2 ms) yes

?- p8(A, B).
p8(A, B).
L1: [s(s(0)), 0]
L2: [s(0),0]
L3: [s(0),s(0)]
L4: [s(0),s(s(0))]
L1: [s(0),s(s(0))]
L2: [0,s(s(0))]
L3: [0,s(s(s(0)))]
L4: [0,s(s(s(s(0))))]
L1: [0,s(s(s(s(0))))]
L5: [0,s(s(s(s(0))))]
L6: [0,s(s(s(0)))]
L7: [s(0),s(s(s(0)))]
L5: [s(0),s(s(s(0)))]
L6: [s(0),s(s(0))]
L7: [s(s(0)),s(s(0))]
L5: [s(s(0)),s(s(0))]
L6: [s(s(0)),s(0)]
L7: [s(s(s(0))),s(0)]
L5: [s(s(s(0))),s(0)]
L6: [s(s(s(0))),0]
L7: [s(s(s(s(0)))),0]
L5: [s(s(s(s(0)))),0]
L8: [s(s(s(s(0)))),0]

A = s(s(s(s(0))))
B = 0 ?

yes
*/
		   
