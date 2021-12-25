%% Run all tests
% Helper to run all exisiting tests located under ./tests/
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Created:	Apr 16, 2019
%
% Revisions:    0.1 (Apr 16, 2019)
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


import matlab.unittest.TestSuite;

TESTS_DIR = fileparts(fileparts(mfilename('fullpath')));

test_suite = TestSuite.fromFolder(TESTS_DIR, 'IncludingSubfolders', true);

test_suite_result = run(test_suite);

disp('================================================================================================================')
disp('Results')
disp('================================================================================================================')
disp(table(test_suite_result))
disp('================================================================================================================')
