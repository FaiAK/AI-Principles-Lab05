% Male facts
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% Female facts
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent facts
parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).

parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).

% Father
father(X, Y) :-
    parent(X, Y),
    male(X).

% Mother
mother(X, Y) :-
    parent(X, Y),
    female(X).

% Son
son(X, Y) :-
    parent(Y, X),
    male(X).

% Daughter
daughter(X, Y) :-
    parent(Y, X),
    female(X).

% Brother
brother(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    male(X),
    X \= Y.

% Sister
sister(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    female(X),
    X \= Y.

% Grandfather
grandfather(X, Y) :-
    parent(X, Z),
    parent(Z, Y),
    male(X).

% Aunt
aunt(X, Y) :-
    sister(X, Z),
    parent(Z, Y).

% Uncle
uncle(X, Y) :-
    brother(X, Z),
    parent(Z, Y).

% Cousin
cousin(X, Y) :-
    parent(A, X),
    parent(B, Y),
    A \= B,
    parent(G, A),
    parent(G, B),
    X \= Y.

% Ancestor (base case)
ancestor(X, Y) :-
    parent(X, Y).

% Ancestor (recursive case)
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).
