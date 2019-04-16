function [ Y ] = maxnd( X , DIM )
%MAXND largest component along multiple dimensions.
%   Detailed explanation goes here
%   
%   See also minnd, meannd
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