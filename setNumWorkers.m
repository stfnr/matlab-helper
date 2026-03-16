function setNumWorkers( num_workers, profile)
%SETNUMWORKERS set the number of worker for the parallel cluster. 
%   setNumWorkers( 6 ) set the number of worker to six for the local
%   profile. 
%   setNumWorkers( 12, 'remote' ) set the number of worker to twelve for 
%   the 'remote' profile. 
%
%   See also PARCLUSTER, SAVEPROFILE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Created:	Mar 19, 2019
%
% Revisions:    0.1 (Mar 19, 2019)
%					Initial version.
%               0.2 (Mar 16, 2026)
%                   Added input validation and error handling.
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
if nargin < 1
    error('setNumWorkers:InsufficientInputs', 'Number of workers must be specified.');
end

if ~isnumeric(num_workers) || ~isscalar(num_workers) || num_workers < 1 || mod(num_workers, 1) ~= 0
    error('setNumWorkers:InvalidInput', 'num_workers must be a positive integer scalar.');
end

if nargin < 2
    profile = 'local';
end

if ~ischar(profile) && ~isstring(profile)
    error('setNumWorkers:InvalidInput', 'profile must be a string.');
end

try
    cluster = parcluster(profile);
    cluster.NumWorkers = num_workers;
    saveProfile(cluster); 
catch ME
    error('setNumWorkers:ProfileError', 'Failed to configure cluster profile: %s', ME.message);
end

end
