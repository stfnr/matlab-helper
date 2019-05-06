classdef minnTest < matlab.unittest.TestCase
    % minnTest 
    % tests can be run via
    %   >> minnTests = matlab.unittest.TestSuite.fromClass(?minnTest);
    %   >> result = run(minnTests);
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    % Created:	Apr 15, 2019
    %
    % Revisions:    0.1 (Apr 15, 2019)
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
        function testInputOutputEqualsMinSolution(testCase)
            
            ary{1} = rand(3,1);
            ary{2} = rand(1,3);
            ary{3} = rand(3,3,1,3);
            ary{4} = rand(1,3,1,3);
            
            for i = 1:length(ary)
                actSolution = minn(ary{i});
                expSolution = min(ary{i}(:));
                testCase.verifyEqual(actSolution,expSolution);
            end
            
        end
    end
    
end