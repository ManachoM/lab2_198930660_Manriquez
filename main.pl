/*
LABORAORIO 2 - PARADIGMAS DE PROGRAMACION
RUT: 19.893.066-0
Manuel Ignacio Manriquez
Este documento contiene el desarrollo del laboratorio 2 de la asignatura Paradigmas de Programacion


Dominios: 
    Id, N, M, D, Angle, X, Y, Vida, Score, T, Member, MoveDir, Seed: Numeros positivos
    State: string
    Eq1, Eq2: lista con personajes
    Pr: proyectil segun su representacion
    Pos, PosCaida: par de numeros, representan posicion X,Y
    
    Hay ciertos elementos de dominio que estan representados por su estructura, por lo cual se explicita en la seccion de predicados que es exactamente lo que entra a cada predicado

Predicados: 
    escenario, personaje, proyectil ---> Son TDA, se explicitan mas adelante
    compararListas(Lista 1, Lista 2)
    generarX(Lista de personajes, lista con posiciones X)
    generarPos(lista de personajes, lista con posiciones [X,Y])
    replace(elemento a reemplazar, elemento nuevo, lista antigua, lista con el elemento reemplazado)
    esMiembro(elemento del cual se estudia pertenencia, lista en la cual se estudia)
    seRepite(lista de elementos en la que se estudia la repeticion de elementos)
    largoLista(lista en cuestion, valor de su largo)
    posCaida(proyectil que se estudia, posicion en la cual intersecta con el suelo de la forma [X,Y])
    quedanVivos(lista con personajes)
    cuantosMuertos(lista con personajes, numero de personajes con vida igual a cero)
    state(lista con personajes del jugador, lista con personajes del PC, string que contiene el estado de la partida)
    score(lista con personajes del jugador, lista con personajes del PC, entero que representa el puntaje de la partida)
    quienDispara(lista con personajes, lista con estructura de personaje)
    shootBack(escenario inicial, escenario actualizado tras disparo del PC)
    createScene(cantidad de filas, cantida de columnas, cantidad de enemigos, dificultad, semilla, escenario en su representacion)
    checkScene(representacion de escenario)
    moveMember(escena inicial, posicion de personaje a mover en lista de equipo (parte de 0), cantidad a mover, semilla, escenario de salida)
    shoot(escenario de entrada, posicion del personaje que realiza disparo, tipo de disparo (es irrelevante, hay un solo tipo), angulo de disparo en radianes, semilla, escenario de salida)
    updateScene(escenario de entrada, semilla, escenario actualizado a t+1)
    play(escenario de entrada, posicion en lista de personaje que realizara accion, cantidad y sentido de movimiento, tipo de disparom (irrelevante), angulo en radianes, semilla, escenario de salida)

METAS
    Primarias o Principales: createScene, checkScene, moveMember, shoot, updateScene, play
    Secundarias: TDA y predicados asociados, escenario, compararListas, generarX, generarPos, replace, esMiembro, seRepite, largoLista, posCaida, quedanVivos, cuantosMuertos, state, score, quienDispara, shootBack


*/
%CLAUSLAS


