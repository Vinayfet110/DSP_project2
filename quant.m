function y = quant(x,steps,maxv)
 
levels = steps;              % levels are number of steps...
 
del = (2*maxv)/(levels-1);     % delta as given in formula
 
y = zeros(length(x),1);
 
for i=1:length(x)            %
    
    if x(i)>=maxv            % checking for different cases
        
        y(i)=maxv;
        
    elseif x(i)>-maxv && x(i) < maxv
        
        y(i)= (floor(x(i)/del)+0.5)*del;
        
    else
        
        y(i)=-maxv;
        
    end
    
end
 
end


