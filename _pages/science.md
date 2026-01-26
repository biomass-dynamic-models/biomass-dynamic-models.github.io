---
title: Cohort aggregated models
permalink: /science/
layout: single
toc: true
toc_sticky: true
---
<style>body {text-align: justify}</style>


Biomass dynamic models in fisheries have a long history of application. Because fisheries data are generally collected over discrete timesteps, the models themselves are often written in discrete form, with a production function $g(B_t)$ that combines recrutiment, growth and natural mortality elements of the dynamics. Written in terms of the current depletion $x_t = B_t / K$ (i.e., relative to the biomass at unexploited equilibrium $K$), the cohort-aggregated population dynamics can be written as. 
\begin{equation}
x_{t+1}=x_t+g(x_t)-H_t       	
\end{equation}
where $H_t = C_t/K$ is the harvest rate. This type of model was first applied within a fisheries context by Schaefer [^1][^2], who implemented a logistic production function:
\begin{equation}
g(x_t)=r \cdot x_t\left(1-x_t\right)  	
\end{equation}
This has two estimable parameters, usually referred to as the intrinsic rate of population growth $r$ and the carrying capacity $K$. The intrinsic growth rate is defined as the maximum rate as the population biomass goes to zero:
\begin{equation}
r = \lim_{x \to 0} \frac{1}{x} \cdot g(x)
\end{equation}

The logistic model has a number of useful reference points associated with it, which can be obtained directly from the parameter estimates. These correspond to a maximum sustainable yield $MSY = r \cdot K / 4$ and the associated biomass $B^{MSY} = K / 2$ and harvest rate $H^{MSY} = r / 2$. If we define the ratio $\phi = B^{MSY} / K = x^{MSY}$, then the logistic model specifically assumes that $\phi = 0.5$. However this is usually inconsistent with predictions made by age structured models, which are based on a stock-recruitment function that often predicts $\phi < 0.5$. It is therefore desirable to implement a biomass dynamic model that has reference points consistent with an age-structured analogue. 

The logistic model was generalised by Pella and Tomlinson [^3] to allow $\phi \neq 0.5$ by introducing a shape parameter $p$:
\begin{equation}
g(x_t)=\frac{r}{p} \cdot x_t\left(1-x_t^p\right)  	
\end{equation}
To improve stability of the estimation, Fletcher [^4] reparameterised this model, writing it in the form:
\begin{equation}
g(x_t)= \gamma \cdot m \cdot x_t\left(1-x_t^(n - 1)\right)
\end{equation}
Equivalence of these equations can be acheived by noting that $p \equiv n - 1$. 


However, in both cases, the rate of population growth becomes infinite for $\phi \leq 1 / e \approx 0.37$, which occurs at $p \leq 0$. Since $0.1 < \phi < 0.4$ for a typical age-structured model, modifications are required to ensure consistency with this property. These have typically involved a discontinuous solution to the production function. 

A combined Fletcher-Schaefer hybrid model was derived by McAllister [^5] to allow $\phi < 0.5$. It has a discontinuous inflection point at $x^{MSY}$ with dynamics for values of $x < x^{MSY}$ governed by the logistic (Schaefer) model, and dynamics at higher biomass levels governed by the generalised (Fletcher) production model: 
\begin{equation}
g(x_{t}) =
\begin{dcases}
r.x_{t}.\left(1 - \frac{x_{t}}{2\phi}\right) &\text{if } x \leq \phi\\
\gamma.m.\left(x_t - x_t^{n}\right) &\text{if } x > \phi
\end{dcases} \label{equ:mdl}
\end{equation} 
\begin{subequations}
\begin{equation}
\phi = \left(\frac{1}{n}\right)^{(1/(n-1))}
\end{equation}
\begin{equation}
\gamma=\frac{n^{n/(n-1)}}{n-1}
\end{equation}
\begin{equation}
m = \frac{r\phi}{4}
\end{equation}
\end{subequations}



-----------------------------------
# References

[^1]: Schaefer (1954)

[^2]: Schaefer (1957)

[^3]: Pella (1969)

[^4]: Fletcher (1978)

[^5]: McAllister (2000)




















