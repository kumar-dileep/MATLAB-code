clear all;  % Clears the workspace.
Interp;     % Runs Interp.m;

% x=[2 -3 5 -2 0 7 9]'  
% v=[ 3 4 5 9 1 0 5]
% xq=[-2, -4, 0 9 12, 6 5]


x = rand(1,1000000);  % Ramdoms values of x 
v = rand(1,1000000);  % Ramdoms values of x 
xq=rand(1,5000000);   % Ramdoms values of x 


tic   
linterp(x,v,xq);    % my function for linear interpolation
toc

tic
interp1(x,v,xq);     % in-build matlab function for interpolation.
toc

% tic and toc are used for measuring execution time.


