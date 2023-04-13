***cd "C:\Users\welcome\Dropbox\My PC (LAPTOP-E0CLJDR9)\Desktop\CHE PAPER 22082022\paper_3_final_14032023"
***log using papercheck_03032023, append
***save "C:\Users\welcome\Dropbox\My PC (LAPTOP-E0CLJDR9)\Desktop\CHE PAPER 22082022\che_data_14032023.dta", replace

bys area :sum total_no_of_family_members if tag==1

*gen age5_65=1 if (age1<=5 | age1>=65)
 
*bys hhid: egen age_gr5_65=min(age5_65)
 
*replace age_gr5_65=0 if age_gr5_65==.

tab age_gr5_65 if tag==1

bys area:tab gender if relation_hh =="1"

tab education_status if tag==1 & relation_hh=="1"

bys area :tab work_status   if relation_hh=="1"

bys area :tab  opd_period if opd_period!=3

tab area

bysort hhid: egen cntdis1 = sum(disa)

tab cntdis1 if tag==1

bys area :tab cntdis1 if tag==1


bys area :tabstat direct_medical_exp if tag==1 & op_fam ==1 , stat ( n mean sd p25 p50 p75 min max)

bys area :tabstat direct_non_medical_exp   if tag==1 & op_fam ==1 , stat ( n mean sd p25 p50 p75 min max)


tabstat op_fee op_medicine  op_labtest  op_fvisit   if  tag==1 & op_fam ==1 , stat ( n mean sd p25 p50 p75 min max)

tabstat direct_non_medical_exp      if  tag==1 & op_fam ==1 , stat ( n mean sd p25 p50 p75 min max)

bys area :tabstat op_indirect  if  tag==1 & op_fam ==1 , stat ( n mean sd p25 p50 p75 min max)


bys area : tabstat op_total_check2   if  tag==1 & op_fam ==1 , stat ( n mean sd p25 p50 p75 min max)

bys area :tab ip_fam if tag==1


**table 10%

bys area :tab direct_10 if tag==1

tab direct_10 if tag==1


bys area :tab direct_nondirect_10  if tag==1

tab direct_nondirect_10  if tag==1



bys area :tab direct_nondirect_indirect_10   if tag==1
tab direct_nondirect_indirect_10   if tag==1


****table 40%

bys area :tab che_direct_40_yr if tag==1
tab che_direct_40_yr if tag==1

bys area :tab che_direct_nondirect_40_yr  if tag==1
tab che_direct_nondirect_40_yr  if tag==1

tab che_direct_nondirect_indirect_40   if tag==1
bys area :tab che_direct_nondirect_indirect_40   if tag==1


******logit
save "C:\Users\welcome\Dropbox\My PC (LAPTOP-E0CLJDR9)\Desktop\CHE PAPER 22082022\che_paper_final_04_10_2022\Table_CHE_Modified_data.dta", replace

logit direct_10 total_no_of_family_members  if tag==1, or
bys area: logit direct_10 total_no_of_family_members  if tag==1, or

logit direct_nondirect_indirect_10 total_no_of_family_members  if tag==1, or
bys area :logit direct_nondirect_indirect_10 total_no_of_family_members  if tag==1, or
  
 
logit che_direct_40_yr total_no_of_family_members  if tag==1, or
bys area: logit che_direct_40_yr total_no_of_family_members  if tag==1, or

 
logit che_direct_nondirect_indirect_40 total_no_of_family_members  if tag==1, or
bys area :logit che_direct_nondirect_indirect_40 total_no_of_family_members  if tag==1, or



logit direct_10 ib4. age_gr if tag==1, or
bys area :logit direct_10 ib4. age_gr if tag==1, or


logit direct_nondirect_indirect_10 ib4. age_gr if tag==1, or
bys area :logit direct_nondirect_indirect_10 ib4. age_gr if tag==1, or


logit che_direct_40_yr ib4. age_gr if tag==1, or
bys area :logit che_direct_40_yr ib4. age_gr if tag==1, or

logit che_direct_nondirect_indirect_40 ib4. age_gr if tag==1, or
bys area :logit che_direct_nondirect_indirect_40 ib4. age_gr if tag==1, or


logit  direct_10 illiteracy_hh if tag==1, or
bys area :logit  direct_10 illiteracy_hh if tag==1, or

logit  direct_nondirect_indirect_10 illiteracy_hh if tag==1, or
bys area:logit  direct_nondirect_indirect_10 illiteracy_hh if tag==1, or


logit  che_direct_40_yr illiteracy_hh if tag==1, or
bys area :logit  che_direct_40_yr illiteracy_hh if tag==1, or

logit  che_direct_nondirect_indirect_40 illiteracy_hh if tag==1, or
bys area :logit  che_direct_nondirect_indirect_40 illiteracy_hh if tag==1, or 


logit direct_10 Divorce_or_Widowhood  if tag==1, or
bys area :logit direct_10 Divorce_or_Widowhood  if tag==1, or


