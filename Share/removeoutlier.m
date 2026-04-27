function xout = removeoutlier(x,n)

xout=x;
m=nanmean(x);
s=nanstd(x);
f=find(x>m+n*s);
xout(f)=nan;
f=find(x<m-n*s);
xout(f)=nan;

m=nanmean(x,2);
s=nanstd(x,[],2);
f=find(x>m+n*s);
xout(f)=nan;
f=find(x<m-n*s);
xout(f)=nan;

