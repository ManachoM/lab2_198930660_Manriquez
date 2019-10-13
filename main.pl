%Representaciones
%Escenario:  [ID; N; M; [Listas de personajes del jugador]; [Lista de personajes del computador]; [Par ordenado que da trayectoria de proyectil]; [Lista con todo lo anterior]]
%Personaje: [X; Y; Vida]
%Dominios:
    %ID: Entero que representa al tablero
    %N, M: entero positivo, filas y columnas, respectivamente, del tablero en cuestion
    %Lista de personajes del jugador: lista que contiene datos tipo personaje que pertenecen al equipo del jugador
    %Lista de personajes del computador: lista que contiene datos tipo personaje que pertenecen al equipo del computador
    %Par que contiene coordenadas de proyectil, de existir uno.



%TDA: Personaje
%Representacion: [Posicion X, Posicion Y, Vida]
personaje(X, Y, V, Personaje):- X>0, Y>0, V > -1, Personaje = [X,Y,V].
esPersonaje(Personaje):- nth0(0, Personaje, X), nth0(1, Personaje, Y), nth0(2, Personaje, V), X > 0, Y > 0, V > -1.
getXPersonaje(Personaje, X):- nth0(0, Personaje, X).
getYPersonaje(Personaje, Y):- nth0(1, Personaje, Y).
getVidaPersonaje(Personaje, V):- nth0(2, Personaje, V).
setXPersonaje(NewX, Personaje, NewPersonaje):- NewX>0, getYPersonaje(Personaje, Y), getVidaPersonaje(Personaje, V), personaje(NewX, Y, V, NewPersonaje).
setYPersonaje(NewY, Personaje, NewPersonaje):- NewY>0, getXPersonaje(Personaje, X), getVidaPersonaje(Personaje, V), personaje(X, NewY, V, NewPersonaje).
setVidaPersonaje(NewV, Personaje, NewPersonaje):- NewV > -1, getXPersonaje(Personaje, X), getYPersonaje(Personaje, Y), personaje(X, Y, NewV, NewPersonaje).






%Base de conocimientos
%escenario(Id, N, M, Eq1, Eq2, P, [Lista con representacion]).
escenario(1, 5, 10, [[1, 2, 1], [2, 2, 1], [3, 2, 1]], [[8, 2, 1], [9, 2, 1]], [], [1, 5, 10, [[1, 2, 1], [2, 2, 1], [3, 2, 1]], [[8, 2, 1], [9, 2, 1]], []]).
escenario(2, 5, 10, [[2, 4, 1], [3, 4, 1], [4, 4, 1]], [[7, 4, 1], [8, 4, 1], [9, 4, 1], [10, 4, 1]], [],[2, 5, 10, [[2, 4, 1], [3, 4, 1], [4, 4, 1]], [[7, 4, 1], [8, 4, 1], [9, 4, 1], [10, 4, 1]], []]).
escenario(3, 5, 10, [[1, 1, 1], [3, 1, 1], [5, 1, 1]], [[6, 1, 1], [7, 1, 1], [8, 1, 1], [9, 1, 1], [10, 1, 1]], [], [3, 5, 10, [[1, 1, 1], [3, 1, 1], [5, 1, 1]], [[6, 1, 1], [7, 1, 1], [8, 1, 1], [9, 1, 1], [10, 1, 1]], []]).
escenario(4, 10, 12, [[2, 5, 1], [4, 5, 1], [6, 5, 1]], [[8, 5, 1], [9, 5, 1], [10, 5, 1], [11, 5, 1]], [], [4, 10, 12, [[2, 5, 1], [4, 5, 1], [6, 5, 1]], [[8, 5, 1], [9, 5, 1], [10, 5, 1], [11, 5, 1]], []]).
escenario(5, 10, 12, [[1, 7, 1], [2, 7, 1], [4, 7, 1]], [[5, 7, 1], [6, 7, 1], [8, 7, 1], [9, 7, 1], [10, 7, 1], [12, 7, 1]], [], [5, 10, 12, [[1, 7, 1], [2, 7, 1], [4, 7, 1]], [[5, 7, 1], [6, 7, 1], [8, 7, 1], [9, 7, 1], [10, 7, 1], [12, 7, 1]], []]).
escenario(6, 20, 20, [[2, 12, 1], [5, 12, 1], [7, 12, 1]], [[10, 12, 1], [12, 12, 1], [13, 12, 1], [14, 12, 1], [15, 12, 1], [17, 12 , 1], [18, 12 , 1], [19, 12, 1]], [], [6, 20, 20, [[2, 12, 1], [5, 12, 1], [7, 12, 1]], [[10, 12, 1], [12, 12, 1], [13, 12, 1], [14, 12, 1], [15, 12, 1], [17, 12 , 1], [18, 12 , 1], [19, 12, 1]], []]).

compararListas([A], [B]):- A=B.
compararListas([X|Xs], [Y|Ys]):- X=Y, compararListas(Xs, Ys). 

generarX([[X, _, 1]], [X]).
generarX([[X,_,1]|Resto], [X|Y]):-generarX(Resto, Y).

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

%moverEquipo(Eq1, NuevoPersonaje, EqN):-

createScene(N, M, E, D, Seed, Scene):-random(1, Seed, ID), escenario(ID, N, M, _, Eq2, _, Scene), E = L, largoLista(Eq2, L).

checkScene(Scene):- escenario(_,_,_,_,_,_,Scene) ;
     (
      nth0(1, Scene, N),
      nth0(2, Scene, M),
      nth0(3, Scene, Eq1), 
      nth0(4, Scene, Eq2),
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
    nth0(1, SceneIn, N),
    nth0(2, SceneIn, M),
    nth0(3, SceneIn, Eq1), 
    nth0(4, SceneIn, Eq2),
    nth0(5, SceneIn, P),
    nth0(Member, Eq1, Prje),
    nth0(0, Prje, X),
    NewX is MoveDir+X,
    NewX>0,
    setXPersonaje(NewX, Prje, NewPrje),
    replace(Prje, NewPrje, Eq1, NewEq),
    generarX(Eq1, X1),
    generarX(Eq2, X2),
    append(X1,X2,L),
    not(member(NewX, L)),
    SceneOut = [0, N, M, NewEq, Eq2, P].
