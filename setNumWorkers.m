function setNumWorkers( num_workers, profile)
%SETNUMWORKERS set the number of worker for the parallel cluster. 
%   setNumWorkers( 6 ) set the number of worker to six for the local
%   profile. 
%   setNumWorkers( 12, 'remote' ) set the number of worker to twelve for 
%   the 'remote' profile. 
%
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

if nargin < 2
    profile = 'local';
end

cluster = parcluster(profile);
cluster.NumWorkers = num_workers;
saveProfile(cluster); 

end