logit direct_nondirect_indirect_10 martial_cat  if tag==1, or
bys area :logit direct_nondirect_indirect_10 martial_cat  if tag==1, or


logit che_direct_40_yr  martial_cat  if tag==1, or
bys area :logit che_direct_40_yr  martial_cat  if tag==1, or


logit che_direct_nondirect_indirect_40 martial_cat  if tag==1, or
bys area:logit che_direct_nondirect_indirect_40 martial_cat  if tag==1, or

logit direct_10  unemp_fcat   if tag==1, or
bys area :logit direct_10  unemp_fcat   if tag==1, or

logit direct_nondirect_indirect_10  unemp_fcat   if tag==1, or
bys area :logit direct_nondirect_indirect_10  unemp_fcat   if tag==1, or

logit che_direct_40_yr   unemp_fcat   if tag==1, or
bys area :logit che_direct_40_yr   unemp_fcat   if tag==1, or

logit che_direct_nondirect_indirect_40   unemp_fcat   if tag==1, or
bys area :logit che_direct_nondirect_indirect_40   unemp_fcat   if tag==1, or

logit direct_10 govtemp_cat   if tag==1, or
bys area :logit direct_10 govtemp_cat   if tag==1, or

logit direct_nondirect_indirect_10 govtemp_cat   if tag==1, or
bys area :logit direct_nondirect_indirect_10 govtemp_cat   if tag==1, or

logit che_direct_40_yr govtemp_cat   if tag==1, or
bys area :logit che_direct_40_yr govtemp_cat   if tag==1, or 

logit che_direct_nondirect_indirect_40 govtemp_cat   if tag==1, or
bys area :logit che_direct_nondirect_indirect_40 govtemp_cat   if tag==1, or

logit direct_10 chr_dis   if tag==1, or
bys area :logit direct_10 chr_dis   if tag==1, or

logit direct_nondirect_indirect_10 chr_dis   if tag==1, or
bys area :logit direct_nondirect_indirect_10 chr_dis   if tag==1, or

logit che_direct_40_yr  chr_dis   if tag==1, or
bys area :logit che_direct_40_yr  chr_dis   if tag==1, or

logit che_direct_nondirect_indirect_40 chr_dis   if tag==1, or
bys area :logit che_direct_nondirect_indirect_40 chr_dis   if tag==1, or

logit direct_10 healthcode  if tag==1, or
bys area :logit direct_10 healthcode  if tag==1, or

logit direct_nondirect_indirect_10 healthcode  if tag==1, or
bys area :logit direct_nondirect_indirect_10 healthcode  if tag==1, or

logit che_direct_40_yr  healthcode  if tag==1, or
bys area :logit che_direct_40_yr  healthcode  if tag==1, or

logit che_direct_nondirect_indirect_40  healthcode  if tag==1, or
bys area:logit che_direct_nondirect_indirect_40  healthcode  if tag==1, or

logit direct_10 health_scheme  if tag==1, or
bys area :logit direct_10 health_scheme  if tag==1, or

logit direct_nondirect_indirect_10 health_scheme  if tag==1, or
bys area :logit direct_nondirect_indirect_10 health_scheme  if tag==1, or

logit che_direct_40_yr  health_scheme  if tag==1, or
bys area :logit che_direct_40_yr  health_scheme  if tag==1, or

logit che_direct_nondirect_indirect_40  health_scheme  if tag==1, or
bys area :logit che_direct_nondirect_indirect_40  health_scheme  if tag==1, or


logit direct_10   ib5.wealth_index    if tag==1, or
bys area :logit direct_10   ib5.wealth_index    if tag==1, or

logit direct_nondirect_indirect_10   ib5.wealth_index    if tag==1, or
bys area:logit direct_nondirect_indirect_10   ib5.wealth_index    if tag==1, or

logit che_direct_40_yr   ib5.wealth_index    if tag==1, or
bys area :logit che_direct_40_yr   ib5.wealth_index    if tag==1, or

logit che_direct_nondirect_indirect_40    ib5.wealth_index    if tag==1, or
bys area :logit che_direct_nondirect_indirect_40    ib5.wealth_index    if tag==1, or

logit direct_10 ib5.ses_cat if tag==1, or
bys area :logit direct_10 ib5.ses_cat if tag==1, or

logit direct_nondirect_indirect_10 ib5.ses_cat if tag==1, or
bys area :logit direct_nondirect_indirect_10 ib5.ses_cat if tag==1, or

logit che_direct_40_yr  ib5.ses_cat if tag==1, or 
bys area :logit che_direct_40_yr  ib5.ses_cat if tag==1, or

logit che_direct_nondirect_indirect_40   ib5.ses_cat if tag==1, or 
bys area :logit che_direct_nondirect_indirect_40   ib5.ses_cat if tag==1, or






 
 
  
 



 
 


 
 