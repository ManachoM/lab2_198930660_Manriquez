%Representaciones
%Escenario:  [ID; N; M; [Listas de personajes del jugador]; [Lista de personajes del computador]; [Par ordenado que da trayectoria de proyectil]; [Lista con todo lo anterior]]
%Personaje: [X; Y; Vida]
%Dominios:
    %ID: Entero que representa al tablero
    %N, M: entero positivo, filas y columnas, respectivamente, del tablero en cuestion
    %Lista de personajes del jugador: lista que contiene datos tipo personaje que pertenecen al equipo del jugador
    %Lista de personajes del computador: lista que contiene datos tipo personaje que pertenecen al equipo del computador
    %Par que contiene coordenadas de proyectil, de existir uno.

%Base de conocimientos
%escenario(Id, N, M, Eq1, Eq2, P, [Lista con caca]).
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


esMiembro(M, [M|_]).
esMiembro(M, [M]).
esMiembro(M, [L|Ls]):- esMiembro(M, Ls) ; M=L.

seRepite([M, M]).
seRepite([L|Ls]):- esMiembro(L, Ls) ; seRepite(Ls).

largoLista([], 0).
largoLista([_|Xs], N):- largoLista(Xs, N1), N is N1+1.

createScene(N, M, E, D, Seed, Scene):-random(1, Seed, ID), escenario(ID, N, M, _, Eq2, _, Scene), E = L, largoLista(Eq2, L).
checkScene(Scene):- escenario(_,_,_,_,_,_,Scene) ; (Scene is [_, N, M, Eq1, Eq2, p], N>0, M>0, not(seRepite(L)), append(X1, X2, L), generarX(Eq1, X1), generarX(Eq2, X2), M>=L1+L2, length(Eq1, L1), length(Eq2, L2)).


