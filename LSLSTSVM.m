function [err,Predict_Y,A,B,x1,x2] = LSLSTSVM(TestX,DataTrain,FunPara)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Proposed LSLSTSVM: Large Scale Least Squares Twin SVMs
%
% Predict_Y = LSLSTSVM(TestX,DataTrain,FunPara)
% 
%   Input:
%    TestX - Test Data matrix.
%
%    DataTrain -input Data matrix for training.
%              
%    FunPara -  c1: [0,inf] Paramter to tune the weight. 
%               c2: [0,inf] Paramter to tune the weight. 
% 

% Output:
%    Predict_Y - Predict value of the TestX.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55

%tic;
% clear all;




[no_input,no_col]=size(DataTrain);
obsD = DataTrain(:,no_col);
for i = 1:no_input
    if obsD(i,1) ~= 1
        obsD(i,1) = -1;
    end
end
 obs = obsD;    
% obs =DataTrain(:,no_col);    

 %A = zeros(1,no_col-1);
 %B = zeros(1,no_col-1);

 A=DataTrain(obs==1,1:end-1);
 B=DataTrain(obs==-1,1:end-1);
 
 clear DataTrain obs obsD;
 
%for i = 1:no_input
%    if(obs(i) == 1)
%        A = [A;DataTrain(i,1:no_col-1)];
%    else
%        B = [B;DataTrain(i,1:no_col-1)];
%    end
%end
%[rowA,n]=size(A); [rowB,n]=size(B);
 % A=A(2:rowA,:);  B=B(2:rowB,:);
  
c1 = FunPara.c1;
c2 = FunPara.c2;
c3 = FunPara.c3;
c4 = FunPara.c4;
kerfPara = FunPara.kerfPara;
p=size(A,1);
q=size(B,1);
% e1=ones(q,1);
% e2=ones(p,1);
eps=FunPara.eps;
v1=[zeros(1,p) ones(1,q)];
v2=[zeros(1,q) ones(1,p)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute Kernel 
% Compute (w1,b1) and (w2,b2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%if strcmp(kerfPara.type,'lin')
 %   AA=A*A'; %+ c3*eye(p);
  %  AB=A*B';
   % BA=B*A';
    %BB=B*B'; %+ c3*eye(q)/c1;
%else
%      X=[A;B];
%     AA=kernelfun(A,kerfPara,A);
%     AB=kernelfun(A,kerfPara,B);
%     BA=kernelfun(B,kerfPara,A);
%     BB=kernelfun(B,kerfPara,B);
%end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Compute (w1,b1) and (w2,b2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%DRLSTBSVM1

% AA1=A*A' + c3*eye(p);
% BB1=B*B' + c3*eye(q)/c1;
% Q1=[AA1 AB;BA BB1];
Q=[kernelfun(A,kerfPara,A)+c3*eye(p),kernelfun(A,kerfPara,B);kernelfun(B,kerfPara,A),kernelfun(B,kerfPara,B)+c3*eye(q)/c1]+ones(p+q);
% E=ones(size(Q1,1));
% Q=Q1+E;

% Q=Q1+ones(size(Q1,1));
%Q=(Q+Q')/2;
x=LSSMO(Q,eps,c3,v1);

clear Q1 Q v1;

%x=bestx
l=size(x,1);
alpha=x(1:p,1);
beta=x(p+1:l,1);


%  memory
%%%%DRLSTBSVM2%%%% 
% clear AA1;
% clear BB1;
clear x;



% AA2=A*A' + c4*eye(p)/c2;
% BB2=B*B' + c4*eye(q);
% H1=[BB2 BA;AB AA2];
H=[kernelfun(B,kerfPara,B)+c4*eye(q),kernelfun(B,kerfPara,A);kernelfun(A,kerfPara,B),kernelfun(A,kerfPara,A)+c4*eye(p)/c2]+ones(p+q);
% E=ones(size(H1,1));
% H=H1+E;
% H=H1+ones(size(H1,1));
%H=(H+H')/2;
y=LSSMO(H,eps,c4,v2);

clear H1 H v2;

%y=besty
l=size(y,1);
lambda=y(1:q,1);
gamma=y(q+1:l,1);
% memory
% clear AA2;
% clear BB2;
clear y;
% clear Q1;
% clear AB;
% clear BA;
% memory


 %   w1=(A'*alpha+B'*beta)/c3;
  %  b1=(e2'*alpha+e1'*beta)/c3;
   % w2=(B'*lambda+A'*gamma)/c4;
    %b2=(e1'*lambda+e2'*gamma)/c4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predict and output
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[no_test,m1]=size(TestX);
obsX = TestX(:,m1);
%if strcmp(kerfPara.type,'lin')
%    w1=(A'*alpha+B'*beta)/c3;
%    b1=(e2'*alpha+e1'*beta)/c3;
%    w2=(B'*lambda+A'*gamma)/c4;
%    b2=(e1'*lambda+e2'*gamma)/c4;
%    P_1=TestX(:,1:m1-1);
%    y1=(P_1*w1+b1);
%   y2=(P_1*w2+b2);    
%else
   % C=[A;B];
   P1=TestX(:,1:m1-1); 
   %P1=kernelfun(TestX(:,1:m1-1),kerfPara,TestX(:,1:m1-1));
  
   clear TestX;
   
   e1=ones(q,1);
    e2=ones(p,1);
   b1=(e2'*alpha+e1'*beta)/c3;
   b2=-(e1'*lambda+e2'*gamma)/c4;
   y1=(kernelfun(P1,kerfPara,A)*alpha+kernelfun(P1,kerfPara,B)*beta)/c3+b1;
   y2=-(kernelfun(P1,kerfPara,B)*lambda+kernelfun(P1,kerfPara,A)*gamma)/c4+b2;
%end
clear P1 kernelfun(P1,kerfPara,A) kernelfun(P1,kerfPara,B) kernelfun(P1,kerfPara,B) kernelfun(P1,kerfPara,A);
clear alpha beta lambda gamma A B e1 e2;
for i=1:size(y1,1)
    if (min(abs(y1(i)),abs(y2(i)))==abs(y1(i)))
        Predict_Y(i,1) = 1;
    else
        Predict_Y(i,1) =-1;
    end
     %dec_bdry(i,1)=min(abs(y1(i)),abs(y2(i)));
end

%[no_test,no_col] = size(TestX);
%obsX = TestX(:,no_col);
clear TestX;
%prob_score=1./(1+exp(-dec_bdry));
% [no_test,no_col] = size(TestX);
x1=[]; x2 =[];err = 0.;
Predict_Y = Predict_Y';
% obsX = TestX(:,no_col);
% clear TestX;
for i=1:no_test
    if obsX(i,1) ~= 1
        obsX(i,1) = -1;
    end
end
obsX;
for i = 1:no_test
    if((Predict_Y(i)) ~= (obsX(i)))
        err = err+1;
    end
end  
%for i=1:no_test
 %   if Predict_Y(i) ==1
 %       x1 = [x1; TestX(i,1:no_col-1)];
 %   else 
 %       x2 = [x2; TestX(i,1:no_col-1)];
 %   end
%end
end