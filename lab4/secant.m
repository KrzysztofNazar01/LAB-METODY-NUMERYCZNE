function [valVector,diffVector,fx,numOfIter]=secant(a,b,eps,fun)

    valVector = []; % contains values of temp results
    diffVector = []; % contains temp difference values
    numOfIter = 0;
    fx = []; % contains 'y' values of function in centrePoints
    
    for i = 1:1000

        nominator = feval(fun,b) * (b - a);
        denominator = (feval(fun,b) - feval(fun, a));
        result = b - nominator/denominator;

        valVector(i) = result;
        fx(i) = feval(fun,result);

        if i > 1
            diffVector(i-1) = abs(result - valVector(i-1)); 
        end

        if abs(fx(i)) < eps
            numOfIter = i;
            break;
        end
        
        a = b;
        b = result;
    end
end
