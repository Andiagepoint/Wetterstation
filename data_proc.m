function [ value ] = data_proc( value, reg_address, field_name )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
data = evalin('base','data');

days = {'Heute' 'Erster_Folgetag' 'Zweiter_Folgetag' 'Dritter_Folgetag'};
hours_rough = {'Morgen' 'Vormittag' 'Nachmittag' 'Abend'};
hours_detailed = {'AM0_00' 'AM01_00' 'AM02_00' 'AM03_00' 'AM04_00' 'AM05_00' 'AM06_00' ...
         'AM07_00' 'AM08_00' 'AM09_00' 'AM10_00' 'AM11_00' 'AM12_00' 'PM01_00' 'PM02_00' 'PM03_00' 'PM04_00' 'PM05_00' 'PM06_00' 'PM07_00' ...
         'PM08_00' 'PM09_00' 'PM10_00' 'PM11_00'};
com_settings = {'temperature_offset','temperature','city_id','transmitting_station','quality','fsk_qualitaet' 'status_ext_temp_sensor' 'reserve1' 'reserve2' 'reserve3'};

if strcmp('data.Communication_Settings',field_name) == 1
    value = hex2dec(strcat(dec2hex(value(1),2),dec2hex(value(2),2)));
else
    start = regexp(field_name{3},'-','split');
    if strcmp(field_name{2},'Mittlere_temp_prog')==1
        [truefalse, sdindex] = ismember(start{1}, days);
    else
        [truefalse, sdindex] = ismember(start{1}, days);
    end
    
    if size(field_name,2) < 4
        % Here only one value will be requested, so the for loops have to
        % be run only once
        ehindex = shindex;
        edindex = sdindex;
    else
        ende = regexp(field_name{4},'-','split');
        if strcmp(field_name{2},'Mittlere_temp_prog')==1
            [truefalse, edindex] = ismember(ende{1}, days);
        else
            [truefalse, edindex] = ismember(ende{1}, days);
        end
    end
    
    lfvara = 1;
    lfvare = 2;
   
    for t = sdindex:edindex
        if t == sdindex
                if strcmp(field_name{2},'Mittlere_temp_prog')==1
                    [truefalse, shindex] = ismember(start{2}, hours_detailed);
                else
                    [truefalse, shindex] = ismember(start{2}, hours_rough);
                end
                ehindex = 4;
        elseif t == edindex
                if strcmp(field_name{2},'Mittlere_temp_prog')==1
                    [truefalse, ehindex] = ismember(ende{2}, hours_detailed);
                else
                    [truefalse, ehindex] = ismember(ende{2}, hours_rough);
                end
                shindex = 1;
        else
                shindex = 1;
                ehindex = 4;
        end
        
        for s = shindex:ehindex

            if lfvare > size(value,1)
                break;
            end
            hi_byte = dec2hex(value(lfvara),2);
            lo_byte = dec2hex(value(lfvare),2);
            hex_value = strcat(hi_byte,lo_byte);
            dec_value = hex2dec(hex_value);
            if strcmp(field_name{2},'Mittlere_temp_prog')==1
                response_data(z) = fprintf('%s %s %s - %s, %u \n', field_name{1}, field_name{2}, days{t}, hours_detailed{s}, dec_value)
            else
                response_data(z) = fprintf('%s %s %s - %s, %u \n', field_name{1}, field_name{2}, days{t}, hours_rough{s}, dec_value)
            end

            lfvara = lfvara + 2;
            lfvare = lfvare + 2;
            z = z + 1;
            pause(0.1)

        end
    end
end
end

