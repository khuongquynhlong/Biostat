%let path = https://raw.githubusercontent.com/khuongquynhlong/Biostat/main/GLM/Assignments/;

* Individual data;


filename probly temp;
proc http
 url="https://raw.githubusercontent.com/zonination/perceptions/master/probly.csv"
 method="GET"
 out=probly;
run;

/* Tell SAS to allow "nonstandard" names */
options validvarname=any;

/* import to a SAS data set */
proc import
  file=probly
  out=probly replace
  dbms=csv;
run;







proc import datafile = "https://raw.githubusercontent.com/khuongquynhlong/Biostat/main/GLM/Assignments/dehp_indi.csv" out=toxic_invi
		dbms=csv replace;
		guessingrows=max;
	getnames=yes;
run;


* Aggregated data;
proc import datafile = "&path\dehp_short.csv" out=toxic_short
		dbms=csv replace;
		guessingrows=max;
	getnames=yes;
run;

proc print data=toxic_short (obs=5);
run;


proc print data=toxic_invi (obs=5);
run;

/*************************************************************************
                             Binomial response
/************************************************************************/

********** Simple logistic regression;
proc logistic data=toxic_short;
	model nadv/litter_size = dose_scale;
	ods select GoodnessOfFit FitStatistics ParameterEstimates;
run;

proc logistic data=toxic_invi;
	model nadv = dose_scale;
	ods select GoodnessOfFit FitStatistics ParameterEstimates;
run;