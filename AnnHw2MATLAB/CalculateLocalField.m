function localField = CalculateLocalField(weightMatrix,Xmu,threshold)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

V = mtimes(weightMatrix,Xmu)-threshold;

localField = V;
end

