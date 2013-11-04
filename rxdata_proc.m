function [ response_data, crc_check_value, response_msg, error_msg ] = rxdata_proc( rxdata, modbus_msg, field_name )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if isempty(rxdata)
    error_msg = 'No data received! Check if client is available!';
    response_data = [];
    crc_check_value = 0;
    response_msg = [];
else
    device_id = dec2hex(rxdata(1),2);
    func_code = dec2hex(rxdata(2),2);
    fcode_error = fcode_check(func_code);
    reg_address = modbus_msg(5:8);
    num_reg_address = hex2dec(modbus_msg(9:12));

    if fcode_error == 1
        exception_code = dec2hex(rxdata(3),2);
        switch exception_code
            case '01'
                error_msg = 'Exception Code 01 -> Function code not supported';
            case '02'
                error_msg = 'Exception Code 02 -> Output address not valid';
            case '03'
                error_msg = 'Exception Code 03 -> Quantity of outputs exceeds range 0x0001 and 0x07D0';
            case '04'
                error_msg = 'Exception Code 04 -> Failure during reading discret outputs';
            otherwise
        end
        response_data = [];
        crc_check_value = 0;
        response_msg = [];
    else
                error_msg = [];
        switch rxdata(2)
            case 1
                byte_count = rxdata(3);
                for t = 1:byte_count
                    data_proc( reg_address )
                end
            case 3
                byte_count = rxdata(3);
                response_data = data_proc( rxdata(4:end-2), reg_address, field_name );
                [crc_check_value, response_msg] = crc_check(rxdata);
            case 5
                output_address = dec2hex(rxdata(3:4),4);
                output_value = dec2hex(rxdata(5:6),4);
            case 6
    %             reg_address = dec2hex(rxdata(3:4),4);
                response_data = dec2hex(rxdata(5:6),4);
                [crc_check_value, response_msg] = crc_check(rxdata);
            otherwise
        end
    end
end
end

