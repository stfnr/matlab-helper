function [ Y ] = maxnd( X , DIM )
%MAXND largest component along multiple dimensions.
%   Y = maxnd(X, DIM) returns the largest components along the
%   dimensions specified by DIM.
%
%       X:   data array to be used
%       DIM: dimension vector along which dimensions max shall be performed
%
%   Example:
%       Y = maxnd(rand(3,3,3,3,3), [1 3 5]) returns an array of size [1 3 1 3 1]
%
%   See also minnd, meannd, fhnd
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

Y = fhnd( @(x,d) max(x,[],d), X, DIM);

end