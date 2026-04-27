%%
% Exp 1

clc;clear
load("Exp1.mat")


handEndAngle=removeoutlier(handEndAngle,3);
numTrials=length(handEndAngle);

figure(1223); subplot(2,1,1);hold on

plot(-nanmean(handEndAngle(:,:),2),'m-','linewidth',1)
plot(-(rotation(:,1)),'k','linewidth',1)

se=nanstd(handEndAngle')./sqrt(subnum-1);
averag=-nanmean(handEndAngle');
fill([1:numTrials numTrials:-1:1],[averag+se averag(end:-1:1)-se(end:-1:1)],'r','EdgeColor','none','FaceAlpha',0.3)
plot(averag,'-r','linewidth',1,'markersize',10)
ax = gca;
ax.YAxis.TickDirection = 'out';
ax.XAxis.TickDirection = 'out';
axis([0 420 -90 90])


%%
% Exp 1 Control
clc; clear
load('Exp1_Control')

gray = [0.5 0.5 0.5];

figure(1223); subplot(2,1,1); hold on
numTrials = length(handEndAngle);

plot(-(rotation(:,1)), 'k', 'linewidth', 1)                  % keep rotation black
se     = nanstd(handEndAngle')./sqrt(subnum-1);
averag = nanmean(handEndAngle');

fill([1:numTrials numTrials:-1:1], ...
     [averag+se averag(end:-1:1)-se(end:-1:1)], ...
     gray, 'EdgeColor','none', 'FaceAlpha',0.3);
plot(averag, '-', 'Color', gray, 'linewidth', 1, 'markersize', 10)

ax = gca; ax.YAxis.TickDirection = 'out'; ax.XAxis.TickDirection = 'out';
axis([0 420 -90 90])

%%
clear
% Exp 2 ProbI  (→ light orange)
load('Exp2ProbI')
numTrials = length(handEndAngle);

lightOrange = [1.00 0.75 0.45];


figure(1223); subplot(2,1,2); hold on
x = 108-17:(417+7)-17;

plot(x, -(rotation(:,1)), 'k', 'linewidth', 1)               % keep rotation black

se     = nanstd(handEndAngle')./sqrt(subnum-1);
averag = -nanmean(handEndAngle');

fill([1:numTrials numTrials:-1:1] + 107-17, ...
     [averag+se averag(end:-1:1)-se(end:-1:1)], ...
     lightOrange, 'EdgeColor','none', 'FaceAlpha',0.3);
plot(x, averag, '-', 'Color', lightOrange, 'linewidth', 1, 'markersize', 10)

ax = gca; ax.YAxis.TickDirection = 'out'; ax.XAxis.TickDirection = 'out';
axis([0 420 -90 90]); axis([120 420 -10 90])

%%
clear
% Exp 2 ProbE  (→ light blue)
load('Exp2ProbE')


numTrials = length(handEndAngle);
lightBlue = [0.55 0.75 0.95];

figure(1223); subplot(2,1,2); hold on

% mean trace (was 'm-'): switch to light blue
plot(-nanmean(handEndAngle(:,:),2), '-', 'Color', lightBlue, 'linewidth', 1)

% rotation stays black
plot(-(rotation(:,1)), 'k', 'linewidth', 1)

se     = nanstd(handEndAngle')./sqrt(subnum-1);
averag = -nanmean(handEndAngle');

fill([1:numTrials numTrials:-1:1], ...
     [averag+se averag(end:-1:1)-se(end:-1:1)], ...
     lightBlue, 'EdgeColor','none', 'FaceAlpha',0.3);
plot(averag, '-', 'Color', lightBlue, 'linewidth', 1, 'markersize', 10)

ax = gca; ax.YAxis.TickDirection = 'out'; ax.XAxis.TickDirection = 'out';
axis([120 420 -10 90])
%%
clc; clear
load('Exp3_aim')

commonhandEndAngle=squeeze(nanmean((reshape(handEndAngle,6,95,subnum))));
commonrt=squeeze(nanmean((reshape(rt,6,95,subnum))));

figure(443); 
subplot(2,1,1);hold on
%plot(-nanmean(commonhandEndAngle(1:50,:),2),'m-','linewidth',1)
plot((-rotation(1:6:50*6,1)),'k','linewidth',1)

se=nanstd(commonhandEndAngle(1:50,:)')./sqrt(subnum);
averag=-nanmean(commonhandEndAngle(1:50,:)');
fill([1:50 50:-1:1],[averag+se averag(end:-1:1)-se(end:-1:1)],'r','EdgeColor','none','FaceAlpha',0.3)
plot(averag,'-r','linewidth',1,'markersize',10)

color=[1 0.5 0.5];
se=nanstd(commonhandEndAngle(59:94,:)')./sqrt(subnum);
averag=-nanmean(commonhandEndAngle(59:94,:)');
fill([19:19+31+4 19+31+4:-1:19]-4,[averag+se averag(end:-1:1)-se(end:-1:1)],color,'EdgeColor','none','FaceAlpha',0.3)
plot([19:19+31+4]-4,averag,'-','color',color,'linewidth',1,'markersize',10)
ax = gca;
ax.YAxis.TickDirection = 'out';
ax.XAxis.TickDirection = 'out';
set(gca,'xtick',[0:10:200]);

subplot(2,1,2);hold on
diff=commonhandEndAngle(59:90-4,:)-commonhandEndAngle(18:45,:);
se=nanstd(diff')./sqrt(subnum);
averag=-nanmean(diff');
fill([1:28 28:-1:1],[averag+se averag(end:-1:1)-se(end:-1:1)],'r','EdgeColor','none','FaceAlpha',0.3)
plot(averag,'-r','linewidth',1,'markersize',10)
ax = gca;
ax.YAxis.TickDirection = 'out';
ax.XAxis.TickDirection = 'out';
set(gca,'xtick',[0:10:200]);

%%
clear
load("Exp3_Clamp.mat")


figure; subplot(2,1,1);hold on
handEndAngle=hand_common_bin_angle;
l1=[1:50];
l2=[69:105];

se=nanstd(handEndAngle(l1,:)')./sqrt(subnum-1);
averag=nanmean(handEndAngle(l1,:)');
fill([1:length(averag) length(averag):-1:1],[averag+se averag(end:-1:1)-se(end:-1:1)],'b','EdgeColor','none','FaceAlpha',0.3)
plot(1:length(averag),averag,'-b','linewidth',1,'markersize',10)
color=[0.5 0.5 1];
se=nanstd(handEndAngle(l2,:)')./sqrt(subnum-1);
averag=nanmean(handEndAngle(l2,:)');
fill([1:length(averag) length(averag):-1:1]+14,[averag+se averag(end:-1:1)-se(end:-1:1)],color,'EdgeColor','none','FaceAlpha',0.3)
plot([1:length(averag)]+14,averag,'-b','color',color,'linewidth',1,'markersize',10)

ax = gca;
ax.YAxis.TickDirection = 'out';
ax.XAxis.TickDirection = 'out';
set(gca,'xtick',[0:10:200]);
axis([0 50 -0 30])

figure(443);subplot(2,1,2);hold on

l1=[15:45];
l2=[70:100];

diff=-handEndAngle(l1,:)'+handEndAngle(l2,:)';
se=nanstd(diff)./sqrt(subnum-1);
averag=nanmean(diff);
fill([1:length(averag) length(averag):-1:1],[averag+se averag(end:-1:1)-se(end:-1:1)],'b','EdgeColor','none','FaceAlpha',0.3)
plot(1:length(averag),averag,'-b','linewidth',1,'markersize',10)

ax = gca;
ax.YAxis.TickDirection = 'out';
ax.XAxis.TickDirection = 'out';
set(gca,'xtick',[0:10:200]);
axis([0 28 -15 15])

%%
clear;
load('Exp4_Clamp')


figure(222); subplot(2,1,1); hold on
handEndAngle=-hand_common_bin_angle;

se=nanstd(handEndAngle')./sqrt(subnum);
bl=handEndAngle(1:20,:);
handEndAngle(1:20,:)=bl;

se=nanstd(bl')./sqrt(subnum-1);
averag=nanmean(bl');
fill([1:20 20:-1:1],[averag+se averag(end:-1:1)-se(end:-1:1)],'b','EdgeColor','none','FaceAlpha',0.3)
plot(averag,'-b','linewidth',1,'markersize',10)

se=nanstd(handEndAngle(21:40,:)')./sqrt(subnum-1);
averag=nanmean(handEndAngle(21:40,:)');
fill([21:40 40:-1:21],[averag+se averag(end:-1:1)-se(end:-1:1)],'b','EdgeColor','none','FaceAlpha',0.3)
plot(21:40,averag,'-b','linewidth',1,'markersize',10)

se=nanstd(handEndAngle(41:70,:)')./sqrt(subnum-1);
averag=nanmean(handEndAngle(41:70,:)');
fill([41:70 70:-1:41],[averag+se averag(end:-1:1)-se(end:-1:1)],'b','EdgeColor','none','FaceAlpha',0.3)
plot(41:70,averag,'-b','linewidth',1,'markersize',10)

se=nanstd(handEndAngle(71:100,:)')./sqrt(subnum-1);
averag=nanmean(handEndAngle(71:100,:)');
fill([71:100 100:-1:71],[averag+se averag(end:-1:1)-se(end:-1:1)],'b','EdgeColor','none','FaceAlpha',0.3)
plot(71:100,averag,'-b','linewidth',1,'markersize',10)

se=nanstd(handEndAngle(101:120,:)')./sqrt(subnum-1);
averag=nanmean(handEndAngle(101:120,:)');
fill([101:120 120:-1:101],[averag+se averag(end:-1:1)-se(end:-1:1)],'b','EdgeColor','none','FaceAlpha',0.3)
plot(101:120,averag,'-b','linewidth',1,'markersize',10)

se=nanstd(handEndAngle(122:140,:)')./sqrt(subnum-1);
averag=nanmean(handEndAngle(122:140,:)');
fill([122:140 140:-1:122],[averag+se averag(end:-1:1)-se(end:-1:1)],'b','EdgeColor','none','FaceAlpha',0.3)
plot(122:140,averag,'-b','linewidth',1,'markersize',10)

rest=[40 70 100 ];

for r=1:3
plot([rest(r) rest(r)],[-100 100],'k--')
end

axis([0 210 -8 34])

set(gca,'xtick',[20:60:200]);
ax = gca;
ax.YAxis.TickDirection = 'out';
ax.XAxis.TickDirection = 'out';

%%
clear
load('Exp4_aim.mat')

figure(222); subplot(2,1,2);hold on

bl=handEndAngle(1:20,:);
bl=removeoutlier(bl,2.5);

se=nanstd(bl')./sqrt(subnum-1);
averag=nanmean(bl');
fill([1:20 20:-1:1],[averag+se averag(end:-1:1)-se(end:-1:1)],'r','EdgeColor','none','FaceAlpha',0.3)
plot(averag,'-r','linewidth',1,'markersize',10)


se=nanstd(handEndAngle(21:40,:)')./sqrt(subnum-1);
averag=nanmean(handEndAngle(21:40,:)');
fill([21:40 40:-1:21],[averag+se averag(end:-1:1)-se(end:-1:1)],'r','EdgeColor','none','FaceAlpha',0.3)
plot(21:40,averag,'-r','linewidth',1,'markersize',10)

se=nanstd(handEndAngle(41:70,:)')./sqrt(subnum-1);
averag=nanmean(handEndAngle(41:70,:)');
fill([41:70 70:-1:41],[averag+se averag(end:-1:1)-se(end:-1:1)],'r','EdgeColor','none','FaceAlpha',0.3)
plot(41:70,averag,'-r','linewidth',1,'markersize',10)

se=nanstd(handEndAngle(71:100,:)')./sqrt(subnum-1);
averag=nanmean(handEndAngle(71:100,:)');
fill([71:100 100:-1:71],[averag+se averag(end:-1:1)-se(end:-1:1)],'r','EdgeColor','none','FaceAlpha',0.3)
plot(71:100,averag,'-r','linewidth',1,'markersize',10)


se=nanstd(handEndAngle(101:120,:)')./sqrt(subnum-1);
averag=nanmean(handEndAngle(101:120,:)');
fill([101:120 120:-1:101],[averag+se averag(end:-1:1)-se(end:-1:1)],'r','EdgeColor','none','FaceAlpha',0.3)
plot(101:120,averag,'-r','linewidth',1,'markersize',10)


afe=handEndAngle(121:140,:);
afe(1,[13 14 21])=nan;
afe=removeoutlier(afe,2.5);
se=nanstd(afe')./sqrt(subnum-1);
averag=nanmean(afe');
fill([121:140 140:-1:121],[averag+se averag(end:-1:1)-se(end:-1:1)],'r','EdgeColor','none','FaceAlpha',0.3)
plot(121:140,averag,'-r','linewidth',1,'markersize',10)


ax = gca;
ax.YAxis.TickDirection = 'out';
ax.XAxis.TickDirection = 'out';
axis([0 210 -8 34])


rest=[40 70 100];

for r=1:3
plot([rest(r) rest(r)],[-100 100],'k--')
end
set(gca,'xtick',[20:60:200]);
ax = gca;
ax.YAxis.TickDirection = 'out';
ax.XAxis.TickDirection = 'out';




