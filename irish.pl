/* irish.pl
"Maoluimhreacha" (Disjunctive number system) in Irish
This script generates numbers 0 - 1000 */

:- ['fulldisplay.pl'].


/** Zero gets hard-coded **/
irish([a, náid], numeral, 0, [number, disjunctive, zero]).


/** Numbers 1 through 9 **/
irish([a, haon], numeral, 1, [number, disjunctive, ones]).
irish([a, dó], numeral, 2, [number, disjunctive, ones]).
irish([a, trí], numeral, 3, [number, disjunctive, ones]).
irish([a, ceathair], numeral, 4, [number, disjunctive, ones]).
irish([a, cúig], numeral, 5, [number, disjunctive, ones]).
irish([a, sé], numeral, 6, [number, disjunctive, ones]).
irish([a, seacht], numeral, 7, [number, disjunctive, ones]).
irish([a, hocht], numeral, 8, [number, disjunctive, ones]).
irish([a, naoi], numeral, 9, [number, disjunctive, ones]).


/** "-teen" is said as "déag". 10, 12 are irregular forms **/
irish([déag], numeral, 10, [suffix, teens]).
irish([a, deich], numeral, 10, [number, disjunctive, teens]).
irish([a, dó, dhéag], numeral, 12, [number, disjunctive, teens]).

irish(A, numeral, B, [number, disjunctive, teens]) :-
	irish(Ones, numeral, Z, [number, disjunctive, ones]), not(Z = 2),
	irish(Teen, numeral, Y, [suffix, teens]),
	append(Ones, Teen, A), B is Y + Z.


/** Multiples of ten **/
irish([fiche], numeral, 20, [number, disjunctive, tens]).
irish([tríocha], numeral, 30, [number, disjunctive, tens]).
irish([daichead], numeral, 40, [number, disjunctive, tens]).
irish([caoga], numeral, 50, [number, disjunctive, tens]).
irish([seasca], numeral, 60, [number, disjunctive, tens]).
irish([seachtó], numeral, 70, [number, disjunctive, tens]).
irish([ochtó], numeral, 80, [number, disjunctive, tens]).
irish([nócha], numeral, 90, [number, disjunctive, tens]).


/** Remaining numbers 21 - 99 **/
irish(A, numeral, B, [number, disjunctive, two_digits]) :-
	irish(Tens, numeral, Z, [number, disjunctive, tens]),
	irish(Ones, numeral, Y, [number, disjunctive, ones]),
	append(Tens, Ones, A), B is Y + Z.


/** -hundreds

	"Bunuimhreacha", general conjunctive numbers, are used before
	nouns to describe how much of something is present. We need 
	them to say 'how many hundreds' in numbers 200 - 999 **/
irish([dhá], numeral, 2, [number, conjunctive]).
irish([trí], numeral, 3, [number, conjunctive]).
irish([ceithre], numeral, 4, [number, conjunctive]).
irish([cúig], numeral, 5, [number, conjunctive]).
irish([sé], numeral, 6, [number, conjunctive]).
irish([seacht], numeral, 7, [number, conjunctive]).
irish([ocht], numeral, 8, [number, conjunctive]).
irish([naoi], numeral, 9, [number, conjunctive]).

% 100 is unique:
irish([céad], numeral, 100, [number, disjunctive, hundreds]).

% 'Chéad' is used to mean '-hundred'
% with two-, three-, four-, five- and six-hundred,
% but it is not a proper number on its own:
irish([chéad], numeral, 100, [hundreds, lower]).

irish(A, numeral, B, [number, disjunctive, hundreds]) :-
	irish(Chead, numeral, Z, [hundreds, lower]),
	irish(Two_through_Six, numeral, W, [number, conjunctive]),
	not(W=1), not(W=7), not(W=8), not(W=9),
	append(Two_through_Six, Chead, A), B is W * Z.

% Similarly, 'gcéad' is used for seven-, eight-, nine-hundred:
irish([gcéad], numeral, 100, [hundreds, upper]).

irish(A, numeral, B, [number, disjunctive, hundreds]) :-
	irish(Gcead, numeral, Z, [hundreds, upper]),
	irish(Seven_through_Nine, numeral, W, [number, conjunctive]),
	not(W=1),not(W=2),not(W=3),not(W=4),not(W=5),not(W=6),
	append(Seven_through_Nine, Gcead, A), B is W * Z.


/** Remaining three-digit numbers,

	integers X01 through X99, X in {1,2,3,4,5,6,7,8,9},

	built by concatenating <hundreds> numbers before
	other numbers we've built **/

% X01 - X09
irish(A, numeral, B, [number, disjunctive, three_digits]) :-
	irish(Hundos, numeral, Z, [number, disjunctive, hundreds]),
	irish(Ones, numeral, Y, [number, disjunctive, ones]),
	append(Hundos, Ones, A), B is Y + Z.

% X10 - X19
irish(A, numeral, B, [number, disjunctive, three_digits]) :-
	irish(Hundos, numeral, Z, [number, disjunctive, hundreds]),
	irish(Teens, numeral, Y, [number, disjunctive, teens]),
	append(Hundos, Teens, A), B is Y + Z.

% X20, X30, X40, etc.
irish(A, numeral, B, [number, disjunctive, three_digits]) :-
	irish(Hundos, numeral, Z, [number, disjunctive, hundreds]),
	irish(Tens, numeral, Y, [number, disjunctive, tens]),
	append(Hundos, Tens, A), B is Y + Z.

% Remaining numbers X01 - X99
irish(A, numeral, B, [number, disjunctive, three_digits]) :-
	irish(Hundos, numeral, Z, [number, disjunctive, hundreds]),
	irish(Tens, numeral, Y, [number, disjunctive, two_digits]),
	append(Hundos, Tens, A), B is Y + Z.


/** ...last but not least, one thousand **/
irish([míle], numeral, 1000, [number, disjunctive, thousands]).
