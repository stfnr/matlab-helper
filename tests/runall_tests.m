%% Run all tests
% Helper to run all exisiting tests located under ./tests/

import matlab.unittest.TestSuite;

TESTS_DIR = fileparts(mfilename('fullpath'));

test_suite = TestSuite.fromFolder(TESTS_DIR, 'IncludingSubfolders', true);

test_suite_result = run(test_suite);

disp('================================================================================================================')
disp('Results')
disp('================================================================================================================')
disp(table(test_suite_result))
disp('================================================================================================================')
