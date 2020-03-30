% Logic operators:
% "-" is "negation"
% ", " is "and"
% "/" is "or"
% ">" is "implication"


transCNF(X, Y) :-  rewrite(X, Y).

% Declaration of 5 propositional variables:

rewrite(p,p).
rewrite(q,q).
rewrite(r,r).
rewrite(s,s).
rewrite(t,t).
rewrite(-p,-p).
rewrite(-q,-q).
rewrite(-r,-r).
rewrite(-s,-s).
rewrite(-t,-t).


rewrite((A>B), Y) :- !, rewrite(A,Y1), rewrite(B,Y2), rewrite((-Y1/Y2), Y).
rewrite(-(A>B), Y) :- !, rewrite(A, Y1), rewrite(B, Y2), rewrite((Y1, -Y2), Y).

rewrite((-A/B), Y) :- negate(A, Y1), rewrite((Y1/B), Y).
rewrite(((A)/(-B)), Y) :- negate(B, Y1), rewrite((A/Y1), Y).
rewrite(((-A)/(-B)), Y) :- negate(A, Y1), negate(B, Y2), rewrite((Y1/Y2), Y).
rewrite(-(-(A)), Y) :- negate(A, Y1), negate(Y1, Y2), rewrite(Y2, Y).

rewrite((-A, B), Y) :- negate(A, Y1), rewrite((Y1, B), Y).
rewrite((A, -B), Y) :- negate(B, Y1), rewrite((A, Y1), Y).
rewrite((-A, -B), Y) :- negate(A, Y1), negate(B, Y2), rewrite((Y1, Y2), Y).

rewrite(-(A/B), Y) :- !, rewrite(A, Y1), rewrite(B, Y2), rewrite((-Y1, -Y2), Y).
rewrite(-(A, B), Y) :- !, rewrite(A, Y1), rewrite(B, Y2), rewrite(((-Y1)/(-Y2)), Y).

rewrite((A/B), Y) :- rewrite(A, Y1), rewrite(B, Y2), finalize((Y1/Y2), Y).
rewrite((A, B), Y) :- rewrite(A, Y1), rewrite(B, Y2), finalize((Y1, Y2), Y).

finalize(((A, B)/(C, D)), ((A/C), (A/D), (B/C), (B/D))).
finalize(((A, B)/(C/D)), ((A, (B/C/D)))).
finalize((A/B), (A/B)).
finalize((A, B), (A, B)).

negate(-A/B, Y) :- rewrite((A, -B), Y).
negate(((A)/(-B)), Y) :- rewrite((-A, B), Y).
negate(A/B, Y) :- rewrite((-A, -B), Y).

negate((-A, B), Y) :- rewrite(((A)/(-B)), Y).
negate((A, -B), Y) :- rewrite((-A/B), Y).
negate((A, B), Y) :- rewrite(((-A)/(-B)), Y).
