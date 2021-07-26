function y = checkTimeInvariance(n,mag,system,x)    
    figure('Name',"Sifting Input Signal",'NumberTitle','on')
    subplotPos = 1;%reset subplotPos value
    arr = zeros(1,length(n));
    %make the input, x, have a single impulse at each discrete time value in time scale n
    for t = 1:length(n)
        x(t) = mag;%set the current index we're looking at to the specified magnitude
        y = system(n,x);%calculate the output values with this changed input
        arr(t) = y(t);
        subplot(length(n)+1,2,subplotPos),stem(n,x),title('Input')%plot x1, the new input wave
        subplotPos = subplotPos + 1;%move to next position to plot
        subplot(length(n)+1,2,subplotPos),stem(n,y),title('Output')%plot the system output
        subplotPos = subplotPos + 1;%move again
        x(t) = 0;%reset the current index input to 0 to give the impulse effect
    end
    
    for i = 1:length(arr)-1
        if round(arr(i),4) ~= round(arr(i+1),4)
            disp("This system is time variant")
            return
        end
    end
    disp("This system is time invariant")
end
