## Final Projects

### Policy and Schedule

The final project can be either a computational project or a survey 
paper.  Computational projects may be done either solo or in a group 
of two (a two-person project should have larger scope than a solo).
Survey papers must be solo.

Some suggested topics are below.  You are of course free to come up 
with other topics yourself.  Please submit a one-page project proposal
(via GradeScope) to let me know what your topic will be, and who if 
anyone you will be working with, by Friday, May 14.

Final project reports will be due on Thursday, June 10.  


### Examples of computational projects:

- Investigate using the iterative symmetric indefinite linear
  solvers MINRES and SYMMLQ together with shift-and-invert
  Lanczos to find Fiedler vectors.  (The online templates
  collection includes C and Matlab code.)

- Use the BTER software from Sandia (or find another graph
  generator) to create several groups of test graphs, each
  group having "similar" structure and a wide range of
  sizes.  For each group determine how the Fiedler value
  scales with $$n$$.  Can you create a group to match a 
  desired scaling (e.g., $$O(1/n)$$ or $$O(\sqrt n\,)$$ or ....)?

- Use a big parallel computer (or the cloud) to compute
  Fiedler values and Fiedler vectors for the largest
  connected component of all the undirected graphs in
  the SuiteSparse collection (or as many as possible).
  Save the results for possible inclusion in the
  collection.

- Experiment with combinatorial preconditioning.

- Experiment with a randomized Kaczmarz linear solver.

- Experiment with a randomized incomplete factorization linear solver.

- Implement something from an application you know about
  in any area of science and engineering.

- Compare both the quality of results and the computational
  cost of spectral clustering on some test problems, using 
  each of the three matrices $$L$$, $$N$$, and $$A$$.


### Examples of survey projects:

- Any single application area you are interested in.

- Multigrid approaches to Laplacian linear solvers and eigensolvers.

- History and computational experience with Kaczmarz projection
  methods in non-Laplacian applications (going back to Kacmarz's 
  work in the 1930s).

- Eigenvalues of random graphs (under various definitions).

- Random walks on graphs and relationship to Laplacians.
