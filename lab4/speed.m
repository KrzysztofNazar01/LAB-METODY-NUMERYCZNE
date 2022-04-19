function [result] = speed(time)
    g = 9.81; % grav. acc
    v = 750; % final speed
    q = 2700; % kg/s
    u = 2000; %  speed m/s
    m0 = 150000; % mass
    firstTerm = u*log(m0/ (m0 - q*time));
    secondTerm = g*time;
    result = firstTerm - secondTerm;
    result = result - v;
end
