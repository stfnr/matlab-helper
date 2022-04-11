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