function [ output_args ] = send_settings( station, city_id, temp_offset, dev_address )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
func_code_write_reg = '06';
func_code_read_reg = '03';
comset_data = evalin('base','comset_data');
% modbus_pud_write_station = strcat(dev_address,func_code_write_reg,comset_data.register.senderauswahl.station,station);
modbus_pud_write_station = strcat(dev_address,func_code_write_reg,comset_data.register.senderauswahl.station,station);
modbus_pud_read_station = strcat(dev_address,func_code_write_reg,comset_data.register.senderauswahl.station,'0000');
[station_write_msg] = crc_calc(modbus_pud_write_station);
[station_read_msg] = crc_calc(modbus_pud_read_station);
station_write_msg = format_modbus_msg(station_write_msg);
station_read_msg = format_modbus_msg(station_read_msg);
[rxdata] = send_and_receive_data(station_write_msg);

end

