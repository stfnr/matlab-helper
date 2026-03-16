classdef shutdownParpoolTest < matlab.unittest.TestCase
    % shutdownParpoolTest 
    % tests can be run via
    %   >> shutdownParpoolTests = matlab.unittest.TestSuite.fromClass(?shutdownParpoolTest);
    %   >> result = run(shutdownParpoolTests);
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
        function testNoErrorWhenNoPool(testCase)
            % Test that no error occurs when no parallel pool exists
            % First ensure no pool is running
            poolobj = gcp('nocreate');
            if ~isempty(poolobj)
                delete(poolobj);
            end
            
            % Should not throw error
            testCase.verifyWarningFree(@shutdownParpool);
        end
        
        function testFunctionExists(testCase)
            % Test that the function exists and is accessible
            testCase.verifyTrue(exist('shutdownParpool', 'file') == 2);
        end
    end
    
end