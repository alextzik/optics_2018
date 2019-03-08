function plotDiaphragm( lens )
    hold on;
    plot([lens.rightPosition-0.1 lens.leftPosition+0.1], [lens.height lens.height], 'Color', 'red', 'LineWidth', 1);
    plot([lens.rightPosition-0.1 lens.leftPosition+0.1], [-lens.height -lens.height], 'Color', 'red', 'LineWidth', 1);
    plot([(lens.rightPosition+lens.leftPosition)/2 (lens.rightPosition+lens.leftPosition)/2], [lens.height lens.height+2], 'Color', 'red', 'LineWidth', 1);
    plot([(lens.rightPosition+lens.leftPosition)/2 (lens.rightPosition+lens.leftPosition)/2], [-lens.height -lens.height-2], 'Color', 'red', 'LineWidth', 1);
end

