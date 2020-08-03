dist(X, Y, Z):- X =< Y, Z is Y - X.

dist(X, Y, Z):- X > Y, Z is X - Y.

canstrike( q( X1, Y1 ), q( X2, Y2 ) ):- dist( X1, X2, Z ), dist( Y1, Y2, Z ).

canstrike( q( X, Y1 ), q( X, Y2 ) ).

canstrike( q( X1, Y ), q( X2, Y ) ).

betw( L, U, X ):- L =< U, X is L.
betw( L, U, X ):- L < U, T is L + 1, betw( T, U, X ).

cannotstrike( [], q( X, Y ) ).
cannotstrike( [ H|T ], q( X,Y ) ):- not( canstrike( H, q( X, Y ) ) ), cannotstrike( T, q( X,Y ) ).

queens( 0, N, P1, P1 ).
queens( I, N, P1, [ q(X,Y)|P2 ] ) :- I > 0, T is I - 1, queens( T, N, P1, P2 ), betw( 1, N, X ), betw( 1, N, Y ), cannotstrike( P2, q( X, Y ) ).
