bayesmh Cases_LN population_density aged_65_older cvd_death_rate diabetes_prevalence handwashing_facilities1 extreme_poverty, ///
likelihood (normal ({var}))           ///
prior 	({Cases_LN:}, normal (0, 1e4)) block ({Cases_LN:}, gibbs) ///
prior 	({var}, igamma (.01, .01)) block ({var}, gibbs) ///
mcmcsize (1000) saving (simdata, replace) rseed (16)

///Computing Postestimation Summaries
bayespredict Cases_LN_validate, mean outcome(Cases_LN) rseed(1234)

///Creating Simulatons of predicted Outcomes
bayespredict {_ysim1} {_ysim1}, saving(Cases_LN_validate1, replace) rseed(1234)

/// Computing Predicted p-values
bayesstats ppvalues (mean:@mean({_ysim1})) (min:@min({_ysim1})) (max:@max({_ysim1})) using C:\Users\aonovo\Documents\Cases_LN_validate1.dta
/// 

/// Graphing Bayesian summaries
bayesgraph diagnostics _all
