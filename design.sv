module pattern_detector #(
    parameter PATTERN = 8'b10101011, // Change this to your desired pattern
    parameter WIDTH = 8              // Pattern width in bits
)(
    input wire clk,
    input wire rst,
    input wire in_bit,
    output reg detected
);

    reg [WIDTH-1:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 0;
            detected <= 0;
        end else begin
            shift_reg <= {shift_reg[WIDTH-2:0], in_bit};
            if (shift_reg == PATTERN)
                detected <= 1;
            else
                detected <= 0;
        end
    end

endmodule