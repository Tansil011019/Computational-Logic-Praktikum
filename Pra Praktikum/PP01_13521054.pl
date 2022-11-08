/*
    Bagian 1
*/

/* 1a. */
pria(gede).
pria(gojo).
pria(vonneumann).
pria(vanrossum).
pria(bambang).
pria(vito).
pria(ave).
pria(wesly).
pria(elonmusk).
pria(patrick).

/* 1b. */
wanita(indah).
wanita(lovelace).
wanita(khelli).
wanita(power).
wanita(aqua).
wanita(wulandari).
wanita(anya).

/* 1c. */
usia(gede, 96).
usia(gojo, 90).
usia(vonneumann, 92).
usia(vanrossum, 65).
usia(bambang, 60).
usia(vito, 56).
usia(ave, 54).
usia(wesly, 26).
usia(elonmusk, 28).
usia(patrick, 24).
usia(indah, 92).
usia(lovelace, 79).
usia(khelli, 89).
usia(power, 50).
usia(aqua, 50).
usia(wulandari, 24).
usia(anya, 4).

/* 1d. */
menikah(gede, indah).
menikah(indah, gede).
menikah(gojo, lovelace).
menikah(lovelace, gojo).
menikah(khelli, vonneumann).
menikah(vonneumann, khelli).
menikah(vito, power).
menikah(power, vito).
menikah(ave, aqua).
menikah(aqua, ave).
menikah(wulandari, wesly).
menikah(wesly, wulandari).

/* 1e. */
anak(vanrossum, gede).
anak(vanrossum, indah).
anak(bambang, gede).
anak(bambang, indah).
anak(vito, gede).
anak(vito, indah).
anak(power, gojo).
anak(power, lovelace).
anak(ave, gojo).
anak(ave, locelace).
anak(aqua, khelli).
anak(aqua, vonneumann).
anak(wesly, vito).
anak(wesly, power).
anak(elonmusk, ave).
anak(elonmusk, aqua).
anak(patrick, ave).
anak(patrick, aqua).
anak(anya, wulandari).
anak(anya, wesly).

/* 1f. */
saudara(vanrossum, bambang).
saudara(vanrossum, vito).
saudara(bambang, vanrossum).
saudara(bambang, vito).
saudara(vito, vanrossum).
saudara(vito, bambang).
saudara(power, ave).
saudara(ave, power).
saudara(elonmusk, patrick).
saudara(patrick, elonmusk).

/* 2a. */
kakak(X, Y) :- saudara(X, Y), saudara(Y, X), usia(X, U1), usia(Y, U2), U1 > U2.

/* 2b. */
keponakan(X, Y) :- saudara(Y, A), saudara(A, Y), anak(X, A).

/* 2c. */
suami(X, Y) :- menikah(X, Y), menikah(Y, X), pria(X).

/* 2d. */
sepupu(X, Y) :- anak(X, A), anak(Y, B), saudara(A, B), saudara(B, A).

/* 2e. */
menantu(X, Y) :- anak(A, Y), menikah(X, A), menikah(X, _B).

/* 2f. */
orangtua(X, Y) :- anak(Y, X).

/* 2g. */
bibi(X, Y) :- wanita(X), keponakan(Y, X).

/* 2h. */
cucu(X, Y) :- anak(A, Y), anak(X, A).

/* 2i. */
keturunan(X, Y) :- anak(X, Y).
keturunan(X, Y) :- anak(X, A), keturunan(A, Y).

/* 2j. */
anaksulung(X) :- \+kakak(_, X), anak(X, _).

/* 2k. */
anakbungsu(X) :- \+kakak(X, _), anak(X, _).

/*
    Bagian 2
*/

/* 1 */
factorial(0, 1).
factorial(N, F):-
    N>0,
    N1 is N-1,
    factorial(N1, F1),
    F is F1 * N.
combination(N, C, X) :- 
    S is N-C,
    factorial(N, P),
    factorial(S, Q),
    factorial(C, R),
    T is Q * R,
    X is P/T.

/* 2 */
change(0, 0).
change(X, Y):-
    Y>=5,
    Y1 is Y - 5,
    change(X1, Y1),
    X is X1 + 1,
    !.
