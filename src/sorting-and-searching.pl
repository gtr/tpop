% keysort/2 in particular is much more useful than it may look at first. For example, let us sort the following lists by their lengths:

lists([[a,b,c,d],
       [a,b,c],
       [a,b,c,d,e],
       [a],
       [a,b]]).
    

quicksort([])	  --> [].
quicksort([L|Ls]) -->
        { partition(Ls, L, Smallers, Biggers) },
        quicksort(Smallers),
        [L],
        quicksort(Biggers).

% There is an intimate connection between Prolog and searching. First, Prolog's execution strategy is already a form of search. It is called depth-first search with chronological backtracking and can be regarded as a special case of resolution. Prolog is eminently well-suited for solving search tasks already due to this efficient built-in implementation of backtracking. Second, other search strategies can be readily implemented on top of the built-in strategy. For example, it is easy to obtain iterative deepening by restricting some aspects of the search. 

k_n(N, Adjs) :-
        list_length(Nodes, N),
        Nodes ins 1..N,
        all_distinct(Nodes),
        once(label(Nodes)),
        maplist(adjs(Nodes), Nodes, Adjs).

adjs(Nodes, Node, Node-As) :-
        tfilter(dif(Node), Nodes, As).

% In this concrete case, we can solve the task in a much more efficient way. For example, we can use Warshall's algorithm for computing the transitive closure, with code similar to: 

warshall(Adjs, Nodes0, Nodes) :-
        phrase(reachables(Nodes0, Adjs), Nodes1, Nodes0),
        sort(Nodes1, Nodes2),
        if_(Nodes2 = Nodes0,
            Nodes = Nodes2,
            warshall(Adjs, Nodes2, Nodes)).

reachables([], _) --> [].
reachables([Node|Nodes], Adjs) -->
        { member(Node-Rs, Adjs) },
        Rs,
        reachables(Nodes, Adjs).
    