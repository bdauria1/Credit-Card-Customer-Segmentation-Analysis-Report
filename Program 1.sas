proc import datafile="/home/u64092424/Credit Card Customer Data.csv"
    out=credit_data
    dbms=csv
    replace;
    getnames=yes;
run;

proc means data=credit_data nmiss;
run;

proc stdize data=credit_data reponly method=median out=credit_data_clean;
    var Avg_Credit_Limit Total_Credit_Cards Total_visits_bank Total_visits_online Total_calls_made;
run;

data credit_data_clean;
    set credit_data_clean;
run;

proc standard data=credit_data_clean mean=0 std=1 out=credit_data_scaled;
    var Avg_Credit_Limit Total_Credit_Cards Total_visits_bank Total_visits_online Total_calls_made;
run;

proc univariate data=credit_data_scaled;
    var Avg_Credit_Limit Total_Credit_Cards Total_visits_bank Total_visits_online Total_calls_made;
run;

proc sgplot data=credit_data_scaled;
    scatter x=Total_Credit_Cards y=Avg_Credit_Limit;
    title "Avg Credit Limit vs. Total Credit Cards";
run;

proc sgplot data=credit_data_scaled;
    histogram Total_visits_bank;
    title "Distribution of Total Bank Visits";
run;

/* Check for missing values */
proc means data=credit_data nmiss;
run;

/* Check basic statistics for target and predictors */
proc means data=credit_data;
    var Avg_Credit_Limit Total_Credit_Cards Total_visits_bank Total_visits_online Total_calls_made;
run;

/* Examine the distribution of Avg_Credit_Limit */
proc univariate data=credit_data;
    var Avg_Credit_Limit;
    histogram Avg_Credit_Limit / normal;
    title "Distribution of Avg_Credit_Limit";
run;

/* Define High_Risk based on Avg_Credit_Limit threshold */
data credit_data_scaled;
    set credit_data;
    if Avg_Credit_Limit < 100000 then High_Risk = 1; /* Example threshold */
    else High_Risk = 0;
run;

/* Check target variable distribution */
proc freq data=credit_data_scaled;
    tables High_Risk;
    title "Distribution of High_Risk Variable";
run;

/* Logistic regression with predictors */
proc logistic data=credit_data_scaled descending;
    model High_Risk(event='1') = Total_Credit_Cards Total_visits_bank Total_visits_online Total_calls_made;
    output out=predicted p=pred_prob; /* Save predicted probabilities */
run;

/* Examine model output */
proc print data=predicted (obs=10); /* View first 10 predictions */
    var High_Risk pred_prob;
run;

/* Create classification based on threshold */
data predicted;
    set predicted;
    Predicted_High_Risk = (pred_prob > 0.5); /* Adjust threshold as needed */
run;

/* Confusion matrix */
proc freq data=predicted;
    tables High_Risk*Predicted_High_Risk / norow nocol nopercent;
    title "Confusion Matrix";
run;

ods graphics on;
proc logistic data=credit_data_scaled descending plots(only)=roc;
    model High_Risk(event='1') = Total_Credit_Cards Total_visits_bank Total_visits_online Total_calls_made;
    roc;
run;
ods graphics off;

proc export data=credit_data_scaled
    outfile="/home/u64092424/Segmented_Credit_Card_Customer_Data.csv"
    dbms=csv
    replace;
run;

