function plotLens( lens )
%We will only draw rays as they propagate outside the lens
%The lens will be drawn as shown here, but no ray will appear inside the
%lens
    hold on;
    plot([lens.leftPosition lens.leftPosition], [-lens.height lens.height], 'Color', 'blue', 'LineWidth', 1);
    plot([lens.rightPosition lens.rightPosition], [-lens.height lens.height], 'Color', 'blue', 'LineWidth', 1);

end

