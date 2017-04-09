package Definitions;

typedef struct packed{
	bit Row1;
	bit Row2;
	bit Row3;
	bit Row4;

} Rows_a_FIFO;

typedef struct packed{
	bit result_PRO1;
	bit result_PRO1;
	bit result_PRO1;
	bit result_PRO1;

} PROCESSOR_RESULT;

typedef struct packed{
	bit rst_processor;
	bit push_result;
	bit pop_a_v;
	bit [3:0]processor_number;

} PROCESSORS_CONTROL_SIGNALS;


localparam MULTIPLIER_CONTROL_LENGHT = 5;
localparam DIVIDER_CONTROL_LENGHT = 5;

// typedef bit [8:0] AdderWithCarry;
// enum {ZERO, ONE,TWO, THREE} Cases;
endpackage
