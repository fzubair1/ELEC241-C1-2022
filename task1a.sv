// ELEC241 C1 2022
//Structural Version

/*
A	B	C	Y
0	0	0	00
0	0	1	01
0	1	0	01
0	1	1	10
1	0	0	01
1	0	1	10
1	1	0	10
1	1	1	11
*/

module task1a(output logic [1:0] Y, input logic A, B, C);


// declare the wires

wire notA, notB, notC, d1, d2, d3, e1, e2, e3, e4;

// The NOT Gates

not f1 (notA, A);
not f2 (notB, B);
not f3 (notC, C);

//Output (Y[0])

and g1 (d1, notA, notB, C);
and g2 (d2, notA, B, notC);
and g3 (d3, A, notB, notC);
and g4 (d4, A, B, C);

//Output (Y[1])

and h1 (e1, notA, B, C);
and h2 (e2, A, notB, C);
and h3 (e3, A, B, notC);
and h4 (e4, A, B, C);

// 2 bits of Y

or z1 (Y[1], e1, e2, e3, e4);
or z2 (Y[0], d1, d2, d3, d4);

endmodule
