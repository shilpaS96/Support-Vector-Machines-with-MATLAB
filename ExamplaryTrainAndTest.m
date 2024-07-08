clc;                                 %%%%%%%%%%%%%%   5 foldcross validation
clear all;
close all;
file1 = fopen('LS-TB_Large.txt','w+');
file2 = fopen('results_c_mu_nonlinear.txt','w+');
fprintf(file1,'%s   %s   %8.6s   %8.6s   %8.6s   %8.6s   %8.6s   %8.6s   %8.6s\n', 'ALGO', 'file','mu','ACC','c1','c2','c3','c4','time');
for load_file =45:56
    switch load_file
         case 1
            file='fertility'
            test_start = 71;
        case 2
            file = 'crossplane150',
            test_start = 106;
        case 3
            file = 'monk3';
            test_start = 123; % its a special dataset, cant change test_size
            
            
        case 4
            file = 'monks-1'; % its a special dataset, cant change test_size
            test_start = 125;
            
            
        case 5
            file = 'wpbc';
            test_start = 137;
            
        case 6
            file = 'monk2';
            test_start = 170; % its a special dataset, cant change test_size;
            
        case 7
            file = 'crossplane500';
            test_start = 351;
        case 8
            file= 'breast-cancer-wisconsin';
            test_start = 479;
        case 9
            file = 'blood-transfusion';
            test_start = 525;
        case 10
            file = 'heart-statog';
            test_start = 201;
            
        case 11
            file= 'cleve'
            test_start = 208;
            
        case 12
            file = 'haberman';
            test_start = 216;
            
        case 13
            file = 'bupaliver';
            test_start = 243;
            
            
        case 14
            file = 'Heart-c';
            test_start = 209;
            
            
        case 15
            file = 'haberman';
            test_start = 216;
            
        case 16
            file = 'bupaliver';
            test_start = 243;
            
            
        case 17
            file = 'credit-screening';
            test_start = 484;
            
            
        case 19
            file = 'blood-transfusion';
            test_start = 525;
            
        case 20
            file = 'pima-indian2';
            test_start = 538;
            
        case 21
            file = 'autralian';
            test_start = 541;
            
        case 22
            file = 'cmc';
            test_start = 646;
            
        case 23
            file= 'diabetic RD1151';
            test_start = 807;
            
        case 24
            file= 'Chess (King-Rook vs. King-Pawn)';
            test_start = 960;
            
        case 25
            file = 'bank-note';
            test_start = 961;
            
        case 26
             file = 'acute-nephritis_R';
            test_start = 85;
            
        case 27
            file = 'cylinder-bands_R';
            test_start = 359;
            
        case 28
            file = 'echocardiogram_R';
            test_start = 93;
            
        case 29
            file= 'ndc50k';
            test_start = 50001;
            
            
        case 30
             file= 'ndc8k';
            test_start = 8001;
         
        case 31
             file= 'electrical-grid-stability';
            test_start = 7001;
             
        case 32
           
              file= 'ndc10k';
            test_start = 10001;
           
        case 33
             file = 'ozone_R';
            tets_start = 1776;
            
        case 34
             file = 'chess-krvkp_R';
            test_start = 2238;
%              test_start = 321;
           
        case 35
              file = 'bank_R';
            test_start = 3166;
%             test_start = 453;
            
        case 36
             
             file = 'spambase_R';
%             test_start = 3222;
            test_start = 461;
%            
        case 37
             file = 'twonorm_R';
%             test_start = 5181;
          test_start = 741;
        case 38
            file = 'ringnorm_R';
%             test_start = 5181;
              test_start = 741;    
          
        case 39
             file = 'mushroom_R';
%             test_start = 5688;
              test_start = 813 ; 
           
        case 40
            file = 'magic_R';
%             test_start = 13315;
              test_start = 1903;
       case 41
            file = 'connect-4_R';
            test_start = 47291;
