% To interpret such programs, we have to keep track of the state of 
% computation. It consists of:

%     the binding environment for variables
%     all encountered function definitions.

% These two, collectively referred to as the environment, are represented as a 
% pair of association lists, associating variable names with values, and 
% function heads with function bodies. This makes defining and referring to 
% functions as well as accessing variables O(log(N)) operations in the number 
% of encountered functions and variables, respectively.

% Clearly, the predicates responsible for interpreting syntax trees define 
% relations between such environments and thus between states. This is how we 
% interpret imperative programs in a purely declarative way.

% To evaluate expressions with respect to the current environment, we use the 
% predicate eval/3: 


eval(bin(Op,A,B), Env, Value) :-
        eval(A, Env, VA),
        eval(B, Env, VB),
        eval_(Op, VA, VB, Value).
eval(v(V), Env, Value) :-
        env_get_var(Env, V, Value).
eval(n(N), _, N).
eval(call(Name, Arg), Env0, Value) :-
        eval(Arg, Env0, ArgVal),
        env_func_body(Env0, Name, ArgName, Body),
        env_clear_variables(Env0, Env1),
        env_put_var(ArgName, ArgVal, Env1, Env2),
        interpret(Body, Env2, Value).


eval_(+, A, B, V) :- V #= A + B.
eval_(-, A, B, V) :- V #= A - B.
eval_(*, A, B, V) :- V #= A * B.
eval_(/, A, B, V) :- V #= A // B.
eval_(=, A, B, V) :- goal_truth(A #= B, V).
eval_(>, A, B, V) :- goal_truth(A #> B, V).
eval_(<, A, B, V) :- goal_truth(A #< B, V).

goal_truth(Goal, V) :- ( Goal -> V = 1 ; V = 0).