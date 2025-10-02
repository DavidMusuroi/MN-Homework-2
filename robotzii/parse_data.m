function [x, y] = parse_data(filename)
    file = fopen(filename, 'r');
    n = fscanf(file, '%d', 1);
    for i = 1 : n + 1
        x(1, i) = fscanf(file, '%d', 1);
    endfor
    for i = 1 : n + 1
        y(1, i) = fscanf(file, '%d', 1);
    endfor
    fclose(file);
end