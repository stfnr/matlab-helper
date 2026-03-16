function A = ind2subarray(siz,ndx)
%IND2SUBARRAY returns subscripts from linear indices as an array.
%   A = IND2SUBARRAY(SIZ,NDX) returns an array A containing the
%   subscript indices for the linear index NDX in an array of size SIZ.
%
%   For a single index, A is a row vector [d1, d2, d3, ...] where
%   each element is the subscript for the corresponding dimension.
%
%   For multiple indices, A is a horizontally concatenated array
%   [d1_all, d2_all, ...] where d1_all contains all subscripts for
%   dimension 1, d2_all for dimension 2, etc.
%
%   Example:
%       % Single index in a 3x4 matrix
%       A = ind2subarray([3, 4], 5)
%       % Returns [2, 2] (row 2, column 2)
%
%       % Multiple indices in a 3x4 matrix
%       A = ind2subarray([3, 4], [1, 5, 12])
%       % Returns [1, 2, 3, 1, 2, 4]
%       % Indices 1,5,12 correspond to subscripts (1,1), (2,2), (3,4)
%
%   This function uses MATLAB's IND2SUB and produces equivalent results
%   but returns output as a single array instead of separate arguments.
%
%   See also IND2SUB, SUB2IND, FIND.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Created:	Mar 19, 2019
%
% Revisions:    0.1 (Mar 19, 2019)
%					Initial version.
%               0.2 (Mar 16, 2026)
%                   Improved documentation, added input validation.
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
if nargin < 2
    error('ind2subarray:InsufficientInputs', 'Function requires SIZ and IND inputs.');
end

if ~isnumeric(siz) || ~isvector(siz)
    error('ind2subarray:InvalidInput', 'SIZ must be a numeric vector.');
end

if ~isnumeric(ndx)
    error('ind2subarray:InvalidInput', 'NDX must be numeric.');
end

if any(siz <= 0) || any(~isfinite(siz)) || any(mod(siz, 1) ~= 0)
    error('ind2subarray:InvalidSize', 'SIZ must contain positive integers.');
end

% Handle empty input
if isempty(siz) || isempty(ndx)
    A = [];
    return;
end

% Get subscripts using ind2sub
subscripts = cell(1, length(siz));
[subscripts{:}] = ind2sub(siz, ndx);

% Convert cell array to matrix using cell2mat
% For single index: returns row vector [dim1, dim2, dim3, ...]
% For multiple indices: returns horizontally concatenated subscripts
A = cell2mat(subscripts);

end