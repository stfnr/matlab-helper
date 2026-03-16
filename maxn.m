function [ y, I ] = maxn( x )
%MAXN finds maximum value in a N-dimensional array
%   [Y, I] = MAXN(X) returns the maximum value Y and its linear index I.
%   Equivalent to [y, I] = max(x(:)).
%
%   Example:
%       [y, I] = maxn([1, 5, 3, 2])
%       % Returns y = 5, I = 2
%
%   See also MAX, MINN.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Created:	Apr 15, 2019
%
% Revisions:    0.1 (Apr 15, 2019)
%					Initial version.
%               0.2 (Mar 16, 2026)
%                   Documented index return value.
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

% Handle empty arrays specially - max() doesn't support two outputs for empty
if isempty(x)
    y = [];
    I = [];
else
    [y, I] = max(x(:));
end

end