%Base de conocimientos
%escenario(Id, N, M, Eq1, Eq2, P, [Lista con representacion]).
escenario(1, 5, 10, [[1, 2, 1], [2, 2, 1], [3, 2, 1]], [[8, 2, 1], [9, 2, 1]], [], 1, "PLAYING", 0,[1, 5, 10, [[1, 2, 1], [2, 2, 1], [3, 2, 1]], [[8, 2, 1], [9, 2, 1]], [], 1, "PLAYING", 0]).
escenario(2, 5, 10, [[2, 4, 1], [3, 4, 1], [4, 4, 1]], [[7, 4, 1], [8, 4, 1], [9, 4, 1], [10, 4, 1]], [], 2, "PLAYING", 0,[2, 5, 10, [[2, 4, 1], [3, 4, 1], [4, 4, 1]], [[7, 4, 1], [8, 4, 1], [9, 4, 1], [10, 4, 1]], [], 2, "PLAYING", 0]).
escenario(3, 5, 10, [[1, 1, 1], [3, 1, 1], [5, 1, 1]], [[6, 1, 1], [7, 1, 1], [8, 1, 1], [9, 1, 1], [10, 1, 1]], [], 3, "PLAYING", 0,[3, 5, 10, [[1, 1, 1], [3, 1, 1], [5, 1, 1]], [[6, 1, 1], [7, 1, 1], [8, 1, 1], [9, 1, 1], [10, 1, 1]], [], 3, "PLAYING", 0]).
escenario(4, 10, 12, [[2, 5, 1], [4, 5, 1], [6, 5, 1]], [[8, 5, 1], [9, 5, 1], [10, 5, 1], [11, 5, 1]], [], 2, "PLAYING", 0,[4, 10, 12, [[2, 5, 1], [4, 5, 1], [6, 5, 1]], [[8, 5, 1], [9, 5, 1], [10, 5, 1], [11, 5, 1]], [], 2, "PLAYING", 0]).
escenario(5, 10, 12, [[1, 7, 1], [2, 7, 1], [4, 7, 1]], [[5, 7, 1], [6, 7, 1], [8, 7, 1], [9, 7, 1], [10, 7, 1], [12, 7, 1]], [], 3, "PLAYING", 0, [5, 10, 12, [[1, 7, 1], [2, 7, 1], [4, 7, 1]], [[5, 7, 1], [6, 7, 1], [8, 7, 1], [9, 7, 1], [10, 7, 1], [12, 7, 1]], [], 3, "PLAYING", 0]).
escenario(6, 20, 20, [[2, 12, 1], [5, 12, 1], [7, 12, 1]], [[10, 12, 1], [12, 12, 1], [13, 12, 1], [14, 12, 1], [15, 12, 1], [17, 12 , 1], [18, 12 , 1], [19, 12, 1]], [], 3, "PLAYING", 0,[6, 20, 20, [[2, 12, 1], [5, 12, 1], [7, 12, 1]], [[10, 12, 1], [12, 12, 1], [13, 12, 1], [14, 12, 1], [15, 12, 1], [17, 12 , 1], [18, 12 , 1], [19, 12, 1]], [], 3, "PLAYING", 0]).



%TDA: Escenario
%Representacion:  [ID; N; M; [Listas de personajes del jugador]; [Lista de personajes del computador]; [Par ordenado que da trayectoria de proyectil]; Dificultad; State; Score;]
%Personaje: [X; Y; Vida]
%Dominios:
    %ID: Entero que representa al tablero
    %N, M: entero positivo, filas y columnas, respectivamente, del tablero en cuestion
    %Lista de personajes del jugador: lista que contiene datos tipo personaje que pertenecen al equipo del jugador
    %Lista de personajes del computador: lista que contiene datos tipo personaje que pertenecen al equipo del computador
    %Par que contiene coordenadas de proyectil, de existir uno.
    %Dificultad: entero que representa la dificultad
    %State: string que refleja el estado del escenario
    %Score: entero que muestra quien va ganando
%Predicado constructor
escenario(Id, N, M, Eq1, Eq2, Pr, D, State, Score, Scene):- Scene=[Id, N, M, Eq1, Eq2, Pr, D, State, Score].
%Se considera predicado de pertenencia checkScene, es requerimiento funcional por lo que se encuentra mas abajo
%Predicados selectores
getIdEscena(Scene, Id):- nth0(0, Scene, Id).
getNEscenario(Scene, N):-nth0(1, Scene, N).
getMEscenario(Scene, M):-nth0(2, Scene, M).
getEq1Escenario(Scene, Eq1):-nth0(3, Scene, Eq1).
getEq2Escenario(Scene, Eq2):- nth0(4, Scene, Eq2).
getPrEscenario(Scene, Pr):- nth0(5, Scene, Pr).
getDEscenario(Scene, D):- nth0(6, Scene, D).
getStateEscenario(Scene, State):- nth0(7, Scene, State).
getScoreEscenario(Scene, Score):- nth0(8, Scene, Score).

