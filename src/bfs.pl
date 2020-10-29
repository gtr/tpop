% Let us now determine whether we can, starting from the initial state, 
% actually reach the target state. We try breadth-first search, a complete and 
% space-inefficient search strategy: 

search :: [State] -> Bool
search (s:ss)
    | s == (4,4,0) = True
    | otherwise = search $ ss ++ successors s