%        test_start = 6757;
           
        
       case 42
             file = 'miniboone_R';
            test_start = 91046;
%                test_start = 13005;
       case 43
            file = 'bank_R';
            test_start = 3166;
        case 44
            file = 'ndc-10k';
            test_start = 10001;
            
        case 45
            file = 'ndc-15k';
            test_start = 15001;
            
        case 46
            file = 'ndc-20k';
            test_start = 20001;
            
        case 47
            file = 'ndc-25k';
            test_start = 25001;
            
        case 48
            file = 'ndc-30k';
            test_start = 30001;
            
        case 49
            file = 'ndc-35k';
            test_start = 35001;
            
        case 50
            file = 'ndc-40k';
            test_start = 40001;
            
        case 51
            file = 'ndc-45k';
            test_start = 45001;
        case 52;
            file = 'ndc-50k';
            test_start = 50001;
            
        case 53;
            file = 'ndc-100k';
            test_start = 100001;
            
            
        case 54
           file = 'ndc-75k';
           test_start = 75001;
        
         case 55
           file = 'ndc-500k';
           test_start = 500001 ; 
           
        case 56
            file = 'ndc-1m';
            test_start = 1000001;
            
            
        otherwise
            continue;
    end
    
     %      muvs=[2^-5,2^-3,2^-1,2^0,2^1,2^3,2^5];
      %     muvs=[0.03125];
 %   cvs1=[2^-5,2^-3,2^-1,2^0,2^1,2^3,2^5];
    c1=[1];
    % eps1=[2^-5,2^-3,2^-1,2^0,2^1,2^3,2^5];
    %cvs2=[2^-5,2^-3,2^-1,2^0,2^1,2^3,2^5];
    %cvs4=[2^-5,2^-3,2^-1,2^0,2^1,2^3,2^5];
    %cvs3=[0.05,0.1,0.2,0.3,0.4];
 %  cvs3=[10^-3,10^-2,10^-1,10^0,0.05,0.2,0.3,0.4];
 %    cvs3=[10^-3];
   % cvs4=cvs3;
    epsL=[10^-2];
    %  epsL=[10^-4];
    % %                 nu1=[2^-5,2^-4,2^-3,2^-2,2^-1,2^0,2^1,2^2,2^3,2^4,2^5];%%%%%%
    % %                 nu2=[2^-5,2^-4,2^-3,2^-2,2^-1,2^0,2^1,2^2,2^3,2^4,2^5];%%%%%%%%%%
    % %                 muvs=1;cvs1=1; cvs3=1;nu1=1;nu2=1;Energy1=0.6;
   % cvs2=cvs1; %cvs3=cvs4;
    % %                 nu1=nu2;%%%%%%%%%
    %    cvs1= 10^-5;cvs2= 10^-5;
    %muvs= 2^0;
    %   cvs3=10^-5;cvs4=10^-5;
