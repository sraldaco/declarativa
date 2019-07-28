% CONSULTAS

/* 
 * Ver consultas en el readme.txt
 */


% CRUCIGRAMA

palabra(astante,  a,s,t,a,n,t,e).
palabra(astoria,  a,s,t,o,r,i,a).
palabra(baratto,  b,a,r,a,t,t,o).
palabra(cobalto,  c,o,b,a,l,t,o).
palabra(pistola,  p,i,s,t,o,l,a).
palabra(statale,  s,t,a,t,a,l,e).

crucigrama(H1, H2, H3, V1, V2, V3) :-
	palabra(H1, _,A,_,B,_,C,_),palabra(H2, _,D,_,E,_,F,_),palabra(H3, _,G,_,H,_,I,_),
  palabra(V1, _,A,_,D,_,G,_),palabra(V2, _,B,_,E,_,H,_),palabra(V3, _,C,_,F,_,I,_),
  H1\=V1,H2\=V2,H3\=V3,!.

% MÁQUINA DE MONEDAS

%cambio(23,[10,5,2,1],R).
cambio(0,_,[]).
cambio(M,[X|Y], [X|Y1]):- M >= X, N is M-X, cambio(N,[X|Y],Y1).
cambio(M,[X|Y], L):- M < X, cambio(M,Y,L).