function Q = plotQ(Q)
state = Q(1:3,1:3);

plot([.5 3.5],[-1.5 -1.5], 'k','linewidth',2);
hold on
plot([.5 3.5],[-2.5 -2.5], 'k','linewidth',2)
plot([1.5 1.5],[-.5 -3.5], 'k','linewidth',2)
plot([2.5 2.5],[-.5 -3.5], 'k','linewidth',2)

axis off

[row col]  = find(state == 1);
state;

placementx = col-1;
placementy = row-1;
for i = 1:length(row)
plot([.5+placementx(i) 1.5+placementx(i)],[-1.5-placementy(i) -.5-placementy(i)], 'k','linewidth',2)
plot([1.5+placementx(i) .5+placementx(i)],[-1.5-placementy(i) -.5-placementy(i)], 'k','linewidth',2)
end

[row col]  = find(state == -1);
state;
for i = 1:length(row)
angles = linspace(0, 2*pi, 500);
radius = .5;
CenterX = col(i);
CenterY = -row(i);
x = radius * cos(angles) + CenterX;
y = radius * sin(angles) + CenterY;
plot(x, y, 'b-', 'LineWidth', 2);
end
hold off
end

