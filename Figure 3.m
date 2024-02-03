%% Analysis BRCA data for revision 2023
%  Jerry Lin 2023/01/14

%% Boxplot with stats (ER/HER2) Fig 3A/B
sum1 = sumHTMA226k;
marker1 = 'mean_ER_PEp';
groupname = 'ER_SCORE';
sum1 = sum1(~ismember(sum1{:,groupname},'N/A'),:);

figure,myboxplot4(sum1{:,marker1}*100,sum1{:,groupname});
ytickformat('percentage');
xlabel('ER (pathologist review)','FontSize',14);
ylabel('%ER positive per core(CyCIF)','FontSize',14);
title('ER - TMA226: IHC vs. CyCIF','FontSize',16);
set(gcf,'Color','w');


%% Boxplot with stats (IHC/CyCIF)  Fig 3C

sum1 = sumHTMA226k;
sum1 = join(sum1,tableHER2ap_TMA226,'keys','ROI');

figure,myboxplot4(log(sum1.mean_HER2_TF),floor(sum1.prc_her2/25));
ylabel('CyCIF mean intensity (log scale)');
xlabel('Aperio IHC HER2 % postive)');
title('IHC versus CyCIF (HER2)','FontSize',16);
