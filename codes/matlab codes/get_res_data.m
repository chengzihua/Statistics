function y =get_res_data(X,Threshold)
   k=1;
   for i=1:size(X,1)
       for j =1:size(X,2)
           if X(i,j)<Threshold
               y(k)=X(i,j);
               k=k+1;
           end
       end
   end
end