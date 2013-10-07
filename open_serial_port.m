function [ output_args ] = open_serial_port( COM_name, BaudRate )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
serial_interface = serial(COM_name,'BaudRate',BaudRate);
assignin('base','serial_interface',serial_interface);
end

