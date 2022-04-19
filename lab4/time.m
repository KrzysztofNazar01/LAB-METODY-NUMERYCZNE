function [result] = time(N)
    result = N^1.43 + N^1.14;
    result = result/1000;
    result = result - 5000;
end
