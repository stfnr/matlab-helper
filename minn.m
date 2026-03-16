function [ y, I ] = minn( x )
%MINN finds minimum value in a N-dimensional array
%   [Y, I] = MINN(X) returns the minimum value Y and its linear index I.
%   Equivalent to [y, I] = min(x(:)).
%
%   Example:
%       [y, I] = minn([5, 1, 3, 2])
%       % Returns y = 1, I = 2
%
%   See also MIN, MAXN.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Created:	Apr 15, 2019
%
% Revisions:    0.1 (Apr 15, 2019)
%					Initial version.
%               0.2 (Mar 16, 2026)
%                   Fixed documentation typo, added index return value.
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

% Handle empty arrays specially - min() doesn't support two outputs for empty
if isempty(x)
    y = [];
    I = [];
else
    [y, I] = min(x(:));
end

end
