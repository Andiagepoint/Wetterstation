function [ value ] = data_proc( value, reg_address, field_name )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
data = evalin('base','data');

days = {'Heute' 'Erster_Folgetag' 'Zweiter_Folgetag' 'Dritter_Folgetag'};
hours = {'Morgen' 'Vormittag' 'Nachmittag' 'Abend'};
com_settings = {'temperature_offset','temperature','city_id','transmitting_station','quality','fsk_qualitaet' 'status_ext_temp_sensor' 'reserve1' 'reserve2' 'reserve3'};

if strcmp('data.Communication_Settings',field_name) == 1
    value = hex2dec(strcat(dec2hex(value(1),2),dec2hex(value(2),2)));
else
    start = regexp(field_name{3},'-','split');
    [truefalse, sdindex] = ismember(start{1}, days);
    [truefalse, shindex] = ismember(start{2}, hours);
    ende = regexp(field_name{4},'-','split');
    [truefalse, edindex] = ismember(ende{1}, days);
    [truefalse, ehindex] = ismember(ende{2}, hours);

    lfvara = 1;
    lfvare = 2;
    
    if shindex == ehindex && sdindex ~= edindex
        ehindex = 4;
    end
    
    
    for t = sdindex:edindex
    for s = shindex:ehindex
        
        if lfvare > size(value,1)
            break;
        end
        hi_byte = dec2hex(value(lfvara),2);
        lo_byte = dec2hex(value(lfvare),2);
        hex_value = strcat(hi_byte,lo_byte);
        dec_value = hex2dec(hex_value);
        fprintf('%s %s %s - %s, %u \n', field_name{1}, field_name{2}, days{t}, hours{s}, dec_value)

        lfvara = lfvara + 2;
        lfvare = lfvare + 2;
        
    end
    end
end
end