change(X, Y):-
    Y>=2,
    Y1 is Y - 2,
    change(X1, Y1),
    X is X1 + 1,
    !.
change(X, Y):-
    Y>=1,
    Y1 is Y - 1,
    change(X1, Y1),
    X is X1 + 1,
    !.

/* 3 */
fpb(A, B, X):-
    M is A mod B,
    M \== 0,
    A1 is B,
    B1 is M,
    fpb(A1, B1, X1),
    X is X1.
fpb(A, B, X):-
    M is A mod B,
    M == 0,
    X is B.

/* 4 */
mod(A, B, X):-
    A >= B,
    A1 is A - B,
    mod(A1, B, X1),
    X is X1.
mod(A, B, X):- 
    A < B,
    X is A.

/* 5 */
/* 1, 2, 4, 5, 10, 11, 22, ... */
/* Perubahan: +1, *2, +1, *2, ... */
deret(1, 1).
deret(X, Y):-
    M is X mod 2,
    M == 0,
    X1 is X - 1,
    deret(X1, Y1),
    Y is Y1 + 1.
deret(X, Y):-
    M is X mod 2,
    M \== 0,
    X1 is X - 1,
    deret(X1, Y1),
    Y is Y1 * 2.

/*
    Bagian 3A
*/

/* 1 */
min([H], H).
min([H|T], H):-
    min(T, X),
    H < X,
    !.
min([_H|T], X):-
    min(T, X).

/* 2 */
max([H], H).
max([H|T], H):-
    max(T, X),
    H > X,
    !.
max([_H|T], X):-
    max(T, X).

/* 3 */
range([H|T], R):-
    max([H|T], Max),
    min([H|T], Min),
    R is Max - Min.

/* 4 */
count([_H], 1).
count([_H|T], C):-
    count(T, C1),
    C is C1 + 1.

/* 5 */
sum([H], H).
sum([H|T], S):-
    sum(T, S1),
    S is H + S1.

/* 
    Bagian 3b
*/

/* 1 */
getIndex([H|_], H, 1):-
    !.
getIndex([_H|T], V, I):-
    getIndex(T, V, I1),
    I is I1+1.

/* 2 */
getElmt([H|_], 1, H):-
    !.
getElmt([_H|T], I, V):-
    I1 is I - 1,
    getElmt(T, I1, V1),
    V is V1.
changeElmt([_H|T], 1, [V|T], V):-
    !.
changeElmt([H|T], I, [H|T1], V):-
    I1 is I - 1,
    changeElmt(T, I1, T1, V).
swap([H|T], I1, I2, R):-
    getElmt([H|T], I1, V1),
    getElmt([H|T], I2, V2),
    changeElmt([H|T], I1, Temp, V2),
    changeElmt(Temp, I2, R, V1).

/* 3 */
splitList([], [], []):-
    !.
splitList([H|T], [H|T1], T2):-
    R is H mod 2,
    R \== 0,
    splitList(T, T1, T2).
splitList([H|T], T1, [H|T2]):-
    R is H mod 2,
    R == 0,
    splitList(T, T1, T2).

/* Bonus */
:- dynamic(current/1).
printvalue(V, R):-
    write('Old Saved Value is '), write(V), nl,
    write('New Saved Value is '), write(R).
startCalculator:-
    asserta(current(0)),
    write('Selamat Datang di Kalkulator Prolog'), nl,
    write('Currently Saved Value is '), write(0).
add(X):-
    retract(current(V)),
    R is V + X,
    asserta(current(R)),
    printvalue(V, R).
substract(X):-
    retract(current(V)),
    R is V - X,
    asserta(current(R)),
    printvalue(V, R).
divide(X):-
    retract(current(V)),
    R is V / X,
    asserta(current(R)),
    printvalue(V, R).
multiply(X):-
    retract(current(V)),
    R is V * X,
    asserta(current(R)),
    printvalue(V, R).
getValue:-
    retract(current(V)),
    R is V,
    asserta(current(R)),
    write('Currently Saved Value is '), write(R).
clearCalculator:-
    retract(current(V)),
    R is 0,
    asserta(current(R)),
    printvalue(V, R).
exitCalculator:-
    retract(current(_V)),
    write('Terima Kasih telah Menggunakan Kalkulator Prolog').