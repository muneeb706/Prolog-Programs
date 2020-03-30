isort([],[]).
isort([H|T], L1) :- isort(T, L2), insert(H, L2, L1).
insert(A, [], [A]).
insert(A1, [B|L3], [A1,B|L3]) :- A1 =< B.
insert(A2, [B1|L4],[B1|L5]) :- B1 < A2, insert(A2,L4,L5).