% deltaRuleTrain.m

a=0.1;
tol=0.01;
#nIts=100000;
[nPat,nIn]=size(InPat);
[nPat,nOut]=size(DesOut);
V=rand(nOut,nIn)*2-1;
maxErr=10;

for c=1:nIts,
    pIndx=ceil(rand*nPat);
    d=DesOut(pIndx,:)';
    x=InPat(pIndx,:)';
    q=V*x;
    y=1./(1+exp(-q));
    dy=y.*(1-y);
    e=d-y;
    g=e.*dy;
    deltaV=a*g*x';
    V=V+deltaV;
    if rem(c,20)==0,
        Q=(V*InPat')';
        Out=1./(1+exp(-Q));
        maxErr=sum(abs(DesOut-Out));
        %disp(Out');
        %subplot(2,1,1);
        %plot([1:nPat],DesOut,'ro',[1:nPat],Out,'k+');
        %bar(Out); ylim([0 1]);
        %drawnow;
        %bar(V); drawnow;
    end
    if maxErr<tol, break, end
end














