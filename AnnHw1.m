clear,clc
numberOfPatterns = [12,24,48,70,100,120];
numberOfBits = 120;
%numberOfTrials = 100;
numberOfTrials = 100000;
format long

for patternIterate = 1:length(numberOfPatterns)
    error = 0;
    progress=0
    
    for trials = 1:numberOfTrials
    
        if (round(100*trials/numberOfTrials,-1)>progress)
            progress = round(100*trials/numberOfTrials,-1)
            progress=progress+10
        end
    


        X = randi([0 1],numberOfBits,numberOfPatterns(patternIterate));
        X(X == 0) = -1;

        weightMatrix = getWeightMatrix(X);
        %for i = 1:numberOfBits
        %    weightMatrix(i,i) = 0;
        %end
        [randomPattern randomPatternNumber randomPatternBitNumber] = getRandomPattern(X);

        
        
        b = getB(randomPattern,weightMatrix);

        if sign(b(randomPatternBitNumber)) == sign(randomPattern(randomPatternBitNumber))
            continue
        else
            error = error+1;
        end
    end

    probability(patternIterate) = error/numberOfTrials
end