%% Pixel-by-pixel  (read images)

filename = 'PR_allABs_A253.tif';
slice = 6;

temp1 = imread(filename,1);
temp1 = double(temp1(:));
Pixelarray = repmat(temp1,1,slice);

for s=2:slice
    temp1 = imread(filename,s);
    temp1 = double(temp1(:));
    Pixelarray(:,s)=temp1;
end

PRpixel = Pixelarray;
corrplot(log(datasample(PRpixel,5000)),'varNames',{'DNA','ab1','ab2','ab3','ab4','ab5'},'title','PR antibodies','axScale',0.8);
set(gcf,'units','normalized','outerposition',[0.5 0 0.5 1]);

%% Pixel-by-pixel  (ER)

filename = 'ER_allAB_B254.tif';
slice = 4;

temp1 = imread(filename,1);
temp1 = double(temp1(:));
Pixelarray = repmat(temp1,1,slice);

for s=2:slice
    temp1 = imread(filename,s);
    temp1 = double(temp1(:));
    Pixelarray(:,s)=temp1;
end

ERpixel = Pixelarray;

corrplot(log(datasample(ERpixel,5000)),'varNames',{'DNA','ab1','ab2','ab3'},'title','ER antibodies');
set(gcf,'units','normalized','outerposition',[0.5 0 0.5 1]);

%% Pixel-by-pixel  (AR)

filename = 'AR_allAB_C587.tif';
slice = 4;

temp1 = imread(filename,1);
temp1 = double(temp1(:));
Pixelarray = repmat(temp1,1,slice);

for s=2:slice
    temp1 = imread(filename,s);
    temp1 = double(temp1(:));
    Pixelarray(:,s)=temp1;
end

ARpixel = Pixelarray;

corrplot(log(datasample(ARpixel,5000)),'varNames',{'DNA','ab1','ab2','ab3'},'title','AR antibodies');
set(gcf,'units','normalized','outerposition',[0.5 0 0.5 1]);

%% Pixel-by-pixel  (HER2)

filename = 'HER2_allAB_D499.tif';
slice = 6;

temp1 = imread(filename,1);
temp1 = double(temp1(:));
Pixelarray = repmat(temp1,1,slice);

for s=2:slice
    temp1 = imread(filename,s);
    temp1 = double(temp1(:));
    Pixelarray(:,s)=temp1;
end

HER2pixel = Pixelarray;

corrplot(log(datasample(HER2pixel,5000)),'varNames',{'DNA','ab1','ab2','ab3','ab4','ab5'},'title','HER2 antibodies');
set(gcf,'units','normalized','outerposition',[0.5 0 0.5 1]);

%% Pixel-by-pixel  (AR)

filename = 'p53_allAB_B153.tif';
slice = 4;

temp1 = imread(filename,1);
temp1 = double(temp1(:));
Pixelarray = repmat(temp1,1,slice);

for s=2:slice
    temp1 = imread(filename,s);
    temp1 = double(temp1(:));
    Pixelarray(:,s)=temp1;
end

p53pixel = Pixelarray;

corrplot(log(datasample(p53pixel,5000)),'varNames',{'DNA','ab1','ab2','ab3'},'title','p53 antibodies');
set(gcf,'units','normalized','outerposition',[0.5 0 0.5 1]);

%% Cell-by-Cell p53;

Cells_p53 = dataBC03_Broi{:,{'Hoechst_2','Cy5_2','FITC_5','Cy5_5'}};

corrplot(log(datasample(Cells_p53,5000)),'varNames',{'DNA','ab1','ab2','ab3'},'title','p53 antibodies','axScale',0.35);
set(gcf,'units','normalized','outerposition',[0.5 0 0.5 1]);

%% Cell-by-Cell AR;

Cells_AR = dataBC03_Croi{:,{'Hoechst_2','Cy5_2','Cy3_3','Cy5_3'}};

corrplot(log(datasample(Cells_AR,5000)),'varNames',{'DNA','ab1','ab2','ab3'},'title','AR antibodies','axScale',0.5);
set(gcf,'units','normalized','outerposition',[0.5 0 0.5 1]);

%% Cell-by-Cell ER;

Cells_ER = dataBC03_Broi{:,{'Hoechst_2','FITC_2','Cy3_3','Cy3_4'}};

corrplot(log(datasample(Cells_ER,5000)),'varNames',{'DNA','ab1','ab2','ab3'},'title','ER antibodies','axScale',0.7);
set(gcf,'units','normalized','outerposition',[0.5 0 0.5 1]);

%% Cell-by-Cell PR;

Cells_PR = dataBC03_Aroi{:,{'Hoechst_2','Cy5_2','FITC_3','Cy3_3','Cy5_3','Cy5_4'}};

