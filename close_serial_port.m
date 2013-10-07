function [ msg ] = close_serial_port( serial_interface )
%This function is shutting down the modbus communication channel
%   Detailed explanation goes here
fclose(serial_interface);
sprintf('%s','Modbus communication closed')
end

