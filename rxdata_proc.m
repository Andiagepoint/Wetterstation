function [ output_args ] = rxdata_proc( rxdata )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
func_code = dec2hex(rxdata(2),2);
if strcmp(func_code,'86') == 1
    exception_code = dec2hex(rxdata(3),2);
    switch exception_code
        case '01'
            errordlg('Function code not supported','Modbus Error');
        case '02'
            errordlg('Output Address not ok'
        case '03'
        case '04'
        otherwise
    end
else
switch rxdata(2)
    case 3
        byte_count = dec2hex(rxdata(3),2);
        
    case 6
        add_hi_byte = dec2hex(rxdata(3),2);
        add_lo_byte = dec2hex(rxdata(4),2);
        val_hi_byte = dec2hex(rxdata(5),2);
        val_lo_byte = dec2hex(rxdata(6),2);
        crc_check_hi_byte = dec2hex(rxdata(7),2);
        crc_check_lo_byte = dec2hex(rxdata(8),2);
    case 1
        
    case 5
        
    otherwise
end
end