corrplot(log(datasample(Cells_PR,5000)),'varNames',{'DNA','ab1','ab2','ab3','ab4','ab5'},'title','PR antibodies','axScale',0.5);
set(gcf,'units','normalized','outerposition',[0.5 0 0.5 1]);

%% Cell-by-Cell HER2;

Cells_HER2 = dataBC03_Droi{:,{'Hoechst_2','FITC_2','FITC_3','Cy3_3','Cy5_3','Cy5_4'}};

corrplot(log(datasample(Cells_PR,5000)),'varNames',{'DNA','ab1','ab2','ab3','ab4','ab5'},'title','HER2 antibodies','axScale',0.45);
set(gcf,'units','normalized','outerposition',[0.5 0 0.5 1]);


%% Dynamic ranges

marker = 'p53';
labels = {'DNA','ab1','ab2','ab3'};

data1 = eval(strcat(marker,'pixel'));
figure('units','normalized','outerposition',[0.5 0.5 0.5 0.5]);
subplot(1,2,1);
boxplot(log(data1),'label',labels);
title(strcat(marker,{' dynamic range (by pixels)'}),'FontSize',16);
%set(gca,'xticklabels',{'DNA','ab1','ab2','ab3','ab4','ab5'});
ylabel('Fluorescent intensity (log scale)');

data1 = eval(strcat('Cells_',marker));
subplot(1,2,2);
boxplot(log(data1),'label',labels);
title(strcat(marker,{' dynamic range (by cells)'}),'FontSize',16);
%set(gca,'xticklabels',{'DNA','ab1','ab2','ab3','ab4','ab5'});
ylabel('Fluorescent intensity (log scale)');

%% Core-2-core & cell-2-cell;

antibody = 'AR';

marker1 = 'Cy5_2';
gate1 = 8.75;

marker2 = 'Cy5_3';
gate2 = 7.8;

marker3 = antibody;

celldata = datasample(dataBC03_Croi,30000);
coredata = sumC_Kp;

figure('units','normalized','outerposition',[0 0.45 1 0.55]);

%---Cell2Cell plot---
subplot(1,3,1);

dscatter(log(celldata{:,marker1}),log(celldata{:,marker2}));
xlims = xlim;
ylims = ylim;
line([gate1 gate1],ylims,'Color','k','LineStyle','--');
line(xlims,[gate2 gate2],'Color','k','LineStyle','--');
[r,p]=corr(log(celldata{:,marker1}),log(celldata{:,marker2}));

xlabel('Clinical AB (single-cell)');
ylabel('CyCIF AB (single-cell)');
title(strcat('r=',num2str(r,'%0.2f'),';p=',num2str(p,'%0.3f')));

%---Core2Core (Intensity) plot---
subplot(1,3,2);
marker1 = strcat('mean_',marker1);
marker2 = strcat('mean_',marker2);
scatter(log(coredata{:,marker1}),log(coredata{:,marker2}),80,coredata{:,marker3},'fill');colormap(jet);
h=colorbar;
title(h,{'IHC','score'},'FontSize',8)
[r,p]=corr(log(coredata{:,marker1}),log(coredata{:,marker2}),'rows','complete');

lsline
xlabel('Clinical AB (Intensity)');
ylabel('CyCIF AB (Intensity)');
%title(strcat(antibody,':core2core'));
title(strcat('r=',num2str(r,'%0.2f'),';p=',num2str(p,'%0.3f')));

%---Core2Core (gated) plot---
subplot(1,3,3);
marker1 = strcat(marker1,'p');
marker2 = strcat(marker2,'p');
scatter(coredata{:,marker1},coredata{:,marker2},80,coredata{:,marker3},'fill');colormap(jet);
h=colorbar;
title(h,{'IHC','score'},'FontSize',8)
[r,p]=corr(coredata{:,marker1},coredata{:,marker2},'rows','complete');
lsline
xlabel('Clinical AB (Positivity)');
ylabel('CyCIF AB (Positivity)');
%title(strcat(antibody,':core2core'));
title(strcat('r=',num2str(r,'%0.2f'),';p=',num2str(p,'%0.3f')));

%% IHC comparison
antibody = 'HER2';

marker1 = 'FITC_2';     %Clinical ab

marker2 = 'Cy5_4';      %CycIF ab

data1 = sumD_Kp;

figure('units','normalized','outerposition',[0.5 0.5 0.5 0.5]);
subplot(1,2,1);
scatter(data1{:,antibody},data1{:,strcat('mean_',marker1,'p')},50,'g','fill');
[r1,~]=corr(data1{:,antibody},data1{:,strcat('mean_',marker1,'p')});

