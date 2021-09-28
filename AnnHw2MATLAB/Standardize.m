
function Standardize = Standardize(inputArg,meanEqualTo,standardDeviationEqualTo)
%Standardize: Standardze(inputArg,meanEqualTo,standardDeviationEqualTo)
%   Standard:
%       meanEqualTo = 0
%       standardDeviationEqualTo = 1

if nargin == 1 || isempty(meanEqualTo)
    meanEqualTo = 0;
    standardDeviationEqualTo = 1;
end

if nargin == 2 || isempty(standardDeviationEqualTo)
    standardDeviationEqualTo = 1;
end

tmp = inputArg - mean(inputArg(:,1))+meanEqualTo;
outputArg = tmp./std(tmp(:,1)).*standardDeviationEqualTo;


Standardize = outputArg;
end

