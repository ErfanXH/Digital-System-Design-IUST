module OneBitComparator (
	input A, B,
	output Greater, Equal, Smaller
);
	wire Not_A, Not_B;

	not(Not_A, A);
	not(Not_B, B);

	and(Greater, A, Not_B);
	xnor(Equal, A, B);
	and(Smaller, Not_A, B);
	
endmodule