lsline
hold on;
scatter(data1{:,antibody},data1{:,strcat('mean_',marker2,'p')},50,'b','fill');
[r2,~]= corr(data1{:,antibody},data1{:,strcat('mean_',marker2,'p')});
lsline;

xlabel(strcat(antibody,{' score(Aperio)'}));
ylabel('Postivie ratio via IF');
legend(strcat('Clinical(r=',num2str(r1,'%0.2f'),')'),'regression',strcat('CyCIF(r=',num2str(r2,'%0.2f'),')'));
title(strcat({'IFvsIHC '},antibody),'FontSize',18);

subplot(1,2,2);
boxplot(log(data1{:,strcat('mean_',marker2)}),round(data1{:,antibody}/25)*25);
title('CycIF versus IHC');
xlabel(strcat(antibody,{' score(Aperio)'}));
ylabel('Mean intensity(log scale)');

%% IHC comparison (HTMA226)
antibody = 'HER2';

marker1 = 'HER2_TF';     %Clinical ab

marker2 = 'HER2_647';      %CycIF ab

data1 = sumHTMA227B;

figure('units','normalized','outerposition',[0.5 0.5 0.5 0.5]);
subplot(1,2,1);
scatter(data1{:,strcat(antibody,'_Positive')},data1{:,strcat('mean_',marker1,'p')},50,'g','fill');
[r1,~]=corr(data1{:,strcat(antibody,'_Positive')},data1{:,strcat('mean_',marker1,'p')});

lsline
hold on;
scatter(data1{:,strcat(antibody,'_Positive')},data1{:,strcat('mean_',marker2,'p')},50,'b','fill');
[r2,~]= corr(data1{:,strcat(antibody,'_Positive')},data1{:,strcat('mean_',marker2,'p')});
lsline;

xlabel(strcat(antibody,{' score(Aperio)'}));
ylabel('Postivie ratio via IF');
legend(strcat('Clinical(r=',num2str(r1,'%0.2f'),')'),'regression',strcat('CyCIF(r=',num2str(r2,'%0.2f'),')'));
title(strcat({'IFvsIHC '},antibody),'FontSize',18);

subplot(1,2,2);
boxplot(log(data1{:,strcat('mean_',marker2)}),round(data1{:,strcat(antibody,'_Positive')}/25)*25);
title('CycIF versus IHC');
xlabel(strcat(antibody,{' score(Aperio)'}));
ylabel('Mean intensity(log scale)');


%% IHC comparison (HTMA227/intensity)
antibody = 'HER2';

marker1 = 'HER2_TF';     %Clinical ab

marker2 = 'HER2_647';      %CycIF ab

data1 = sumHTMA227B;

figure('units','normalized','outerposition',[0.5 0.5 0.5 0.5]);
subplot(1,2,1);
scatter(data1{:,strcat(antibody,'_Positive')},log(data1{:,strcat('mean_',marker1)}),50,'g','fill');
[r1,~]=corr(data1{:,strcat(antibody,'_Positive')},log(data1{:,strcat('mean_',marker1)}));

lsline
hold on;
scatter(data1{:,strcat(antibody,'_Positive')},log(data1{:,strcat('mean_',marker2)}),50,'b','fill');
[r2,~]= corr(data1{:,strcat(antibody,'_Positive')},log(data1{:,strcat('mean_',marker2)}));
lsline;

xlabel(strcat(antibody,{' score(Aperio)'}));
ylabel('Mean intensity(log scale)');
legend(strcat('Clinical(r=',num2str(r1,'%0.2f'),')'),'regression',strcat('CyCIF(r=',num2str(r2,'%0.2f'),')'));
title(strcat({'IFvsIHC '},antibody),'FontSize',18);

subplot(1,2,2);
boxplot((data1{:,strcat('mean_',marker2,'p')}),round(data1{:,strcat(antibody,'_Positive')}/25)*25);
title('CycIF versus IHC');
xlabel(strcat(antibody,{' score(Aperio)'}));
ylabel('Postivie ratio via IF');

%% Gating core-by-core

data1 = dataBC03_Broi;

data1.ERCp = repmat(0,length(data1.Xt),1);

for ROI =1:48
    temp1 = data1(data1.ROI==ROI,:);
    if size(temp1,1)>200
        [temp1.ERCp,~,~]=CycIF_visualgate_Shu(temp1,'FITC_2',0.05,2);
        data1(data1.ROI==ROI,:)=temp1;
        close all;
    end
end

data1K = data1(data1.Cy3_5p==1,:);
sum1K = varfun(@mean,data1,'GroupinVariable','ROI');
sum1K = sum1K(sum1K.ROI>0,:);
sum1K = sum1K(sum1K.GroupCount>200,:);
