FEM_Torus
=========

General FEM approach to solving the schroedinger equation for a torus embedded in R3.

The master program is test_torus_tesselate - once open everything should hopefully be self explanatory. There are a few variable parameters (number of eigenvectors to solve for, number of nodes in the tesselation, parameters of the torus) otherwise it is set up to simply run. I will get the general CUDA version uploaded soon which solves the problem for arbitrary geometry requiring only (x,y,z) coordinates and a tesselation. The code has been modified to be single threaded but if you have the parallelization toolbox simply initialize your workers in matlab and change the for loop to a parfor loop.

By default the first wavefunction will be plotted as color data onto the surface of the object along with the first 10 eigenvalues. 
