function plotRay( rayPoint1, rayPoint2 )

    hold on;
    plot([rayPoint1.S rayPoint2.S], [rayPoint1.u rayPoint2.u], 'Color', rayPoint1.color, 'LineWidth', 1);

end

