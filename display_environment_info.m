function display_environment_info()
%display_environment_info displays usefull information for documentation.
%   display_environment_info()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Created:	Oct 21, 2018
%
% Revisions: 	1.0 (Oct 21, 2018)
%                   Initial version.
%               1.1 (Oct 22, 2018)
%                   Improved formating and added some more information
%
% Authors: 
%
%   Stefan Ruschke (stefan.ruschke@tum.de)
% 
% -------------------------------------------------------------------------
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


fprintf('%s\n', ['Environment information (' datestr(now,'dd-mmm-yyyy HH:MM:SS') '):'])
fprintf('%s\n', 'System: ')
[system_str, system_maxsize, system_endian] = computer;
fprintf('  %s%s\n', 'Architecture: ', system_str)
fprintf('  %s%s\n', 'Maximum allowed array elements: ', system_maxsize)
fprintf('  %s%s\n', 'Endian byte order format: ', system_endian)
fprintf('%s\n', 'MATLAB: ')
fprintf('  %s%s\n', 'Release: ', ['R' version('-release')])
fprintf('  %s%s\n', 'Version: ', version)
fprintf('%s\n', 'JAVA: ')
fprintf('  %s%s\n', 'Version: ', version('-java'))
gitnfo = getGitInfo;
fprintf('%s\n', 'Git: ')
fprintf('  %s%s\n', 'branch: ', gitnfo.branch)
fprintf('  %s%s\n', 'hash: ', gitnfo.hash)
fprintf('  %s%s\n', 'remote name: ', gitnfo.remote)
fprintf('  %s%s\n', 'remote url: ', gitnfo.url)

end

