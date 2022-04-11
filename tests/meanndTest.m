classdef meanndTest < matlab.unittest.TestCase
    % meanndTest
    % tests can be run via
    %   >> meanndTests = matlab.unittest.TestSuite.fromClass(?meanndTest);
    %   >> result = run(meanndTests);
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
        function testInputOutputEqualsSolution(testCase)
            
            % ary: 1
            
            ary{1} = zeros(3,1);
            ary{1}(2) = 6;
            
            dims{1}{1} = 1;
            esol{1}{1} = 2;
            dims{1}{2} = 2;
            esol{1}{2} = ary{1};
            dims{1}{3} = [1 2];
            esol{1}{3} = 2;
            
            
            % ary: 2
            
            ary{2} = zeros(1,3);
            ary{2}(2) = 9;
            
            dims{2}{1} = 1;
            esol{2}{1} = ary{2};
            dims{2}{2} = 2;
            esol{2}{2} = 3;
            
            
            for iAry = 1:length(ary)
                for iDims = 1:length(dims{iAry})
                    
                    log(testCase,1,['current test data set: ary{' num2str(iAry) '} dims{' num2str(iAry) '}{' num2str(iDims) '}']);
                    
                    actSolution = meannd( ary{iAry}, dims{iAry}{iDims} );
                    expSolution = esol{iAry}{iDims};
                    
                    testCase.verifyEqual(actSolution,expSolution);
                end
            end
            
        end
    end
    
end