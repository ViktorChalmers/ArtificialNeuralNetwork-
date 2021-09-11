clear,clc
choise = menu("Use visual tools?", "Yes", "no");
numberOfPatterns = [12,24,48,70,100,120];
numberOfBits = 120;
numberOfTrials = 100000;
format long

if choise==1
        h = waitbar(0,"initiate");
end

for patternIterate = 1:length(numberOfPatterns)
    error = 0;
    progress=0;
    
    for trials = 1:numberOfTrials
        if choise==1
            progress=trials/numberOfTrials;
            waitbar(progress,h,"pattern(" + patternIterate + ") = " + numberOfPatterns(patternIterate));
        end
    
        X = randi([0 1],numberOfBits,numberOfPatterns(patternIterate));
        X(X == 0) = -1;

        weightMatrix = getWeightMatrix(X);
        
        %for i = 1:numberOfBits
        %    weightMatrix(i,i) = 0;
        %end
        
        [randomPattern randomPatternNumber randomPatternBitNumber] = getRandomPattern(X);

        b = McCullochPitts(randomPattern,weightMatrix);

        if sign(b(randomPatternBitNumber)) == sign(randomPattern(randomPatternBitNumber))
            continue
        else
            error = error+1;
        end
    end
    
    probability(patternIterate) = error/numberOfTrials
    
    if choise==1
        msgbox("Probability for pattern(" + patternIterate + ") = " + probability(patternIterate))
    end
end
