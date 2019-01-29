%% Create dataset.

%%
nItset=[1000, 10000, 100000];
performance = zeros(3, 1);
confmats = zeros(10,10,3);
count = 1;
figure1 = figure;
figure2 = figure;
if (1)
    load mnistabridged.mat;
    N = length(trainlabels);
    DesOut = zeros(N,10);
    for j = 1:N
        y = zeros(1,10);
        y(trainlabels(j)+1) = 1;
        DesOut(j,:) = y;
    end
end

for nIts = nItset
InPat = double(train)'/255;
deltaRuleTrain;

%%
[a,b] = max(Out');
[a,c] = max(DesOut');

N = size(DesOut,1);
confmat = zeros(10,10);
for i = 1:N
    confmat(b(i),c(i)) = confmat(b(i),c(i)) + 1;
end
confmats(:,:,count) = confmat;
perc_corr = sum(diag(confmat))/sum(sum(confmat))*100;
performance(count) = perc_corr;
count = count + 1;
disp(['Percent Correct = ' num2str(perc_corr)]);
endfor

figure1 = bar(performance);
xlabel("Number of Iterations");
ylabel("percentage correct");
Labels = ["1000"; "10000"; "100000"];
set(gca,'XTickLabel', Labels);




