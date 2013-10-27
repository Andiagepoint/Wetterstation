function [ rxdata ] = send_and_receive_data( txdata )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
serial_interface = evalin('base','serial_interface');
fwrite(serial_interface,txdata);
[rxdata] = fread(serial_interface);
end

