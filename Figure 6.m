%% boxplot (her2 expression) Fig 6F

figure,myboxplot2(sumGroup1Cyt.mean_HER2_TF,sumGroup1Cyt.RecurrenceN);
title('HER2 expression');
ylabel('Mean Intensity (log scale)');
xlabel('Recurrence');
set(gca,'xticklabels',{'No','Yes'});


%% boxplot (Ki67 positivity) Fig 6F

figure,myboxplot2(sumGroup1Cyt.mean_Ki67p*100,sumGroup1Cyt.RecurrenceN);
ytickformat('percentage');
title('Ki67+ cells');
ylabel('Percent positive');
xlabel('Recurrence');
set(gca,'xticklabels',{'No','Yes'});
