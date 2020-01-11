* Written by R;
*  write.foreign(cancer, "cancer_data", "cancer_data.sas", package = "SAS") ;

DATA  rdata ;
INFILE  "cancer_data" 
     DSD 
     LRECL= 35 ;
INPUT
 inst
 time
 status
 age
 sex
 ph_ecog
 ph_karno
 pat_karno
 meal_cal
 wt_loss
;
LABEL  ph_ecog = "ph.ecog" ;
LABEL  ph_karno = "ph.karno" ;
LABEL  pat_karno = "pat.karno" ;
LABEL  meal_cal = "meal.cal" ;
LABEL  wt_loss = "wt.loss" ;
RUN;
