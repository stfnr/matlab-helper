function [ Y ] = minnd( X , DIM )
%MINND smallest component along multiple dimensions.
%   Detailed explanation goes here
%
%   See also maxnd, meannd
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

% get non min dimensions nDIM
nDIM = 1:ndims( X );

for id = 1:length( DIM )
    nDIM( nDIM == DIM(id) ) = [];
end

% ensure nDIM is not empty
if isempty(nDIM)
    % assume an additional dimension and set it to 1
    nDIM = ndims( X ) + 1;
    Xsiz(nDIM) = 1;
end

% permute non min dimensions as first dimensions
Y = permute(X, [nDIM DIM]);
% reshape so all min dimensions are collapsed in the last dimension
Y = reshape(Y, [Xsiz(nDIM) prod(Xsiz(DIM))]);
% get smallest component along the last dimension
Y = min(Y, [], length(Xsiz(nDIM)) + 1);
% reshape back with min dimensions as singletons
Y = reshape(Y, Ysiz);

end