function pl = plotBits(pattern,row,kol)

X = zeros(row,kol);

for i = 1:row
X(i,:) = pattern(1+kol*(i-1):kol+kol*(i-1));
end
pl = X;
imshow(X,'InitialMagnification','fit')
end