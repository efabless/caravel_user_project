`define WMASK_SIZE 4
`define ADDR_SIZE 16
`define DATA_SIZE 32
`define SELECT_SIZE 4
`define MAX_CHIPS 16
`define PORT_SIZE `ADDR_SIZE+`DATA_SIZE+`WMASK_SIZE+2
`define TOTAL_SIZE `PORT_SIZE+`PORT_SIZE+`SELECT_SIZE



// packet order:

// 4 chip_select
// 16 addr0
// 32 din0
// 1 csb0
// 1 web0
// 4 wmask0
// 16 addr1
// 32 din1
// 1 csb1
// 1 web1
// 4 wmask1
