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

import matlab.unittest.TestRunner
import matlab.unittest.Verbosity
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.XMLPlugin
import matlab.unittest.plugins.codecoverage.CoberturaFormat
import matlab.unittest.TestSuite;

name = "matlab-helper";

TESTS_DIR = fileparts(fileparts(mfilename('fullpath')));
suite = TestSuite.fromFolder(TESTS_DIR, 'IncludingSubfolders', true); 
%suite = testsuite(name);
runner = TestRunner.withTextOutput('OutputDetail', Verbosity.Detailed);

mkdir('code-coverage');
mkdir('test-results');

runner.addPlugin(XMLPlugin.producingJUnitFormat('test-results/results.xml'));
runner.addPlugin(matlab.unittest.plugins.CodeCoveragePlugin.forFolder(TESTS_DIR, 'Producing', CoberturaFormat('code-coverage/coverage.xml'), 'IncludingSubfolders', true));


results = runner.run(suite);

disp('================================================================================================================')
disp('Results')
disp('================================================================================================================')
disp(table(results))
disp('================================================================================================================')

assert(~isempty(results), "no tests found")

assertSuccess(results)