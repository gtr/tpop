
% There is a single language element, called a clause. A clause is of the form:

Head :- Body. 

% When programming in Prolog, think in terms of relations between entities. Your programs will become very general with this approach. In the above example, it is tempting to think and say "We are computing the length of a list". And yes, it is true: We can indeed use the above definition to compute the length of a list:

?- list_length([a,b,c], L).
   L = 3.
    

However, this imperative reading does not do justice to what we have actually implemented, because the definition also covers several additional usage patterns. For example, given a specific length, we can ask whether there are lists of that length:

?- list_length(Ls, 3).
   Ls = [_A,_B,_C]
% ;  false.
    

% Using the most general query, we can even ask for all answers that Prolog finds in general:

?- list_length(Ls, L).
%    Ls = [], L = 0
% ;  Ls = [_A], L = 1
% ;  Ls = [_A,_B], L = 2
% ;  Ls = [_A,_B,_C], L = 3
% ;  ...
    