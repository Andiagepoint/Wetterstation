function [ msg ] = open_serial_port( COM_name, BaudRate )
%This function establishes the modbus communication channel
%   Detailed explanation goes here
serial_interface = serial(COM_name,'BaudRate',BaudRate);
assignin('base','serial_interface',serial_interface);
sprintf('%s','Modbus communication established as "serial_interface"')
end

