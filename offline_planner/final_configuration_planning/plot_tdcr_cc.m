function [ fig ] = plot_tdcr_cc( T1_cc,T2_cc,T3_cc)

    radius1=2;
    radius2=2;
    radius3=2;

    hold on;
   plot([-0.02 0.02],[0 0],'Color',[0.7 0.7 0.7],'LineWidth', 5)
    plot(T3_cc(:,13),T3_cc(:,14),'Color',[0 0.4470 0.7410],'LineWidth',radius3);
    plot(T2_cc(:,13),T2_cc(:,14),'Color',[0.8500 0.3250 0.0980],'LineWidth',radius2);
    plot(T1_cc(:,13),T1_cc(:,14),'Color',[0.9290 0.6940 0.1250],'LineWidth',radius1);
%     plot(T3_cc(:,13),T3_cc(:,14),'Color',[0.005*i 1-0.005*i 1-0.005*i],'LineWidth',radius3);
%     plot(T2_cc(:,13),T2_cc(:,14),'Color',[0.005*i 1-0.005*i 1-0.005*i],'LineWidth',radius2);
%     plot(T1_cc(:,13),T1_cc(:,14),'Color',[0.005*i 1-0.005*i 1-0.005*i],'LineWidth',radius1);
    scatter(T1_cc(end,13),T1_cc(end,14),'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor',[0 0 0], 'LineWidth',2)
    scatter(T2_cc(end,13),T2_cc(end,14),'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor',[0 0 0], 'LineWidth',2)
    scatter(T3_cc(end,13),T3_cc(end,14),'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor',[0 0 0], 'LineWidth',2)
    %legend('Third Section','Second Section',"First Section","Section Seperation")
    title('2-D Continuum Robot')
    xlabel('X - Position')
    ylabel('Y - Position')
    hold off;

end
