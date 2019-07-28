member(X, [X|_]).
member(X, [_|Tail]) :- member(X, Tail).

conc([], L, L).
conc(L, [], L).
conc([X|L1], L2, [X|L3]) :- conc(L1, L2, L3).
add([], L, L).
add(L, [], L).
add(X, L, [X|L]).

del(X, [X|Tail], Tail).
del(_, [], []).
del(X, [Y|Tail], [Y|NewTail]) :- del(X, Tail, NewTail).

sublist(S, L) :- conc(_, L2, L), conc(S, _, L2).

% mezclaA([x,y,z],[1,2,3],X).
mezclaA(A,B,C) :- conc(A,B,C).

% mezclaB([x,y,z],[1,2,3],X).
mezclaB([X|[]],[Y|[]],L) :- add([[X,Y]],[],L).
mezclaB([X|L1],[Y|L2],[[X,Y]|Z]) :- mezclaB(L1,L2,Z).

% conjunto([1,2,3,3,foo,4,foo,[],5,[]],X).
conjunto([],[]).
conjunto([H|T],S):-member(H,T),!,conjunto(T,S).
conjunto([H|T],[H|S]):-conjunto(T,S).

% aplana([1,2,[3,4],[[a,b],c],foo,[]],X).
aplana([],[]).
aplana([[H|T]|R],S):-aplana([H|T],T1),aplana(R,R1),append(T1,R1,S),!.
aplana([[]|T],S):-aplana(T,S),!.
aplana([H|T],[H|S]):-aplana(T,S).


% encapsula([a,a,a,a,b,c,c,d,d,d,a,e],X).
encapsula([],[]):- !.
encapsula([X],[[X]]):- X \== [],!.
encapsula([X,Y|T],[[X|X1]|T1]) :- X = Y, encapsula([Y|T],[X1|T1]).
encapsula([X,Y|T],[[X],[Y|Y1]|T1]):- X \== Y, Y = Y1, encapsula(T,[Y1|T1]).
encapsula([X,Y|T],[[X]|T1]):- X \== Y, encapsula([Y|T],T1).

% codifica([a,a,a,a,b,c,c,d,d,d,a,e],X).
codifica(L,L2):-encapsula(L,L3), agrupa(L3,L2).
agrupa([],[]).
agrupa([[X|T]|Y],[c(N,X)|Y1]):- cuenta([X|T],N), agrupa(Y,Y1).
cuenta([],0).
cuenta([_|T],N):- cuenta(T,N2), N is N2 + 1.

% rango(3,7,L).
% rango(42,1,L).
rango(X,Y,[]):- X > Y,!.
rango(X,Y,[X|T]):- N is X + 1, rango(N,Y,T).  

% cambié random por rnd para usar random de prolog
% rnd(6,51,L).
rnd(N,_,[]):- N < 1, !.
rnd(N,M,[R|T]):- random(1,M,R), N1 is N-1, rnd(N1,M,T).

 %   numero,color,nacionalidad,mascota,bebida,comida
 
% mascota(conejo,Casa).
% Casa = 5 .
% bebe(agua,Persona).
% Persona = japones .
calle(Casas):-
    Casas = [[1,_,japones,_,_,_],[2,azul,_,_,_,_],[3,_,_,_,cerveza,_],[4,_,_,_,_,_],[5,_,_,_,_,_]],
    member([_,roja,mexicano,_,_,_],Casas),
    member([_,_,'familia española',tortuga,_,_],Casas),
    member([_,amarilla,_,_,_,sushi],Casas),
    member([_,_,_,gato,_,pasta],Casas),
    member([_,_,_,_,jugo,arroz],Casas),
    member([_,_,britanicos,_,te,_],Casas),
    member([_,_,alemanes,_,_,cerdo],Casas),
    member([_,verde,_,_,cafe,_],Casas),
    member([_,_,_,_,agua,_],Casas),
    member([_,_,_,conejo,_,_],Casas),
    vecino(Casas,[_,_,_,_,_,sushi],[_,_,_,caballo,_,_]),
    vecino_izq(Casas, [_,morada,_,_,_,_], [_,_,_,_,cafe,_]),
    vecino(Casas,[_,_,_,pez,_,_],[_,_,_,_,_,cordero]).
mascota(Mascota,Num):-calle(Casas),member([Num,_,_,Mascota,_,_],Casas).
bebe(Bebida,Persona):-calle(Casas),member([_,_,Persona,_,Bebida,_],Casas).
vecino_izq([H|[Ht|T]],VI,VD):-(H = VI,Ht = VD); vecino_izq([Ht|T],VI,VD).
vecino([H|T],V1,V2):-vecino_izq([H|T],V1,V2);vecino_izq([H|T],V2,V1).
    