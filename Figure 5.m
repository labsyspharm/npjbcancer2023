%% Violin plots for Fig 5B

markers = {'HER2_TF','Ki67','CD45','CD68','ER_PE','KERATIN','PR_488','AR_647','p53_647','PDL1_647'};
names = {'HER2','Ki67','CD45','CD68','ER','KERATIN','PR','AR','p53','PD-L1'};

data1 = datasample(allGroup1Cyt,2000);
figure('units','normalized','outerposition',[0.5 0 0.5 1]);
for i = 1:length(markers)
    subplot(length(markers)/2,2,i);
    violinplot(data1{:,markers{i}},data1.EMGM7new);
    set(gca,'ytick',[]);
    set(gca,'xticklabel',[]);
    ylabel(names{i});
    if ismember(i,[9,10])
       set(gca,'xticklabel',num2str((1:7)'));
    end
end