%TDA: Proyectil
%Representacion: [Posicion X inicial, Posicion Y inicial, Tiempo, Angle]
%Dominios: Todos los elementos son enteros positivos
%Predicado constructor
proyectil(X,Y,T,Angle, P):-T>=0, Angle>=0, P=[X,Y,T,Angle].
%Predicados selectores
getXPr(P, X):- nth0(0, P, X).
getYPr(P, Y):- nth0(1, P, Y).
getTPr(P, T):- nth0(2, P, T).
getAnglePr(P, Angle):- nth0(3, P, Angle).
%Predicados modificadores
setXPr(Pin, NewX, Pout):- getYPr(Pin, Y), getTPr(Pin, T), getAnglePr(Pin, Angle), proyectil(NewX, Y, T, Angle, Pout).
setYPr(Pin, NewY, Pout):- getXPr(Pin, X), getTPr(Pin, T), getAnglePr(Pin, Angle), proyectil(X, NewY, T, Angle, Pout).
setTPr(Pin, NewT, Pout):- getXPr(Pin, X), getYPr(Pin, Y), getAnglePr(Pin, Angle), proyectil(X, Y, NewT, Angle, Pout).
%Otros predicados, uno que inicializa proyectil y otro que calcula su posicion en un tiempo T.
updatePr(Pin, T, Pos):-getXPr(Pin, X), getYPr(Pin, Y),getAnglePr(Pin, Angle), NewX is round(X+(6*cos(Angle)*T)), NewY is round(Y+(6*sin(Angle)*T - 2.5*T*T)), Pos=[NewX, NewY].
initPr(Personaje, Angle,Pout):- getXPersonaje(Personaje, X), getYPersonaje(Personaje, Y), Angle>0, proyectil(X, Y, 0, Angle, Pout).


%TDA: Personaje
%Representacion: [Posicion X, Posicion Y, Vida]
%Dominios: X, Y y Vida son todos enteros positivos
%Predicado constructor
personaje(X, Y, V, Personaje):- X>0, Y>0, V > -1, Personaje = [X,Y,V].
%Predicado de pertenencia
esPersonaje(Personaje):- nth0(0, Personaje, X), nth0(1, Personaje, Y), nth0(2, Personaje, V), X > 0, Y > 0, V > -1.
%Predicados selectores
getXPersonaje(Personaje, X):- nth0(0, Personaje, X).
getYPersonaje(Personaje, Y):- nth0(1, Personaje, Y).
getVidaPersonaje(Personaje, V):- nth0(2, Personaje, V).
%Predicados modificadores
setXPersonaje(NewX, Personaje, NewPersonaje):- NewX>0, getYPersonaje(Personaje, Y), getVidaPersonaje(Personaje, V), personaje(NewX, Y, V, NewPersonaje).
setYPersonaje(NewY, Personaje, NewPersonaje):- NewY>0, getXPersonaje(Personaje, X), getVidaPersonaje(Personaje, V), personaje(X, NewY, V, NewPersonaje).
setVidaPersonaje(NewV, Personaje, NewPersonaje):- NewV > -1, getXPersonaje(Personaje, X), getYPersonaje(Personaje, Y), personaje(X, Y, NewV, NewPersonaje).




%Reglas con sus respectivos casos bases
%Reglas auxiliares, o metas secundarias
compararListas([A], [B]):- A=B.
compararListas([X|Xs], [Y|Ys]):- X=Y, compararListas(Xs, Ys). 

generarX([[X, _, 1]], [X]).
generarX([[X,_,1]|Resto], [X|Y]):-generarX(Resto, Y).

generarPos([[X, Y, 1]], [[X,Y]]).
generarPos([[X,Y,1]|Cola], [[X,Y]|Resto]):- generarPos(Cola, Resto).
generarPos([[_,_,0]|Cola], Pos):- generarPos(Cola, Pos).

