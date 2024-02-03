%% Calcualte tSNE score

sumT = varfun(@mean,allGroup3Cyt,'GroupingVariable','Code','InputVariables',{'tSNE1','tSNE2'});
sumT(:,'GroupCount') = [];
allGroup3Cyt = join(allGroup3Cyt,sumT,'Keys','Code');

allGroup3Cyt.dtSNE1 = allGroup3Cyt.tSNE1-allGroup3Cyt.mean_tSNE1;
allGroup3Cyt.dtSNE2 = allGroup3Cyt.tSNE2-allGroup3Cyt.mean_tSNE2;
allGroup3Cyt.ddSNE = sqrt(allGroup3Cyt.dtSNE1.^2 + allGroup3Cyt.dtSNE2.^2);

sumT = varfun(@mean,allGroup3Cyt,'GroupingVariable','Code','InputVariables','ddSNE');
sumT(:,'GroupCount') = [];
sumGroup3Cyt = join(sumGroup3Cyt,sumT,'Keys','Code');
figure,scatter(sumGroup3Cyt.EM7dist,sumGroup3Cyt.mean_ddSNE);
lsline


%% Calculate EM7_distr (new 2021/07/13)

test1 = allGroup1Cyt;

test1.EMGM7_1 = zeros(size(test1,1),1);
test1.EMGM7_2 = zeros(size(test1,1),1);
test1.EMGM7_3 = zeros(size(test1,1),1);
test1.EMGM7_4 = zeros(size(test1,1),1);
test1.EMGM7_5 = zeros(size(test1,1),1);
test1.EMGM7_6 = zeros(size(test1,1),1);
test1.EMGM7_7 = zeros(size(test1,1),1);

test1.EMGM7_1(test1.EMGM7new==1) = 1;
test1.EMGM7_2(test1.EMGM7new==2) = 1;
test1.EMGM7_3(test1.EMGM7new==3) = 1;
test1.EMGM7_4(test1.EMGM7new==4) = 1;
test1.EMGM7_5(test1.EMGM7new==5) = 1;
test1.EMGM7_6(test1.EMGM7new==6) = 1;
test1.EMGM7_7(test1.EMGM7new==7) = 1;

allGroup1Cyt = test1;
sumGroup1Cyt = varfun(@mean,allGroup1Cyt,'GroupingVariable','Code');

temp1 = pdist2(sumGroup1Cyt{:,88:94},mean(sumGroup1Cyt{:,88:94}),'euclidean');
sumGroup1Cyt.EM7distNew = temp1;
