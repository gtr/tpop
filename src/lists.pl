
% Lists are defined inductively:

%     the atom [] is a list, denoting the empty list
%     if Ls is a list, then the term '.'(L, Ls) is also a list.

% There is a special syntax for denoting lists conveniently in Prolog:

%     The list '.'(a, '.'(b, '.'(c, []))) can also be written as [a,b,c].
%     The term '.'(L, Ls) can also be written as [L|Ls].

% These notations can be combined in any way. For example, the term [a,b|Ls] is a list iff Ls is a list.

% Lists naturally represent collections of elements and arise in almost all Prolog programs. When choosing between lists and any other way to represent collections of elements, ask yourself the following questions:

%     Can there be arbitrarily many elements?
%     Can there be zero elements?
%     Is the order of elements significant?
%     Are the elements of the same kind?''

% If your answer is "yes" to most of these questions, lists are often a good fit. 


list_length([], 0).
list_length([_|Ls], Length) :-
        Length #= Length0 + 1,
        list_length(Ls, Length0).




% Alternate

list_length(Ls, L) :-
        list_length_(Ls, 0, L).

list_length_([], L, L).
list_length_([_|Ls], L0, L) :-
        L1 #= L0 + 1,
        list_length_(Ls, L1, L).