replace(_, _, [], []).
replace(O, R, [O|T], [R|T2]) :- replace(O, R, T, T2).
replace(O, R, [H|T], [H|T2]) :- H \= O, replace(O, R, T, T2).

esMiembro(M, [M|_]).
esMiembro(M, [M]).
esMiembro(M, [L|Ls]):- esMiembro(M, Ls) ; M=L.

seRepite([M, M]).
seRepite([L|Ls]):- esMiembro(L, Ls) ; seRepite(Ls).

largoLista([], 0).
largoLista([_|Xs], N):- largoLista(Xs, N1), N is N1+1.

posCaida(Pr, Pos):- getAnglePr(Pr, Angle), Tmax is (2.4*sin(Angle)), updatePr(Pr, Tmax, Pos).

quedanVivos([[_,_,1]]).
quedanVivos([[_,_,1]|_]).
quedanVivos([_|Cs]):- quedanVivos(Cs).

cuantosMuertos([Personaje], Res):- getVidaPersonaje(Personaje, R), R is 0, Res is 1; Res is 0.
cuantosMuertos([Cabeza|Cola], Res):- cuantosMuertos([Cabeza], R1), cuantosMuertos(Cola, R2), Res is R1+R2.

state(Eq1, Eq2, State):- 
    quedanVivos(Eq1),
    quedanVivos(Eq2),
    State="PLAYING";
    quedanVivos(Eq1),
    not(quedanVivos(Eq2)),
    State="VICTORY";
    not(quedanVivos(Eq1)),
    quedanVivos(Eq2),
    State="DEFEAT";
    State="DRAW".

score(Eq1, Eq2, Score):- cuantosMuertos(Eq2, S1), cuantosMuertos(Eq1, S2), Score is S1-S2.

quienDispara([[A,B,1]], Pos):- Pos = [A,B,1].
quienDispara([[_,_,0]], Pos):- Pos = [0,0,0].
quienDispara([[X,Y,1]|_], Pos):- Pos = [X,Y,1].
quienDispara([[_,_,0]|Cola], Pos):- quienDispara(Cola, Pos).

shootBack(SceneIn, SceneOut):-
    getNEscenario(SceneIn, N),
    getMEscenario(SceneIn, M),
    getEq1Escenario(SceneIn, Eq1),
    getEq2Escenario(SceneIn, Eq2),
    getDEscenario(SceneIn, D),
    quienDispara(Eq2, Prje),
    random(1.5707963, 3.1415926, Angle),
    initPr(Prje, Angle, Pr),
    generarPos(Eq1, X1),
    posCaida(Pr, Pos),
    member(Pos, X1),
    nth0(0, Pos, X),
    nth0(1, Pos, Y),
    replace([X,Y,1], [X,Y,0], Eq1, NewEq1),
    state(NewEq1, Eq2, State),
    score(NewEq1, Eq2, Score),
    escenario(0,N,M,NewEq1,Eq2,[],D,State,Score,SceneOut);
    SceneOut=SceneIn.
    

%Reglas principales o Metas Primarias
createScene(N, M, E, D, Seed, Scene):- 
    random(1, Seed, ID),
    escenario(ID, N, M, _, Eq2, _, D, _, _, Scene), 
    E = L, 
    largoLista(Eq2, L).
checkScene(Scene):- 
     escenario(_,_,_,_,_,_,_,_,_,Scene) ;
     (
      getNEscenario(Scene, N),
      getMEscenario(Scene, M),
      getEq1Escenario(Scene, Eq1), 
      getEq2Escenario(Scene, Eq2),
      N>0, 
      M>0, 
      length(Eq1, L1), 
      length(Eq2, L2), 
      M>L1+L2,
      append(X1, X2, L), 
      generarX(Eq1, X1), 
      generarX(Eq2, X2), 
      not(seRepite(L))
      ).




