% Alternative to 'eig' MATLAB function but returns eigenvalues and
% corresponding vectors in descending order.
%   INPUT:
%       Matrix = Square Matrix. nxn matrix.
%   OUTPUT:
%       V = Sorted eigenvectors. nxn matrix.
%       D = Sorted eigenvalues. Diagonal nxn matrix.
% By Ashkan Pakzad on 26/02/18 MATLAB R2018b 
% ashkan.pakzad.13@ucl.ac.uk
% github.com/ashkanpakzad
%
function [V, D] = SortEig(Matrix)
% Find eigen vecs and vals.
[eigVecs, eigVals] = eig(Matrix);
eigVals = diag(eigVals); % convert to vector of eigenvals

TempeigVals = eigVals; % Temporarily assign eigenvals to changing vector.
% Assign memory.
idx_store = zeros(length(eigVals),1);
D = zeros(length(eigVals),1);
% Sort largest->smallest eigenvalues into new eigenvalue vector.
for i = 1:length(eigVals)
    [maxVal, idx_store(i)] = max(TempeigVals);
    TempeigVals(idx_store(i)) = NaN;
    D(i) = maxVal;
end

% Sort corresponding eigenvectors into new eigenvector matrix.
V = zeros(size(eigVecs));
for i = 1:length(eigVals)
    V(:,i) = eigVecs(:,idx_store(i));
end

D = diag(D); % Convert eigenvalues into matrix to match 'eig' output.
end
