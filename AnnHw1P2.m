clc,clear
x1=[ [ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1] ]';
x2=[ [ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1] ]';
x3=[ [ 1, 1, 1, 1, 1, 1, 1, 1, -1, -1],[ 1, 1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, -1, -1, -1, -1, 1, 1, 1, -1, -1],[ -1, -1, -1, -1, -1, 1, 1, 1, -1, -1],[ -1, -1, -1, -1, -1, 1, 1, 1, -1, -1],[ -1, -1, -1, -1, -1, 1, 1, 1, -1, -1],[ -1, -1, -1, -1, -1, 1, 1, 1, -1, -1],[ 1, 1, 1, 1, 1, 1, 1, 1, -1, -1],[ 1, 1, 1, 1, 1, 1, 1, 1, -1, -1],[ 1, 1, 1, -1, -1, -1, -1, -1, -1, -1],[ 1, 1, 1, -1, -1, -1, -1, -1, -1, -1],[ 1, 1, 1, -1, -1, -1, -1, -1, -1, -1],[ 1, 1, 1, -1, -1, -1, -1, -1, -1, -1],[ 1, 1, 1, -1, -1, -1, -1, -1, -1, -1],[ 1, 1, 1, 1, 1, 1, 1, 1, -1, -1],[ 1, 1, 1, 1, 1, 1, 1, 1, -1, -1] ]';
x4=[ [ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, 1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1] ]';
x5=[ [ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, 1, 1, 1, 1, 1, 1, -1],[ -1, 1, 1, 1, 1, 1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1] ]';

distortedPattern(:,1) = [[1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1], [1, -1, 1, 1, -1, 1, -1, -1, 1, -1]]';
distortedPattern(:,2) = [[1, -1, -1, 1, -1, -1, -1, -1, 1, 1], [-1, -1, -1, -1, -1, 1, 1, 1, -1, -1], [-1, -1, 1, -1, -1, -1, -1, -1, -1, -1], [1, 1, -1, -1, 1, -1, -1, -1, -1, 1], [1, -1, -1, 1, -1, 1, 1, -1, -1, -1], [-1, 1, -1, -1, 1, -1, -1, -1, -1, -1], [1, 1, -1, -1, -1, -1, -1, 1, -1, -1], [1, -1, 1, -1, 1, 1, 1, 1, -1, 1], [-1, -1, -1, -1, 1, -1, 1, -1, -1, 1], [1, -1, 1, -1, -1, -1, 1, -1, -1, -1], [-1, 1, -1, -1, -1, -1, -1, 1, -1, -1], [-1, -1, -1, 1, 1, 1, -1, -1, -1, 1], [-1, 1, -1, 1, -1, 1, 1, -1, -1, 1], [-1, -1, -1, 1, 1, -1, -1, 1, 1, 1], [1, 1, -1, 1, 1, -1, -1, -1, 1, 1], [-1, 1, 1, -1, -1, -1, -1, -1, 1, -1]]'
distortedPattern(:,3) = [[1, 1, 1, -1, -1, -1, -1, 1, 1, 1], [1, 1, 1, -1, -1, -1, -1, 1, 1, 1], [1, 1, 1, -1, -1, -1, -1, 1, 1, 1], [1, 1, 1, -1, -1, -1, -1, 1, 1, 1], [1, 1, 1, -1, -1, -1, -1, 1, 1, 1], [1, 1, 1, -1, -1, -1, -1, 1, 1, 1], [1, 1, 1, -1, -1, -1, -1, 1, 1, 1], [1, 1, 1, -1, -1, -1, -1, 1, 1, 1], [1, 1, 1, -1, -1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1]]';

patterns = [x1 x2 x3 x4 x5];
[numberOfBits numberOfPatterns] = size(patterns);
numberOfDistortedPattern = length(distortedPattern(1,:))

for iDistortedPattern = 1:numberOfDistortedPattern
    subplot(length(distortedPattern(1,:)),1,iDistortedPattern)
    feedPatternNumber = iDistortedPattern;
    pause(1)
    weightMatrix = getWeightMatrix(patterns,"ZeroDiagonal");
    
    s = distortedPattern(:,feedPatternNumber);
    plotBits(s,16,10);
    for iMcCullochPitts = 1:inf
        pause(0.01)
        plotBits(s,16,10);
        s(s==0)
        if(s == sign(McCullochPitts(s,weightMatrix)));
            steadyState = s;
            break
        else
            s = sign(McCullochPitts(s,weightMatrix));
        end
        
    end
    
    for iPattern = 1:numberOfPatterns
        if(sign(s) == sign(patterns(:,iPattern)))
            p = iPattern-1;
            title("Distorted pattern #" + feedPatternNumber + " Converges at stored pattern " + p + " after " + iMcCullochPitts + " iterations")
        end
        if(sign(s) == sign(-patterns(:,iPattern)))
            p = iPattern-1;
            title("Distorted pattern #" + feedPatternNumber + " Converges at stored pattern " + -p + " after " + iMcCullochPitts + " iterations")
        end
    end
end
%%
%subplot(3,1,1)
St = plotBits(s,16,10)
%%
nian = s
clc
k = plotBits(-x4,16,10);

t = "[1,1,-1,1,1,1,1,-1,1,1;1,1,-1,-1,-1,-1,-1,-1,-1,1;1,1,-1,1,1,1,-1,-1,-1,1;1,-1,-1,1,1,1,-1,-1,-1,1;1,-1,-1,1,1,1,-1,-1,-1,1;1,-1,-1,1,1,1,-1,-1,-1,1;1,-1,-1,1,1,1,-1,-1,-1,1;1,-1,-1,-1,-1,-1,-1,-1,-1,1;1,-1,-1,-1,-1,-1,-1,-1,-1,1;1,1,1,1,1,1,-1,-1,-1,1;1,1,1,1,1,1,-1,-1,-1,1;1,1,1,1,1,1,-1,-1,-1,1;1,1,1,1,1,1,-1,-1,-1,1;1,1,1,1,1,1,-1,-1,-1,1;1,1,1,-1,-1,-1,-1,-1,-1,1;1,1,1,1,1,1,1,-1,1,1]";
w = strlength(t);
klar = "[ [ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, 1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1] ]";

newStr = strrep(t,",",", ");
newStr = strrep(newStr,";","],[");
newStr = strrep(newStr,"[","[ ");
newStr = insertAfter(newStr,1," [");
newStr = insertAfter(newStr,strlength(newStr)," ]");

newStr
klar


if newStr == klar
    "success"
else
    "denied"
end