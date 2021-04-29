libname cert "/folders/myfolders/cert/input";


data out;
	set cert.input44;
	length chol_status $20;
	drop bp_status weight_status smoking_status;
	if cholesterol ne . then do;
	if cholesterol < 200 then chol_status='Safe';
	else if cholesterol <= 239 then chol_status='High-Borderline';
	else if cholesterol >= 240 then chol_status='High';
	end;
run;

proc contents data=out;
run;

proc freq data=out; 
	table chol_status;
run;

