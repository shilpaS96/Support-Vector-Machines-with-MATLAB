# Proposed Large Scale Least Squares Twin SVMs

This repo contains the code for the paper

> Large Scale Least Squares Twin SVMs

published at ACM Transactions on Internet Technology (TOIT) 2021 [link](https://dl.acm.org/doi/abs/10.1145/3398379)
  
## Abstract in brief:
 The proposed LS-LSTSVM introduces different Lagrangian functions to eliminate the need for calculating inverse matrices. The proposed LS-LSTSVM also does not employ kernel-generated surfaces for the non-linear case, and thus uses the kernel trick directly. This ensures that the proposed LS-LSTSVM model is superior to the original TWSVM and LSTSVM. Lastly, the structural risk is minimized in LS-LSTSVM. This exhibits the essence of statistical learning theory, and consequently, classification accuracy on datasets can be improved due to this change. The proposed LS-LSTSVM is solved using the sequential minimal optimization (SMO) technique, making it more suitable for large-scale problems.




