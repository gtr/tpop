-- There are various ways to make this more efficient. We could, for example, 
-- prepend the new path elements and reverse the path once at the end of the 
-- search.

-- More importantly, we can also make it more elegant: Clearly, the code above 
-- contains some redundancy, which we can avoid with a different state 
-- representation. The following Prolog version illustrates this:

jug_capacity(a, 8).
jug_capacity(b, 5).
jug_capacity(c, 3).

moves(Jugs) -->
        { member(jug(a,4), Jugs),
          member(jug(b,4), Jugs) }.
moves(Jugs0) --> [from_to(From,To)],
        { select(jug(From,FromFill0), Jugs0, Jugs1),
          FromFill0 #> 0,
          select(jug(To,ToFill0), Jugs1, Jugs),
          jug_capacity(To, ToCapacity),
          ToFill0 #< ToCapacity,
          Move #= min(FromFill0, ToCapacity-ToFill0),
          FromFill #= FromFill0 - Move,
          ToFill #= ToFill0 + Move },
        moves([jug(From,FromFill),jug(To,ToFill)|Jugs]).
    