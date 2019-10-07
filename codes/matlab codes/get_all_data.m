function data = get_all_data(X)
    k=1;
    for i =1:size(X,1)
        for j =1:size(X,2)
             data(k)=X(i,j);
             k=k+1;
        end
    end
end