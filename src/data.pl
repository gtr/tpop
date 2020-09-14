% ach term is either a variable, an atomic term or a compound term:

% variables start with an uppercase letter or with an underscore (_). A single underscore denotes an anonymous variable and can be read as "any term". For example, X, Y, _爱 and Prolog are variables.
% atomic terms are:
%     atoms, such as x, test and 'quotes and space'
%     integers, such as 42
%     floating point numbers
%     depending on the Prolog system, there are also other kinds of atomic terms, such as complex numbers and rational numbers.
% compound terms are defined inductively as follows: If T1, T2, ..., TN are terms, then F(T1, T2, ..., TN) is also a term, where F is called a functor name and adheres to the same syntax rules as atoms. F/N is called the principal functor of the compound term, and N is called the arity. Examples: f(a), g(f(X)) and +(a, f(X)).
