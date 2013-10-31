function [ value ] = data_proc( value, reg_address, field_name )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
data = evalin('base','data');

days = {'Heute' 'Erster_Folgetag' 'Zweiter_Folgetag' 'Dritter_Folgetag'};
hours = {'Morgen' 'Vormittag' 'Nachmittag' 'Abend'};
com_settings = {'temperature_offset','temperature','city_id','transmitting_station','quality','fsk_qualitaet' 'status_ext_temp_sensor' 'reserve1' 'reserve2' 'reserve3'};

if strcmp('data.Communication_Settings',field_name) == 1
    value = hex2dec(strcat(dec2hex(value(1),2),dec2hex(value(2),2)));
end

% for t = 1:size(days,2)
%     for s = 1:size(hours,2)
%         
%         
%     end
% end
% 
% 
% for u = 1:numel(scope_fields)
%         detail_fields = fieldnames(data.(scope_fields{u}));
%         if strcmp(detail_fields{1},'Heute') == 1
%             day_fields = fieldnames(data.(scope_fields{u}));
%             for t = 1:numel(day_fields)
%                 hour_fields = fieldnames(data.(scope_fields{u}).(day_fields{t}));
%                 for s = 1:numel(hour_fields)
%                     if strcmp(data.(scope_fields{u}).(day_fields{t}).(hour_fields{s}),reg_address) == 1;
%                         register_start = 1;
%                     end
%                 end
%             end
%         elseif strcmp(data.(scope_fields{u}),'Communication_Settings') == 1
%             com_fields = fieldnames(data.(scope_fields{u}));
%                 for s = 1:numel(com_fields)
%                     com_detail_fields = fieldnames(data.(scope_fields{u}).(com_fields{s}));
%                         for t = 1:numel(com_detail_fields)
%                             if strcmp(data.(scope_fields{u}).(com_fields{s}).(com_detail_fields{t}),'reg_address') == 1;
%                                 register_start = 1;
%                             end
%                         end
%                 end
%         else
%             for r = 1:numel(detail_fields)
%                     if strcmp(detail_fields{r},'Mittlere_temp_prog') == 1 
%                         day_fields = fieldnames(data.(scope_fields{u}).(detail_fields{r}));
%                         day_fields_num = numel(day_fields(1:2,1));
%                     else
%                         day_fields = fieldnames(data.(scope_fields{u}).(detail_fields{r}));
%                         day_fields_num = numel(fieldnames(data.(scope_fields{u}).(detail_fields{r})));
%                     end
%                     for t = 1:day_fields_num
%                         hour_fields = fieldnames(data.(scope_fields{u}).(detail_fields{r}).(day_fields{t}));
%                         for s = 1:numel(hour_fields)
%                             if strcmp(data.(scope_fields{u}).(detail_fields{r}).(day_fields{t}).(hour_fields{s}),reg_address) == 1;
%                             register_start = register_start + 1;
%                             end
%                         end
%                     end
%             end
%         end
% end

end

