%% finding wav end number

for i = 1 : 1000
    file_name = 'm0001_us_m0001_00';
    ext = '.wav';
    
    if i < 10
        number = strcat('00',int2str(i));
    elseif i < 100
        number = strcat('0', int2str(i));
    else
        number = int2str(i);
    end
    
    file_name = strcat(file_name, number, ext)
    
    try
        audioread(file_name);
    catch
        break;
    end
end

LastNum = i - 1;