moveMember(SceneIn, Member, MoveDir, _, SceneOut):- 
    getNEscenario(SceneIn, N),
    getMEscenario(SceneIn, M),
    getEq1Escenario(SceneIn, Eq1), 
    getEq2Escenario(SceneIn, Eq2),
    getPrEscenario(SceneIn, P),
    getDEscenario(SceneIn, D),
    getStateEscenario(SceneIn, Ste),
    getScoreEscenario(SceneIn, Score),
    nth0(Member, Eq1, Prje),
    getXPersonaje(Prje, X),
    NewX is MoveDir+X,
    NewX>0,
    NewX =< M,
    setXPersonaje(NewX, Prje, NewPrje),
    replace(Prje, NewPrje, Eq1, NewEq),
    generarX(Eq1, X1),
    generarX(Eq2, X2),
    append(X1,X2,L),
    not(member(NewX, L)),
    escenario(0, N, M, NewEq, Eq2, P, D, Ste, Score, SceneOut);
    SceneOut=SceneIn.



shoot(SceneIn, Member, _, Angle, _, SceneOut):-
    getNEscenario(SceneIn, N),
    getMEscenario(SceneIn, M),
    getEq1Escenario(SceneIn, Eq1),
    getEq2Escenario(SceneIn, Eq2),
    getDEscenario(SceneIn, D),
    nth0(Member, Eq1, Prje),
    initPr(Prje, Angle, Pr),
    generarPos(Eq2, X2), 
    posCaida(Pr, Pos),
    member(Pos, X2),
    nth0(0, Pos, X),
    nth0(1, Pos, Y),
    replace([X,Y,1], [X,Y,0], Eq2, NewEq2),
    state(Eq1, NewEq2, State),
    score(Eq1, NewEq2, Score),
    escenario(0, N, M, Eq1, NewEq2, [], D, State, Score,SceneOut);
    SceneOut = SceneIn.



updateScene(SceneIn, _, SceneOut):- 
    getNEscenario(SceneIn, N),
    getMEscenario(SceneIn, M),
    getEq1Escenario(SceneIn, Eq1),
    getPrEscenario(SceneIn,Pr),
    getEq2Escenario(SceneIn, Eq2),
    getDEscenario(SceneIn, D),
    getTPr(Pr, OldT),    
    getAnglePr(Pr, Angle), 
    Tmax is (2.4*sin(Angle)),
    OldT<Tmax,
    NewT is OldT+1,
    updatePr(Pr, NewT, Pos),
    posCaida(Pr, PosCaida),
    compararListas(Pos,PosCaida),
    generarPos(Eq2, X2),
    member(Pos, X2),
    nth0(0, Pos, X),
    nth0(1, Pos, Y),
    replace([X,Y,1], [X,Y,0], Eq2, NewEq2),
    state(Eq1, NewEq2, State),
    score(Eq1, NewEq2, Score),
    escenario(0, N, M, Eq1, NewEq2, [], D, State, Score, SceneOut);
    getPrEscenario(SceneIn,Pr),
    getTPr(Pr, OldT),
    getAnglePr(Pr, Angle), 
    Tmax is (2.4*sin(Angle)),
    OldT<Tmax,
    NewT is OldT+1,
    setTPr(Pr, NewT, NewPr),
    getNEscenario(SceneIn, N),
    getMEscenario(SceneIn, M),
    getEq1Escenario(SceneIn, Eq1),
    getEq2Escenario(SceneIn, Eq2),
    getDEscenario(SceneIn, D),
    getStateEscenario(SceneIn, State),
    getScoreEscenario(SceneIn, Score),
    escenario(0, N, M, Eq1, Eq2, NewPr, D, State, Score, SceneOut);
    SceneOut = SceneIn.


play(SceneIn, Member, MoveDir, _, Angle, _, SceneOut):- 
    moveMember(SceneIn, Member, MoveDir, 12, Scene1),
    shoot(Scene1, Member, 123123, Angle, 123, Scene2),
    shootBack(Scene2, SceneOut).