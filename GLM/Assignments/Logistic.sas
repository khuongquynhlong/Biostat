%let path = https://raw.githubusercontent.com/khuongquynhlong/Biostat/main/GLM/Assignments;


*----- Read data;

* Individual data;
filename probly temp;
proc http
 url="&path/dehp_indi.csv"
 method="GET"
 out=probly;
run;

proc import
  file=probly
  out=toxic_invi replace
  dbms=csv;
run;


* Aggregated data;
filename probly temp;
proc http
 url="&path/dehp_short.csv"
 method="GET"
 out=probly;
run;

proc import
  file=probly
  out=toxic_agg replace
  dbms=csv;
run;


proc print data=toxic_invi (obs=10); 
run;

proc print data=toxic_agg (obs=10);
run;

*----- Logistic regressions;

* Individual data;

proc logistic data=toxic_invi;
	model nadv(ref = "0") = dose_scale;
	ods select FitStatistics ParameterEstimates;
run;


* Aggregated data;
proc logistic data=toxic_agg;
	model nadv/litter_size = dose_scale;
	ods select FitStatistics ParameterEstimates;
run;