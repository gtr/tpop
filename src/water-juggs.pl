% Given water jugs A, B and C of respective capacities 8, 5 and 3 and 
% respective fill states full, empty and empty, measure exactly 4 units into 
% both A and B. successors :: State -> [State]

successors (a,b,c) =
    let ab = min a (5 - b)
        ac = min a (3 - c)
        ba = min b (8 - a)
        bc = min b (3 - c)
        ca = min c (8 - a)
        cb = min c (5 - b)
        ss = [(ab,a-ab,b+ab,c), (ac,a-ac,b,c+ac), (ba,a+ba,b-ba,c),
              (bc,a,b-bc,c+bc), (ca,a+ca,b,c-ca), (cb,a,b+cb,c-cb)]
    in
      [(a',b',c') | (transfer,a',b',c') <- ss, transfer > 0]

