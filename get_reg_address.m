function [ reg_address ] = get_reg_address( popup_scope_detail, popup_interval , data )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
prog_detail_field = getfield(data,popup_scope_detail{1});
if strcmp(popup_scope_detail{2},'keine Details verfügbar') == 1 || isempty(popup_scope_detail{2}) == 1
    prog_hour_field = getfield(prog_detail_field, popup_interval{1});
    reg_address = getfield(prog_hour_field,popup_interval{2});
else
    prog_day_field = getfield(prog_detail_field,popup_scope_detail{2});
    prog_hour_field = getfield(prog_day_field, popup_interval{1});
    reg_address = getfield(prog_hour_field,popup_interval{2});
end

end

