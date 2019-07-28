:- ['SistemaExperto.pl'].
consulta/0.
consulta :-
    write('Bienvenido.'),nl,
    write('El sistema intentará realizar un diagnostico médico.'),nl,
    write('Por favor responda las siguientes preguntas con \'si\', \'no\', o \'porque\'.'),
    nl,nl.
    %hazdiagnostico(X).
%escribediagnostico(X),
%ofreceexplicaciondiagnostico(X),
%limpiamemoria.

consulta :-
write('No hay suficiente conocimiento para elaborar un diagnostico. ').
%limpiamemoria.
