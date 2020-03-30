swap(H, [], H, []).
 
swap(H, L, H1, L1) :-
	min_list(L, H2),
	(   H < H2
	->  H1 = H, L1 = L
	;   H1 = H2,
	    nth0(Ind, L, H1, L2),
	    nth0(Ind, L1, H, L2)).
		
ssort([], []).
ssort([H | L], [H1 | L2]) :-
	swap(H, L, H1, L1),
	ssort(L1, L2).