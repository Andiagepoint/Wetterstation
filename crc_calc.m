function [ txdata_hex ] = crc_calc( modbus_pud_hex )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
databits = size(modbus_pud_hex,2);
datastream = dec2bin(hex2dec(modbus_pud_hex));
crc16_rev = hex2dec(['0000']);
true = 1;
Poly16 = ['A001'];

for i = 1:databits
        test = true(crc16_rev & ['8000']);
        if true(crc16_rev & ['8000']) ~= 0
            erg = 1;
            if erg ~= double(datastream(i))
                crc16_rev = xor(bitshift(crc16_rev,1),Poly16);
            end
        else
            erg = 0;
            if erg ~= double(datastream(i))
                crc16_rev = bitshift(crc16_rev,1);
            end
        end
end
nbit = 2.^(size(crc16_rev,2)-1:-1:0);
crc16_rev_hex = dec2hex(nbit*crc16_rev.');
txdata_hex = crc16_rev_hex;
