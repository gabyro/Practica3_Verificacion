package Definitions;

typedef struct packed{
	bit [7:0]Row1;
	bit [7:0]Row2;
	bit [7:0]Row3; 
	bit [7:0]Row4;
	
} Rows_a_FIFO;

typedef struct packed{
	bit [7:0]result_PRO1;
	bit [7:0]result_PRO2;
	bit [7:0]result_PRO3;
	bit [7:0]result_PRO4;
	
} PROCESSOR_RESULT;



// typedef bit [8:0] AdderWithCarry;
// enum {ZERO, ONE,TWO, THREE} Cases;
endpackage