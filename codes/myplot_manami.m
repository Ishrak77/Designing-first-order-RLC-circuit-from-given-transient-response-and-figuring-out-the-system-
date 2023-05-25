function gofMat = myplot_manami(eqn,t,y)
gofMat=struct();
 for i = 1:4
    [~,gof]=fit(t',y',char(eqn(i)));
    gofMat(i).sse=gof.sse;
    gofMat(i).rsquare=gof.rsquare;
    gofMat(i).adjrsquare=gof.adjrsquare;
    gofMat(i).rmse=gof.rmse;
 end

