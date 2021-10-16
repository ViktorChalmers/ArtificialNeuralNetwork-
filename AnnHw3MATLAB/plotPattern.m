function s = plotPattern(pattern)
    pattern = reshape(pattern,[28 28]);
    imshow(pattern,[28 28],'InitialMagnification','fit')
    s = 0;
end