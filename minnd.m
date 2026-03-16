function [ Y ] = minnd( X , DIM )
%MINND smallest component along multiple dimensions.
%   Y = minnd(X, DIM) returns the smallest components along the
%   dimensions specified by DIM.
%
%       X:   data array to be used
%       DIM: dimension vector along which dimensions min shall be performed
%
%   Example:
%       Y = minnd(rand(3,3,3,3,3), [1 3 5]) returns an array of size [1 3 1 3 1]
%
%   See also maxnd, meannd, fhnd
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

Y = fhnd( @(x,d) min(x,[],d), X, DIM);

end