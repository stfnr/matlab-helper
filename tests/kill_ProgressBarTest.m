classdef kill_ProgressBarTest < matlab.unittest.TestCase
    % kill_ProgressBarTest 
    % tests can be run via
    %   >> kill_ProgressBarTests = matlab.unittest.TestSuite.fromClass(?kill_ProgressBarTest);
    %   >> result = run(kill_ProgressBarTests);
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    % Created:	Mar 16, 2026
    %
    % Revisions:    0.1 (Mar 16, 2026)
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
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    methods (Test)
        function testNoErrorWhenNoTimers(testCase)
            % Test that no error occurs when no ProgressBar timers exist
            % First, delete any existing ProgressBar timers
            timers = timerfindall('Tag', 'ProgressBar');
            if ~isempty(timers)
                delete(timers);
            end
            
            % Should not throw error
            testCase.verifyWarningFree(@kill_ProgressBar);
        end
        
        function testFunctionExists(testCase)
            % Test that the function exists and is accessible
            testCase.verifyTrue(exist('kill_ProgressBar', 'file') == 2);
        end
        
        function testDeletesProgressBarTimers(testCase)
            % Test that ProgressBar timers are deleted
            % Create a test timer with ProgressBar tag
            t = timer('Tag', 'ProgressBar', 'TimerFcn', @(~,~) disp('test'));
            
            % Verify timer exists
            timers = timerfindall('Tag', 'ProgressBar');
            testCase.verifyTrue(length(timers) >= 1);
            
            % Call the function
            kill_ProgressBar();
            
            % Verify timer is deleted
            timers = timerfindall('Tag', 'ProgressBar');
            testCase.verifyTrue(isempty(timers));
        end
        
        function testDoesNotDeleteOtherTimers(testCase)
            % Test that timers with other tags are not deleted
            % Create a test timer with different tag
            t = timer('Tag', 'OtherTag', 'TimerFcn', @(~,~) disp('test'));
            
            % Call the function
            kill_ProgressBar();
            
            % Verify other timer still exists
            timers = timerfindall('Tag', 'OtherTag');
            testCase.verifyEqual(length(timers), 1);
            
            % Cleanup
            delete(t);
        end
    end
    
end