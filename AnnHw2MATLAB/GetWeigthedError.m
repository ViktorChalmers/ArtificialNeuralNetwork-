function wE = GetWeigthedError(target,output,localField)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
wE = (target-output).*sech(localField).^2;
end

