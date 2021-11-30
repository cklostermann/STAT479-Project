
data{
  int<lower = 0> n; // number of data points
  int<lower = 0> popularity[n]; // total number of likes+dislikes
  int<lower = 0> likes[n]; // total number of likes
  vector[n] funny; // vector of funny predictors
  vector[n] quick;
  vector[n] pat;
  vector[n] celeb;
  vector[n] danger;
  vector[n] animals;
  vector[n] sex;
  
 
  int n_grid; // number of points in the grid of x values at which we want to evaluate P(y = 1|x)
  vector[n_grid] x_grid;

 // real mu_alpha; // prior mean for intercept on standardized scale
  //real<lower = 0> sigma_alpha; // prior sd for intercept on standardized scale
  //real mu_b_funny; // prior mean for slope of funny variable
  //real<lower = 0> sigma_b_funny;// prior sd for slope of funny variable
 
}
parameters{
  real alpha; // intercept (on standardized scale)
  real b_funny; // slopes (on standardized scale)
  real b_quick;
  real b_pat;
  real b_celeb;
  real b_danger;
  real b_animals;
  real b_sex;
}

model{
  alpha ~ normal(1,1);
  b_funny ~ normal(0, .25);
  b_quick ~ normal(0, .25);
  b_pat ~ normal(0, .25);
  b_celeb ~ normal(0, .25);
  b_danger~ normal(0, .25);
  b_animals ~ normal(0, .25);
  b_sex ~ normal(0, .25);
  for(i in 1:n){
    likes[i] ~ binomial_logit(popularity, alpha + funny[i]*b_funny + quick[i]*b_quick + pat[i]*b_pat + celeb[i]*b_celeb + 
    danger[i]*b_danger + animals[i]*b_animals + sex[i]*b_sex);
  }
}
//generated quantities{
  //vector<lower = 0, upper = 1>[n_grid] prob_grid; // prob. that y = 1 at each grid point
  
  //for(i in 1:n_grid){
    //prob_grid[i] = inv_logit(alpha + x_grid[i] * b_funny);
  //}
  
//}
