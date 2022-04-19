function [result] = impendancy(omega)
    R = 725; % resistance [Ohm]
    C = 8*(10^(-5)); % [F]
    L = 2; % [H]
    denominator = sqrt( 1/(R^2) + (omega * C - 1/(omega*L))^2);
    nominator = 1;
    result = nominator/denominator;
    result = result - 75;
end