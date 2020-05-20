%% solrad_test.m

phi  = 54;       

ndl = solrad(phi);

%%

f = figure;
f.Position = f.Position.*[1 1 1 0.7];
clf
plot(1:366, ndl(:,2), 'LineWidth', 4)
axis([1 366 0 1.1])
title('SOLAR RADIATION')
xlabel('Day of Year') ; ylabel('Normalized day length')
hold on
