function [valVector,diffVector,fx,numOfIter]=bisect(a,b,eps,fun)

valVector = []; % contains values of temp results
diffVector = []; % contains temp difference values
numOfIter = 0;
fx = []; % contains 'y' values of function in centrePoints
    
    for i = 1:1000
        % divide current size into halfs
        centrePoint = (a +b)/2;

        % cannot be used in the first interation due to indexing
        % save difference between current and previous centrePoint
        if i > 1
            disp(i-1);
            diffVector(i-1) = abs(centrePoint - valVector(i-1));
        end

        % obtain the 'y' value of the function in 'centrePoint' 
        funVal = feval(fun,centrePoint);
        
        % save values to vectors
        fx(i) = funVal; 
        valVector(i) = centrePoint;

        % if value of function is lower than eps
        % or the size of current secction is smaller than eps
        if abs(funVal) < eps || abs(a-b) < eps
            numOfIter = i; %save the number of iterations
            break; %end the algorithm
        else 
            % check if function has root in
            % left or right part of the current section
            if feval(fun,a) * feval(fun,centrePoint) < 0
                b = centrePoint;
            else
                a = centrePoint;
            end
        end
    end
end
