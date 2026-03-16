function [ Y ] = fhnd( fh, X , DIM )
%FHND perform function along multiple dimensions.
%   Y = fhnd( @(x,d) min(x,[],d), rand(3,3,3,3,3), [1 3 5]) will for 
%   example perform the min function along the dimensions 1, 3 and 5. The 
%   resulting array Y will be of size [1 3 1 3 1].
%
%       fh:  function handle that needs to accept two arguments: X and a 
%            single dimension along which it will be performed. 
%       X:   data array to be used
%       DIM: dimension vector along which dimensions fh shall be performed
%
%   See also maxnd, minnd, meannd
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Created:	Apr 15, 2019
%
% Revisions:    0.1 (Apr 15, 2019)
%					Initial version.
%               0.2 (Mar 16, 2026)
%                   Added input validation for improved robustness.
%
% Authors: 
%
%   stefan.ruschke@tum.de
% 
% --------------------------------
%
% Body Magnetic Resonance Research Group
% Department of Diagnostic and Interventional Radiology
% Technical University of Munich
% Klinikum rechts der Isar
% 22 Ismaninger St., 81675 Munich
% 
% https://www.bmrr.de
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Input validation
if nargin < 3
    error('fhnd:InsufficientInputs', 'Function requires fh, X, and DIM inputs.');
end

if ~isa(fh, 'function_handle')
    error('fhnd:InvalidInput', 'First argument must be a function handle.');
end

if ~isnumeric(X)
    error('fhnd:InvalidInput', 'Second argument X must be a numeric array.');
end

if ~isnumeric(DIM) || ~isvector(DIM)
    error('fhnd:InvalidInput', 'DIM must be a numeric vector.');
end

DIM = DIM(:)';  % Ensure row vector

if any(DIM <= 0) || any(~isfinite(DIM)) || any(mod(DIM, 1) ~= 0)
    error('fhnd:InvalidDimension', 'DIM must contain positive integers.');
end

if any(diff(sort(DIM)) == 0)
    error('fhnd:DuplicateDimension', 'DIM must not contain duplicate values.');
end

% Handle empty array case
if isempty(X)
    Y = [];
    return;
end

Xsiz = size( X );

if max(DIM) > length(Xsiz)
    Xsiz(end+1:max(DIM)) = 1;
end

Ysiz = Xsiz;
Ysiz(DIM) = 1;

% get non function dimensions nDIM
nDIM = 1:ndims( X );

for id = 1:length( DIM )
    nDIM( nDIM == DIM(id) ) = [];
end

% ensure nDIM is not empty
if isempty(nDIM)
    % assume an addtional dimension and set it to 1
    nDIM = ndims( X ) + 1;
    Xsiz(nDIM) = 1;
end

% permute all other dimensions as first dimensions
Y = permute(X, [nDIM DIM]);
% reshape so all function dimensions are collapsed in the last dimension
Y = reshape(Y, [Xsiz(nDIM) prod(Xsiz(DIM))]);
% get smallest component along the last dimension
Y = fh(Y, length(Xsiz(nDIM)) + 1);
% reshape back with function dimensions as singletons
Y = reshape(Y, Ysiz);

end