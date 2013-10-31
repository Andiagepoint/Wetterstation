function [ value ] = send_and_receive_data( modbus_msg, field_name, hObject, handles )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
serial_interface = evalin('base','serial_interface');

txdata = format_modbus_msg(modbus_msg);

fwrite(serial_interface,txdata);

request_protocol_text = sprintf('Successful request %s at %s', modbus_msg, datestr(now));

hcom_protocol_listbox = findobj('Tag','com_protocol_listbox');

listbox_text = get(hcom_protocol_listbox,'String');

[rxdata] = fread(serial_interface);

[value, crc_check_value, response_msg] = rxdata_proc( rxdata, modbus_msg, field_name );

if crc_check_value == 0
   crc_check_text = sprintf('CRC Check was not correct');
else
   crc_check_text = sprintf('CRC Check was successful');
end

response_protocol_text = sprintf('Successful response %s at %s', response_msg, datestr(now));

listbox_text = char(listbox_text, request_protocol_text, crc_check_text, response_protocol_text);

set(hcom_protocol_listbox,'String',listbox_text);
% guidata(hObject,handles);
end

