function [  ] = send_loop(obj, event, t, table_data, hObject, handles )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
h = waitbar(0,'Please wait while receiving data...');
for r = 1:t
    
        if table_data{r,6} == 1
        msg = table_data{r,5};
        field_name = {table_data{r,1} table_data{r,2} table_data{r,3} table_data{r,4}};
        [ txdata ] = send_and_receive_data(msg, field_name, hObject, handles);
        end
        
        waitbar(r/t,h)
end
close(h);
end

