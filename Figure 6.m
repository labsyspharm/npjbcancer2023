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

%% Figure 6B


test1 = sumGroup1Cyt{ismember(sumGroup1Cyt.Code,'Her2-5'),88:94};
test2 = sumGroup1Cyt{ismember(sumGroup1Cyt.Code,'Her2-161'),88:94};
test3 = sumGroup1Cyt{ismember(sumGroup1Cyt.Code,'Her2-164'),88:94};
test4 = sumGroup1Cyt{ismember(sumGroup1Cyt.Code,'Her2-70'),88:94};

figure,bar([test1;test2;test3;test4]'*100);
ytickformat('percentage');
xlabel('Cluster');
ylabel('Percentage of cells');
legend('HER2-5','HER2-161','HER2-164','HER2-70');

%% Figure 6F
figure,myboxplot2(sumGroup1Cyt.EM7distNew,sumGroup1Cyt.RecurrenceN);
title('GMMscore');
xlabel('Recurrence');
set(gca,'xticklabels',{'No','Yes'});

%% Figure 6G

figure,gscatter(sumGroup1Cyt.EM7distNew,sumGroup1Cyt.mean_ddSNE,sumGroup1Cyt.RecurrenceN);
xlabel('GMM score');
ylabel('tSNE score');
title('Recurrence vs. Heterogeneity');
legend('No recurrence','recurrence');
