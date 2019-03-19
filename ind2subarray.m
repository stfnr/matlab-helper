function A = ind2subarray(siz,ndx)
%IND2SUBARRAY returns multiple subscripts from linear index as an array.
%   IND2SUBARRAY is used to determine the equivalent subscript values
%   corresponding to a given single index into an array.
%
%   A = IND2SUBARRAY(SIZ,IND) returns the arrays A containing the
%   the index matrix IND for a matrix of size SIZ.
%
%
%   This function uses Matlab's IND2SUB and performs similar.
%
%   See also IND2SUB, SUB2IND, FIND.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Created:	Mar 19, 2019
%
% Revisions:    0.1 (Mar 19, 2019)
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


[varargout{1:length(siz)}] = ind2sub(siz,ndx);

A = cell2mat( varargout );

end