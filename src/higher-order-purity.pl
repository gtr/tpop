% The call/N family of built-in predicates allow us to call Prolog partial goals dynamically. A partial goal is a term that denotes a Prolog goal to which zero or more arguments are added before it is called.

% The mechanism to invoke arbitrary Prolog goals dynamically is called meta-call, and it is the basic building block by which we can define arbitrary meta-predicates in Prolog.

% Importantly, the call/N family of predicates retain logical purity of the predicates they call.

% Like most meta-predicates, call/N could in principle be implemented in Prolog itself. For example, we could implement call/1 as follows, using one clause for each available predicate:

call(true).
call(X #= Y)  :- X #= Y.
call(call(G)


% The predicates maplist/2 and maplist/3 are among the most important and most frequently used meta-predicates. All widely used Prolog systems provide them as built-in or library predicates.
maplist(_, [], []).
maplist(Pred_2, [A|As], [B|Bs]) :-
        call(Pred_2, A, B),
        maplist(Pred_2, As, Bs).

% The foldl/N family of predicates describe a fold from the left of a list. You can think of a fold as a list traversal with intermediate states. An intermediate state becomes final when no more elements remain. 
% For example, consider the following relation between two integers and their sum:

integer_integer_sum(A, B, S) :- S #= A + B.
    