function [ data ] = regfill( register_start, data_struktur, prog_scope, prog_detail)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
scope_fields = fieldnames(data_struktur);
for u = 1:numel(scope_fields)
    if strcmp(scope_fields{u},prog_scope) == 1
        detail_fields = fieldnames(data_struktur.(scope_fields{u}));
        if strcmp(detail_fields{1},'Heute') == 1
            day_fields = fieldnames(data_struktur.(scope_fields{u}));
            for t = 1:numel(day_fields)
                hour_fields = fieldnames(data_struktur.(scope_fields{u}).(day_fields{t}));
                for s = 1:numel(hour_fields)
                data_struktur.(scope_fields{u}).(day_fields{t}).(hour_fields{s}) = dec2hex(register_start);
                register_start = register_start + 1;
                end
            end
        else
            for r = 1:numel(detail_fields)
                if strcmp(detail_fields{r},prog_detail) == 1
                    day_fields = fieldnames(data_struktur.(scope_fields{u}).(detail_fields{r}));
                    for t = 1:numel(day_fields)
                        hour_fields = fieldnames(data_struktur.(scope_fields{u}).(detail_fields{r}).(day_fields{t}));
                        for s = 1:numel(hour_fields)
                        data_struktur.(scope_fields{u}).(detail_fields{r}).(day_fields{t}).(hour_fields{s}) = dec2hex(register_start);
                        register_start = register_start + 1;
                        end
                    end
                end
            end
        end
    end
end
data = data_struktur;


end

