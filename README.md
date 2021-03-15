# PLOS ONE posture control
Nonlinear State-space model of postural control. Supplemental matrials for PLOS ONE article.

This R package contains models and functions to accompany the paper in PLOS ONE:
McKee, K. L., & Neale, M. C. (2019). Direct estimation of the parameters of a delayed, intermittent activation feedback model of postural sway during quiet standing. PloS one, 14(9), e0222664.

Install using rtools. Navigate to the folder with the tar.gz and type R CMD INSTALL IPCmodel_1.0.tar.gz.
In R, type ?IPCmodel to see help documentation and example code.
Includes simulation functions (see example).

Using Differential Evolution is recommended for estimating the parameters of the model from data, as the likelihood function has stochastic discontinuities.
Package DEoptim was used for the above article.
