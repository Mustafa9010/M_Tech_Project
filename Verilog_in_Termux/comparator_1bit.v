module Comparator1Bit (
  input  wire A,
  input  wire B,
  output wire A_gt_B,
  output wire A_eq_B,
  output wire A_lt_B
);

  assign A_gt_B = A & ~B;
  assign A_eq_B = ~(A ^ B);
  assign A_lt_B = ~A & B;

endmodule
