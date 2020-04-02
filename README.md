# Prolog Programs
Solutions of Logic in Computer Science problems in Prolog. Following are descriptions of implemented programs

## Insertion Sort: 
Implemention of the insertion sort, isort(X, Y), where X is a list of integers and Y is the result of sorting X.

## Selection Sort:
Implemention of the selection sort, ssort(X, Y), where X is a list of integers and Y is the result of sorting X.

## Propostional Formula to CNF (Conjunctive Normal Form):
Implementation of a Prolog program which converts a propositional formula into CNF. That is, provide an implementation of transCNF(X, Y) in Prolog, where X is a propositional formula and Y is the CNF equivalent formula to X.

## Generate Prolog Clauses:
Suppose the program M is written as a fact in Prolog format:

programM(

  [l(1, sub1(x, 5)),

   l(2, add1(y)),

   l(3, add1(y)),

   l(4, goto(1)),

   l(5, sub1(y, 8)),

   l(6, add1(x)),

   l(7, goto(5)),

   l(8, end)]).

Implementation of a Proglog program which takes the program M as input, and generates the clauses in Prolog format for the negation of the formula SM as follows:
prob3 :- programM(X), generate(X). 
where generate(X) will print out the clauses in Prolog format. Output can be compared with the prolog program in double.pl.



[Instructions to Run prolog program](https://www.swi-prolog.org/man/quickstart.html)
