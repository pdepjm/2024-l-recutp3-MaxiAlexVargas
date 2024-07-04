% VOMISTAR
miembroDelDepartamento(ventas,empleada,maria).
miembroDelDepartamento(ventas,cadete,juan).
miembroDelDepartamento(ventas,pasante,roque).

miembroDelDepartamento(compras,empleada,nora).
miembroDelDepartamento(compras,cadete,pedro).

miembroDelDepartamento(administracion,empleada,felipe).
miembroDelDepartamento(administracion,empleada,hugo).
miembroDelDepartamento(administracion,cadete,ana).

% 1.¿Quiénes trabajan en el departamento de compras? ¿y en el de ventas?
trabajaEnElDepartamento(compras,Miembros):-
    miembroDelDepartamento(compras,_,Miembros).

trabajaEnElDepartamento(ventas,Miembros):-
    miembroDelDepartamento(ventas,_,Miembros).

% 2.Dadas dos personas, ¿trabajan en el mismo departamento? 
trabajanEnElMismoDepartamento(Miembro1,Miembro2):-
    miembroDelDepartamento(Departamento1,_,Miembro1),
    miembroDelDepartamento(Departamento2,_,Miembro2), 
    Departamento1 == Departamento2.

% 3.Dadas dos personas "a" y "b", ¿puede "a" darle órdenes a "b"? 
% Decimos que a puede darle órdenes a b si y sólo si trabajan en el mismo departamento y a tiene 
% un cargo superior al de b. Se considera que “empleado” es un cargo superior a “cadete” y a “pasante”.
puedeDarleOrdenesA(Miembro1,Miembro2):-
    trabajanEnElMismoDepartamento(Miembro1,Miembro2),
    esSuSuperior(Miembro1,Miembro2).

esSuSuperior(Trabajador1,Trabajador2):-
    miembroDelDepartamento(_,empleada,Trabajador1),
    miembroDelDepartamento(_,cadete,Trabajador2).

esSuSuperior(Trabajador1,Trabajador2):-
    miembroDelDepartamento(_,empleada,Trabajador1),
    miembroDelDepartamento(_,pasante,Trabajador2).
