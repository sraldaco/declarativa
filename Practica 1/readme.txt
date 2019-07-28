1. (0.5 puntos) ¿Es cierto que Luis XIII que vivió entre 1601 y 1643 es el hijo de Enrique IV y María de Médicis?.
  R. Es cierto:
  ?- hijo(louis13,X).
  X = henri4 ;
  X = marie_medicis.

2.  (0.5 puntos) Listado de los hijos de Enrique IV.
  R.
  ?- hijo(X,henri4).
  X = louis13 ;
  X = elisabeth_France ;

3.  (0.5 puntos) ¿Quiénes son los padres de Luis XIV?.
  R. Louis XIII padre y Anne Autriche madre, por el orden en que están acomodados en bio.
  ?- hijo(louis14,X).
  X = louis13 ;
  X = anne_autriche.

4. (0.5 puntos) Listado de personajes nacidos entre 1750 y 1800.
  R.
  ?- bio(X,_,N,_,_,_) , N >= 1750 , 1800 >= N.
  X = louis16,
  N = 1754 ;
  X = louis18,
  N = 1755 ;
  X = charles10,
  N = 1757 ;
  X = clotilde,
  N = 1759 ;
  X = louis17,
  N = 1785 ;
  X = louis_philippe1,
  N = 1773.

5. (0.5 puntos) Listado de personajes no nacidos entre 1750 y 1800.
  R.
  ?- bio(X,_,N,_,_,_) , (N < 1750 ; 1800 < N).
  X = louis13,
  N = 1601 ;
  X = elisabeth_France,
  N = 1603 ;
  X = marie_therese_Autriche,
  N = 1638 ;
  X = louis14,
  N = 1638 ;
  X = grand_dauphin,
  N = 1661 ;
  X = louis_bourbon,
  N = 1682 ;
  X = philippe5,
  N = 1683 ;
  X = louis15,
  N = 1710 ;
  X = louis_dauphin,
  N = 1729 ;
  X = philippe1,
  N = 1640 ;
  X = philippe2,
  N = 1674 ;
  X = louis_orleans,
  N = 1703 ;
  X = louis_philippe,
  N = 1725 ;
  X = philippe_egalite,
  N = 1747 ;

6. (1 punto) Listado de los descendientes de Luis XIV.
  R.
  ?- descendiente(X,louis14).
  X = grand_dauphin ;
  X = louis_bourbon ;
  X = philippe5 ;
  X = louis15 ;
  X = louis_dauphin ;
  X = louis16 ;
  X = louis18 ;
  X = charles10 ;
  X = clotilde ;
  X = louis17 ;
