---
title: Model fitting
permalink: /fitting/
layout: single
toc: true
toc_sticky: true
---
<style>body {text-align: justify}</style>


The package fits a state-space biomass dynamic model using Bayesian methods, specifically the Hamiltonian MCMC implemented in the package **rstan**. To a large extent, the package is an external wrapper for **rstan**, providing functionality relevant to the intended application. The package is generalisable, meaning that any model formulation can be specified by the user. The default implements the Fletcher-Schaefer hybrid model with $\phi$ specified as an input value. As a default, $\phi=0.5$ (i.e. $n=2$), making it equivalent to the logistic model.   

## Estimation framework
Parameters are estimated within a Bayesian state-space framework. This re-formulates the process equation to include a time-dependent error term (the process error, $\epsilon^p$) and a parallel observation process that relates an abundance index $I$ to the unobserved biomass state with some degree of error (the observation error, $\epsilon^o$), according to an estimated catchability scalar $q$. 
\begin{equation}
x_{t+1} = \left(x_t + g(x_t) - h_t\right) \cdot \epsilon_t^p 
\end{equation}
\begin{equation}
I_{it} = (q_i \cdot x_t)\cdot\epsilon_{it}^o  
\end{equation}
The advantage of this class of models is that they allow both process and observation error to be represented simultaneously, which is important for effective precautionary or risk based management \cite{Harwood:2003}. 

Parameters to be estimated in the model are therefore: $r$, $K$, $q$ for each index, and the error terms. The large number of parameters necessitates a Bayesian approach with appropriate priors. Parametric distributional assumptions for $\epsilon^p$ and $\epsilon^o$ are required, which unfortunately cannot be estimated in an hierarchical manner with fisheries data. We assume them to follow a log-normal distribution with an expectation of one, and therefore fix values of $\sigma_p$ and $\sigma_o$ on input, based on a subjective measure of model fit to the data, with minimum bounds $\sigma_p \geq 0.05$ and $\sigma_o \geq 0.15$.
\begin{equation}
r \sim LN(\mu_r,\sigma_r^2)  
\end{equation}
\begin{equation}
ln(K) \sim U(.,.) 
\end{equation}
\begin{equation}
\epsilon_{.}^p \sim LN(-\sigma_p^2/2,\sigma_p^2 ) 
\end{equation}
\begin{equation}
\epsilon_{..}^o \sim LN(-\sigma_o^2/2,\sigma_o^2)				      	
\end{equation}
The $r$ and $K$ parameters of the logistic model are highly correlated, and their estimation is helped through the use of an informative prior or priors. We assumed an uninformative log-uniform prior for $K$, but an informative log-normal prior for $r$. The expectation and variance for the prior on intrinsic growth, with $E(r)=\exp(\mu_r+\sigma_r^2/2)$ can be constructed from available life-history data using the **lhm** package. 

Log-normal prior distributions for the error terms are specified to have an expection of one, which gives an intuitive interpretation of the expected quantities.
\begin{equation}
E(x_{t+1}) = x_t + g(x_t) - h_t
\end{equation}
\begin{equation}
E(I_{it}) = q_i \cdot x_t  
\end{equation}
The catchability $q$ is estimated analytically from its maximum posterior density estimate assuming an uninformatinve uniform prior (i.e. $q \sim U(.,.)$).

$$
\hat{q}_i = exp(\left(\frac{1}{n_t}\sum_t{\left\{ln(I_{it})-ln(B_t)\right\}} + \frac{\sigma_o^2}{2}\right))
$$

If we assume that the biomass is exactly known for purposes of the estimation of $\hat{q}$, then $E[ln(B_t)] = ln(B_t)$. Since $E(ln(I_{it})) = ln(q_i \cdot B_t) - \sigma_o^2/2$, then $E[ln(\hat{q}_{i})] = E[ln(q_i)]$ and $E[\hat{q}_{i}] = E[q_i]$ as required.

$$
\begin{align}
E[ln(\hat{q}_i)] &= \left[\frac{1}{n_t}\sum{\left\{E[ln(I_{it})]-E[ln(B_t)]\right\}} + \frac{\sigma_o^2}{2}\right]  \\
&= \left[\frac{1}{n_t}\sum{\left\{ln(q_i.B_t)-\frac{\sigma_o^2}{2}-ln(B_t)\right\}} + \frac{\sigma_o^2}{2}\right] \nonumber \\
&=ln(q_i)
\end{align}
$$