%Representaciones
%Escenario:  [N; M; [Listas de personajes del jugador]; [Lista de personajes del computador]; [Par ordenado que da trayectoria de proyectil]]
%Personaje: [X; Y; Vida]
%Dominios:
    %N, M: entero positivo, filas y columnas, respectivamente, del tablero en cuestion
    %Lista de personajes del jugador: lista que contiene datos tipo personaje que pertenecen al equipo del jugador
    %Lista de personajes del computador: lista que contiene datos tipo personaje que pertenecen al equipo del computador

%Base de conocimientos
escenario(5, 10, [[1, 2, 1], [2, 2, 1], [3, 2, 1]], [[8, 2, 1], [9, 2, 1]]).
escenario(5, 10, [[2, 4, 1], [3, 4, 1], [4, 4, 1]], [[7, 4, 1], [8, 4, 1], [9, 4, 1], [10, 4, 1]]).
escenario(5, 10, [[1, 1, 1], [3, 1, 1], [5, 1, 1]], [[6, 1, 1], [7, 1, 1], [8, 1, 1], [9, 1, 1], [10, 1, 1]]).
escenario(10, 12, [[2, 5, 1], [4, 5, 1], [6, 5, 1]], [[8, 5, 1], [9, 5, 1], [10, 5, 1], [11, 5, 1]]).
escenario(10, 12, [[1, 7, 1], [2, 7, 1], [4, 7, 1]], [[5, 7, 1], [6, 7, 1], [8, 7, 1], [9, 7, 1], [10, 7, 1], [12, 7, 1]]).
escenario(20, 20, [[2, 12, 1], [5, 12, 1], [7, 12, 1]], [[10, 12, 1], [12, 12, 1], [13, 12, 1], [14, 12, 1], [15, 12, 1], [17, 12 , 1], [18, 12 , 1], [19, 12, 1]]).

generarX([[X, _, 1]], [X]).
generarX([[X,_,1]|Resto], [X|Y]):-generarX(Resto, Y).

largoLista([], 0).
largoLista([_|Xs], N):- largoLista(Xs, N1), N is N1+1.

createScene(N, M, E, D, Seed, Scene):- escenario(N, M, _, Eq2), E = L, largoLista(Eq2, L).
