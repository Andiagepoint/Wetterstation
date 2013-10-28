function [ rxdata ] = send_and_receive_data( txdata, hObject, handles )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
serial_interface = evalin('base','serial_interface');
fwrite(serial_interface,txdata);
send_protocol_text = sprintf('Successful request %s at %s', txdata, datestr(now));
listbox_text = get(handles.com_protocol_listbox,'String');
[rxdata] = fread(serial_interface);
listbox_text = char(listbox_text, send_protocol_text, rxdata);
set(handles.com_protocol_listbox,'String',listbox_text);
guidata(hObject, handles);
end

