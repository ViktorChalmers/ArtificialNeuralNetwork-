%%Takes patterns as an input with each pattern as a kolumn and creates a
%%weight matrix. 
%if order == "ZeroDiagonal" => w(i,i)=0
function wMatrix = getWeightMatrix(patterns,order)

    if nargin == 1 || isempty(order)
        order = "";
    end

    X = patterns;
    [numberOfBits numberOfPatterns] = size(X);
    W = zeros(numberOfBits,numberOfBits);

    for i = 1:numberOfPatterns
        W = W+mtimes(X(:,i),X(:,i)');
    end

    if order == "ZeroDiagonal"
        for i = 1:numberOfBits
            W(i,i) = 0;
        end
    end

    wMatrix = (W/numberOfBits);
end