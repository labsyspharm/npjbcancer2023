%% single-cell heatmap;
EMGM7_markers = {'KERATIN','HER2_647','ER_PE','PR_647','AR_647','p53_647','Ki67','PDL1_647','CD45','CD68','AREA'};
size1 = length(EMGM7_markers);

temp1 = datasample(allGroup1Cyt,4000,'Replace',false);
temp1 = temp1(:,horzcat(EMGM7_markers,'EMGM7new'));
%temp1{:,1:10}= temp1{:,1:10} ./ mean(temp1{:,1:10});
temp1{:,1:size1} = zscore(temp1{:,1:size1},0,1);

%temp1 = sortrows(temp1,'HER2_647','ascend');
temp1 = sortrows(temp1,'EMGM7new','ascend');

figure,
ax1=subplot(13,1,1:12);
imagesc(temp1{:,1:size1}');
colormap(ax1,redbluecmap);
set(gca,'ytick',1:size1);
set(gca,'yticklabels',EMGM7_markers');
set(gca,'xtick',[]);
%set(gca,'xticklabelrotation',90);


caxis([-2 3]);
ax2=subplot(13,1,13);
imagesc(temp1{:,size1+1}');
colormap(ax2,jet(7));
set(gca,'ytick',1);
set(gca,'yticklabels',{'Cluster'});
%set(gca,'xticklabelrotation',90);
set(gca,'xtick',[]);
