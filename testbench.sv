`timescale 1ns/1ps

module pattern_detector_tb;
    reg clk;
    reg rst;
    reg in_bit;
    wire detected;

    // Instantiate the DUT (Device Under Test)
    pattern_detector #(
        .PATTERN(8'b10101011),
        .WIDTH(8)
    ) uut (
        .clk(clk),
        .rst(rst),
        .in_bit(in_bit),
        .detected(detected)
    );

    initial begin
        // VCD Dump setup
        $dumpfile("pattern_detector.vcd"); // VCD output file
        $dumpvars(0, pattern_detector_tb);

        // Initialize signals
        clk = 0;
        rst = 1;
        in_bit = 0;

        // Reset pulse
        #5 rst = 0;

        // Send a sequence: 10101011 (matches the pattern), plus extra bits
        #10 in_bit = 1;
        #10 in_bit = 0;
        #10 in_bit = 1;
        #10 in_bit = 0;
        #10 in_bit = 1;
        #10 in_bit = 0;
        #10 in_bit = 1;
        #10 in_bit = 1; // Should detect pattern here

        // More bits (no detection)
        #10 in_bit = 0;
        #10 in_bit = 1;
        #10 in_bit = 0;
        #10 in_bit = 0;

        #20 $finish;
    end

    // Clock generation
    always #5 clk = ~clk;

endmodule