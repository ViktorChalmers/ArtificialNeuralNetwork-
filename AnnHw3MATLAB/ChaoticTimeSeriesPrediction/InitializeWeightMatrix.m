function weightMatrix = InitializeWeightMatrix(size,mean,standardDeviation)
weightMatrix = randn(size,'single')*standardDeviation + mean;
end