package Definitions;

typedef struct packed{
	bit rst_FIFO_out;
	bit rst_processor;
	bit push_result;
	bit pop_a_v;
	bit [1:0]processor_number;

} PROCESSORS_CONTROL_SIGNALS;

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
