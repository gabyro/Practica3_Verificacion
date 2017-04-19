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

typedef struct packed{
	bit [7:0]FIFO1;
	bit [7:0]FIFO2;
	bit [7:0]FIFO3;
	bit [7:0]FIFO4;

} UART_FIFOS;


typedef struct packed{

	bit L_register_enable;
	bit N_register_enable;
	bit push_FIFO1;
	bit push_FIFO2;
	bit push_FIFO3;
	bit push_FIFO4;
	bit push_FIFO5;
	bit pop_FIFO_out;
	bit UART_send;
	bit [7:0]UART_send_data;

} UART_CONTROL_SIGNALS;
// typedef bit [8:0] AdderWithCarry;
// enum {ZERO, ONE,TWO, THREE} Cases;

 /*Log Function*/
     function integer CeilLog2;
       input integer data;
       integer i,result;
       begin
          for(i=0; 2**i < data; i=i+1)
             result = i + 1;
          CeilLog2 = result;
       end
    endfunction

endpackage
