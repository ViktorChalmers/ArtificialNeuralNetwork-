function be = feedStochasticNetwork(s,weightMatrix,r,stochasticFunction) 
    [numberOfBits numberOfPatterns] = size(s);
    betaNoise = 2;
    b = zeros(numberOfBits,1);

    for i = 1:numberOfBits
        for j=1:numberOfBits
            b(i) = b(i) + weightMatrix(i,j)*s(j);
        end
    end
    %fungerar olika beroende på om pattern = 7 lr 45
    r = rand([1 numberOfBits]);
    for k = 1:numberOfBits
        if r(k)<stochasticFunction(b(k))
            b(k) = 1;
        else
            b(k) = -1;
    end

    be = b;
    end
end