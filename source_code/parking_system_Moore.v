`timescale 1ns / 1ps
/*
In the entrance of the parking system, 
there is a sensor which is activated to detect a vehicle coming. 
Once the sensor is triggered, a password is requested to open the gate. 
If the entered password is correct, the gate would open to let the vehicle get in. 
Otherwise, the gate is still locked. 
If the current car is getting in the car park being detected by the exit sensor 
and another the car comes, the door will be locked and requires the coming car to enter passwords.
*/
module parking_system_Moore ( 
    input clk, reset_n,
    input sensor_entrance, sensor_exit, 
    input [1:0] password_1, password_2,
    output reg GREEN_LED, RED_LED,
    output reg [6:0] HEX_1, HEX_2
    );
    
    // binary coding
    parameter IDLE = 3'b000, 
              WAIT_PASSWORD = 3'b001, 
              WRONG_PASS = 3'b010, 
              RIGHT_PASS = 3'b011,
              STOP = 3'b100;
              
    // Moore FSM : output just depends on the current state
    reg[2:0] current_state, next_state;
    reg[31:0] counter_wait;
    
    // update current state
    always @(posedge clk or negedge reset_n) begin
        if (~reset_n) 
            current_state = IDLE;
        else
            current_state = next_state;
    end
    
    // update next state
    always @(*) begin
        case (current_state)
            IDLE: begin
                // a sensor is activated to detect a vehicle coming,
                // a password is requested to open the gate. 
                if (sensor_entrance == 1)
                    next_state = WAIT_PASSWORD;
                else
                    next_state = IDLE;
            end
            WAIT_PASSWORD: begin
                if (counter_wait <= 3)
                    next_state = WAIT_PASSWORD;
                else begin
                    // the entered password is correct, the gate would open to let the vehicle get in. 
                    // Otherwise, the gate is still locked. 
                    if ((password_1 == 2'b01) && (password_2 == 2'b10))
                        next_state = RIGHT_PASS;
                    else
                        next_state = WRONG_PASS;
                end
            end
            // the entered password is correct, the gate would open to let the vehicle get in. 
            // Otherwise, the gate is still locked.
            WRONG_PASS: begin
                    if ((password_1 == 2'b01) && (password_2 == 2'b10))
                        next_state = RIGHT_PASS;
                    else
                        next_state = WRONG_PASS;
            end
            RIGHT_PASS: begin
                    // If the current car is getting in the car park being detected by the exit sensor 
                    // and another the car comes, the door will be locked and requires the coming car to enter passwords.
                    if (sensor_entrance==1 && sensor_exit==1)
                        next_state = STOP;
                    else if (sensor_exit == 1)
                        next_state = IDLE;
                    else
                        next_state = RIGHT_PASS;
                    end
            STOP: begin
                // the entered password is correct, the gate would open to let the vehicle get in. 
                // Otherwise, the gate is still locked.
                if ((password_1 == 2'b01) && (password_2 == 2'b10))
                    next_state = RIGHT_PASS;
                else
                    next_state = STOP;
                end
            default: next_state = IDLE;
        endcase
    end
    
    // LEDs and output, change the period of blinking LEDs
    always @(posedge clk) begin 
        case (current_state)
            IDLE: begin
                GREEN_LED = 1'b0; 
                RED_LED = 1'b0; 
                HEX_1 = 7'b1111111; // off
                HEX_2 = 7'b1111111; // off
            end
            WAIT_PASSWORD: begin
                GREEN_LED = 1'b0;   
                RED_LED= 1'b1; 
                HEX_1 = 7'b000_0110; // E
                HEX_2 = 7'b010_1011; // n 
            end
            WRONG_PASS: begin
                GREEN_LED = 1'b0;   
                RED_LED = ~RED_LED; 
                HEX_1 = 7'b000_0110; // E
                HEX_2 = 7'b000_0110; // E 
            end
            RIGHT_PASS: begin
                GREEN_LED= ~GREEN_LED; 
                RED_LED= 1'b0; 
                HEX_1 = 7'b000_0010; // 6
                HEX_2 = 7'b100_0000; // 0 
            end
            STOP: begin
                GREEN_LED = 1'b0;     
                RED_LED = ~RED_LED; 
                HEX_1 = 7'b001_0010; // 5
                HEX_2 = 7'b000_1100; // P 
            end
    endcase
end

// counter_wait
always @(posedge clk or negedge reset_n) begin
    if (~reset_n) 
        counter_wait <= 0;
    else if(current_state == WAIT_PASSWORD)
        counter_wait <= counter_wait + 1;
    else 
        counter_wait <= 0;
end

endmodule