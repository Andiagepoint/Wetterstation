function [ ] = open_serial_port( com_address, baudrate, databits, parity, stopbit )
%This function establishes the modbus communication channel
%   Detailed explanation goes here
serial_interface = serial(com_address,'BaudRate',baudrate,'DataBits',databits,'Parity',parity,'StopBits',stopbit);
assignin('base','serial_interface',serial_interface);
fopen(serial_interface);
sprintf('%s','Modbus communication established as "serial_interface"')
end