%     filename = strcat('C:\Users\ritus\Documents\data sets\',file,'.dat');
        filename = strcat('C:\Users\ritus\Documents\NDC\',file);
 
 
 
    A = load(filename);
%     A = int16(A);
    %A =  load(strcat('G:\Digital Image Processing\Codes (Asif)\Project\Proposed Algorithm\Dataset\',file,'.txt') );
    [m,n] = size(A);
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%
%    A=A(:,2:n);
    %%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    TestX = A(test_start:m,:);
    if test_start > 1
        DataTrain = A(1:test_start-1,:);
    end
    [m,n] = size(DataTrain);
    clear A;
    % %                 DataTrain(:,1:n-1) = normalize(DataTrain(:, 1:n-1));
    % DataTrain(:,1:n-1) = normalize(DataTrain(:, 1:n-1))+normrnd(0,0.5,m,n-1);%%%for noise
    % %                 TestX(:,1:n-1) = normalize(TestX(:, 1:n-1));
    %TestX(:,1:n-1) = normalize(TestX(:, 1:n-1))+normrnd(0,0.5,size(TestX,1),n-1);
    t = cputime;
    % % --------------------------------------------------------------------------
    no_part = 5.;
    %    initialize minimum error variable and corresponding c
    min_c1_RLSTBSVM = 1.;min_c2_RLSTBSVM = 1.; min_c3_RLSTBSVM=1.;min_c4_RLSTBSVM=1.;
    min_c1_TBSVM = 1.;min_c2_TBSVM = 1.; min_c3_TBSVM=1.;min_c4_TBSVM=1.;
   % min_c1_LSTSVM = 1.;min_c2_LSTSVM = 1.; %min_c3_LSTSVM=1.;min_c4_LSTSVM=1.;
    min_mu_RLSTBSVM=1.; min_mu_TBSVM=1.; min_mu_LSTSVM=1.;
    % %     min_eplsion=1.;
    % %     min_v1 = 1.;min_v2 = 1.;%%%%%%%%%%%%
   
    % min_eps=1;
    min_err_RLSTBSVM=10000000000.;
    min_err_TBSVM=10000000000.;
  %  min_err_LSTSVM=10000000000.;
%     %   min_mu=1.;
%     for mui=1:length(muvs)
%        mu=muvs(mui);
%  %   for ci=1:length(cvs1)
%  %       c1=cvs1(ci);
%   %      for cii=1:length(cvs2)
%      %       c2=cvs2(cii);
%    %         for epls1=1:length(cvs3)
%    %             c3=cvs3(epls1);
%    %             for epls2 = 1:length(cvs4)
%     %                c4 = cvs4(epls2);
%                     %for epls3 = 1:length(epsL)
%                     %eps = epsL(epls3);
%                     % %                               for vi=1:length(nu1)
%                     % %                                 v1=nu1(vi);
%                     % %                                  for vii=1:length(v1)
%                     % %                                     v2=nu2(vii);
%                     block_size=m/(no_part*1.0);
%                     part=0;avgerr_RLSTBSVM0=0;t_1=0;t_2=0;
%                     avgerr_TBSVM=0; avgerr_LSTSVM=0;
%                     while ((part+1)* block_size) <= m
%                         t_1 = ceil(part*block_size);
%                         t_2 = ceil((part+1)*block_size);
%                         Data_test= DataTrain(t_1+1: t_2,:);
%                         Data=[DataTrain(1:t_1,:); DataTrain(t_2+1:m,:)];
%                         % %                                     c3=c1;c4=c2;
%                         FunPara.c1=c1;FunPara.c2=c1;
%                         FunPara.c3=c1;FunPara.c4=c1;
%                         FunPara.eps=epsL;
%                         % %                                         FunPara.v1=v1;FunPara.v2=v2;
%                         % %                                         FunPara.eplsion=eplsion;
%                         FunPara.kerfPara.pars=mu;
%                         %% RLSTBSVM0
%                         FunPara.kerfPara.type = 'rbf';
%                         [err_RLSTBSVM0] =RLSTBSVM(Data_test,Data,FunPara)
%                         %fprintf(file2, 'example file %s; err= %8.6g, part num= %8.6g, mu= %8.6g, c1= %8.6g, c2= %8.6g, c3= %8.6g, c4= %8.6g, E1= %8.6g, E2= %8.6g\n', file,err,part,mu,c1,c2,c3,c4,E1,E2);
%                         avgerr_RLSTBSVM0 = avgerr_RLSTBSVM0 + err_RLSTBSVM0;
%                         %part=part+1;
%                         %% TBSVM
%                         FunPara.kerfPara.type = 'rbf';
%                         eps=c1;
%                         [err_TBSVM] =TBSVM(Data,Data_test,FunPara)
%                         %fprintf(file2, 'example file %s; err= %8.6g, part num= %8.6g, mu= %8.6g, c1= %8.6g, c2= %8.6g, c3= %8.6g, c4= %8.6g, E1= %8.6g, E2= %8.6g\n', file,err,part,mu,c1,c2,c3,c4,E1,E2);
%                         avgerr_TBSVM = avgerr_TBSVM + err_TBSVM;
%                         %part=part+1;
%                         %% LSTSVM
%                   %      if epls1==1&&epls2==1
%                             
%                   %          FunPara.kerfPara.type = 'rbf';
%                   %          [err_LSTSVM] =LSTWSVM(Data_test,Data,FunPara)
%                   %          %fprintf(file2, 'example file %s; err= %8.6g, part num= %8.6g, mu= %8.6g, c1= %8.6g, c2= %8.6g, c3= %8.6g, c4= %8.6g, E1= %8.6g, E2= %8.6g\n', file,err,part,mu,c1,c2,c3,c4,E1,E2);
%                   %          avgerr_LSTSVM = avgerr_LSTSVM + err_LSTSVM;
%                   %      end
%                         part=part+1;
%                     end
%                     % fprintf(file2, 'example no: %s\t avgerr: %g\t mu=%g\t c1=%g\t c2=%g c3=%g c4=%g E1=%g E2=%g \n',file, avgerr,mu,c1,c2,c3,c4,E1,E2);
%                     %%  RLSTBSVM
%                     if avgerr_RLSTBSVM0/10 <  min_err_RLSTBSVM
%                       %  min_c1_RLSTBSVM =c1;min_c2_RLSTBSVM =c1;
%                       %  min_c3_RLSTBSVM=c1;min_c4_RLSTBSVM=c1;
%                         % min_eps=eps;
%                         % %                                          min_eplsion=eplsion;
%                         % %                                          min_v1 =v1;min_v2 =v2;
%                          min_err_RLSTBSVM=avgerr_RLSTBSVM0/10
%                          min_mu_RLSTBSVM=mu;
%                         %%min_E1=E1;min_E2=E2;
%                     end  % for v2
%                     %%  TBSVM %%%%%%
%                     if avgerr_TBSVM/10 < min_err_TBSVM
%                       %  min_c1_TBSVM =c1;min_c2_TBSVM =c1;
%                       %  min_c3_TBSVM=c1;min_c4_TBSVM=c1;
%                         % min_eps=eps;
%                         % %                                          min_eplsion=eplsion;
%                         % %                                          min_v1 =v1;min_v2 =v2;
%                         min_err_TBSVM=avgerr_TBSVM/10
%                         min_mu_TBSVM=mu;
%                         %%min_E1=E1;min_E2=E2;
%                     end  % for v2
%                     
%                     %% LSTSVM %%%%
%             %        if avgerr_LSTSVM/10 < min_err_LSTSVM
%             %            min_c1_LSTSVM =c1;min_c2_LSTSVM =c2;
%             %            % min_c3=c3;min_c4=c4;
%             %            % min_eps=eps;
%                         % %                                          min_eplsion=eplsion;
%                         % %                                          min_v1 =v1;min_v2 =v2;
%             %           min_err_LSTSVM=avgerr_LSTSVM/10
%             %           min_mu_LSTSVM=mu;
%                         %%min_E1=E1;min_E2=E2;
%              %       end  % for v2
%                 end  % for v1
%        %     end  %for c2 values
%             %                          end%for eplsi
%       %  end  % for c1 values
%  %   end %for mu values
% %      end
    
    
    %     final training
    %    _______________________________________________________________________
    FunPara.c1=min_c1_RLSTBSVM;FunPara.c2=min_c2_RLSTBSVM;
    FunPara.c3=min_c3_RLSTBSVM;FunPara.c4=min_c4_RLSTBSVM;
%     FunPara.kerfPara.pars=min_mu_RLSTBSVM;
  FunPara.kerfPara.pars=[];
      FunPara.eps=epsL;
    % %     FunPara.eplsion=min_eplsion;
    % %     FunPara.v1=min_v1;FunPara.v2=min_v2;
    %FunPara.kerfPara.pars=min_mu;
    %%Energy.E1=min_E1;Energy.E2=min_E2;
    %% RLSTBSVM0 %%%%%%
    FunPara.kerfPara.type = 'lin';
    tic;
    [err_RLSTBSVM0,Predict_Y]=RLSTBSVM(TestX,DataTrain,FunPara);
    toc;
    per_RLSTBSVM0 = err_RLSTBSVM0*100/length(Predict_Y);
    ACC_RLSTBSVM0 = (length(Predict_Y)-err_RLSTBSVM0)*100/length(Predict_Y);
    fprintf(file1,'%s   %s    %8.6g   %8.6g   %8.6g   %8.6g   %8.6g  %8.6g    %8.6g\n', 'RLSTBSVM0', file,ACC_RLSTBSVM0,FunPara.kerfPara.pars,FunPara.c1,FunPara.c2,FunPara.c3,FunPara.c4,toc);
%      clear all;
    clear Predict_Y
%         %% TBSVM %%%%%
%     FunPara.c1=min_c1_TBSVM;FunPara.c2=min_c2_TBSVM;
%     FunPara.c3=min_c3_RLSTBSVM;FunPara.c4=min_c4_RLSTBSVM;
% %     FunPara.kerfPara.pars=min_mu_TBSVM;
%   FunPara.kerfPara.pars=muvs;
%      FunPara.eps=min_c3_TBSVM;
%     tic;
%     [err_TBSVM,Predict_Y]= TBSVM(DataTrain, TestX,FunPara);
%     %[err_TBSVM,w1,w2,test1,test2,A,B]= TBSVM(DataTrain, TestX,c1,eps,FunPara.kerfPara.type,[]);
%     toc;
%     per_TBSVM = err_TBSVM*100/length(Predict_Y);
%     ACC_TBSVM = (length(Predict_Y)-err_TBSVM)*100/length(Predict_Y);
%     fprintf(file1,'%s   %s    %8.6g   %8.6g   %8.6g   %8.6g   %8.6g   %8.6g   %8.6g\n', 'TBSVM',file,ACC_TBSVM,FunPara.kerfPara.pars,FunPara.c1,FunPara.c2,eps,eps,toc);
%     clear Predict_Y;
%     %% LSTSVM %%%%%%%%%%
%     FunPara.c1=min_c1_LSTSVM;FunPara.c2=min_c2_LSTSVM;
%     FunPara.kerfPara.pars=min_mu_LSTSVM;
%    % FunPara.c3=min_c3_RLSTBSVM;FunPara.c4=min_c4_RLSTBSVM;
%     tic;
%     [err_LSTSVM,prob_score,A,B,x1,x2] = LSTWSVM(TestX,DataTrain,FunPara);
%     toc;
%     per_LSTSVM = err_LSTSVM*100/length(Predict_Y);
%     ACC_LSTSVM = (length(Predict_Y)-err_LSTSVM)*100/length(Predict_Y);
%     
%     fprintf(file1,'%s   %s   %8.6g   %8.6g   %8.6g   %8.6g   %8.6g   %8.6g    %8.6g\n','LSTSVM', file,ACC_LSTSVM,FunPara.kerfPara.pars,FunPara.c1,FunPara.c2,[],[],toc);
%     
    %fprintf(file1,'file: %s,err = %8.6g of %8.6g,c1 = %8.6g,c3 = %8.6g,c2=%8.6g,c4=%8.6g\n', file,err,length(Predict_Y),FunPara.c1,FunPara.c3,FunPara.c2,FunPara.c4);
end
fclose(file1);
% % %     fclose(file1);
% %     file1=fopen('result_knnmulticlasstwsvm.txt','a+');
% %     fclose(file1);
% %  fclose(file2);

%................complete code.............................%






