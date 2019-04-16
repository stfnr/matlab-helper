classdef maxndTest < matlab.unittest.TestCase
    % maxndTest
    % tests can be run via
    %   >> maxndTests = matlab.unittest.TestSuite.fromClass(?maxndTest);
    %   >> result = run(maxndTests);
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
            
            ary{1} = ones(3,1);
            ary{1}(2) = 2;
            
            dims{1}{1} = 1;
            esol{1}{1} = 2;
            dims{1}{2} = 2;
            esol{1}{2} = ary{1};
            dims{1}{3} = [1 2];
            esol{1}{3} = 2;
            
            
            % ary: 2
            
            ary{2} = ones(1,3);
            ary{2}(2) = 3;
            
            dims{2}{1} = 1;
            esol{2}{1} = ary{2};
            dims{2}{2} = 2;
            esol{2}{2} = 3;
            
            
            % ary: 3
            
            ary{3} = ones(3,3,1,3,4);
            ary{3}(2,1,1,1,1) = 2;
            ary{3}(1,1,1,2,1) = 3;
            ary{3}(1,1,1,2,4) = 4;
            
            dims{3}{1} = 1;
            esol{3}{1} = ones(1,3,1,3,4);
            esol{3}{1}(1,1,1,1,1) = 2;
            esol{3}{1}(1,1,1,2,1) = 3;
            esol{3}{1}(1,1,1,2,4) = 4;
            
            dims{3}{2} = 2;
            esol{3}{2} = ones(3,1,1,3,4);
            esol{3}{2}(2,1,1,1,1) = 2;
            esol{3}{2}(1,1,1,2,1) = 3;
            esol{3}{2}(1,1,1,2,4) = 4;
            
            dims{3}{3} = 3;
            esol{3}{3} = ary{3};
            
            dims{3}{4} = 4;
            esol{3}{4} = ones(3,3,1,1,4);
            esol{3}{4}(2,1,1,1,1) = 2;
            esol{3}{4}(1,1,1,1,1) = 3;
            esol{3}{4}(1,1,1,1,4) = 4;
            
            dims{3}{5} = 5;
            esol{3}{5} = ones(3,3,1,3,1);
            esol{3}{5}(2,1,1,1,1) = 2;
            esol{3}{5}(1,1,1,2,1) = 4;
            
            dims{3}{6} = [1 2];
            esol{3}{6} = ones(1,1,1,3,4);
            esol{3}{6}(1,1,1,1,1) = 2;
            esol{3}{6}(1,1,1,2,1) = 3;
            esol{3}{6}(1,1,1,2,4) = 4;
            
            dims{3}{7} = [1 3];
            esol{3}{7} = ones(1,3,1,3,4);
            esol{3}{7}(1,1,1,1,1) = 2;
            esol{3}{7}(1,1,1,2,1) = 3;
            esol{3}{7}(1,1,1,2,4) = 4;
            
            dims{3}{8} = [1 5];
            esol{3}{8} = ones(1,3,1,3,1);
            esol{3}{8}(1,1,1,1,1) = 2;
            esol{3}{8}(1,1,1,2,1) = 4;
            
            dims{3}{9} = [2 3];
            esol{3}{9} = ones(3,1,1,3,4);
            esol{3}{9}(2,1,1,1,1) = 2;
            esol{3}{9}(1,1,1,2,1) = 3;
            esol{3}{9}(1,1,1,2,4) = 4;
            
            dims{3}{10} = [2 5];
            esol{3}{10} = ones(3,1,1,3,1);
            esol{3}{10}(2,1,1,1,1) = 2;
            esol{3}{10}(1,1,1,2,1) = 4;
            
            dims{3}{11} = [3 5];
            esol{3}{11} = ones(3,3,1,3,1);
            esol{3}{11}(2,1,1,1,1) = 2;
            esol{3}{11}(1,1,1,2,1) = 4;
            
            dims{3}{12} = [4 5];
            esol{3}{12} = ones(3,3,1,1,1);
            esol{3}{12}(2,1,1,1,1) = 2;
            esol{3}{12}(1,1,1,1,1) = 4;
            
            
            % ary: 4
            
            ary{4} = ones(1,3,1,3,4);
            ary{4}(1,2,1,1,1) = 2;
            ary{4}(1,1,1,2,1) = 3;
            ary{4}(1,1,1,2,4) = 4;
            
            dims{4}{1} = 1;
            esol{4}{1} = ary{4};

            dims{4}{2} = 2;
            esol{4}{2} = ones(1,1,1,3,4);
            esol{4}{2}(1,1,1,1,1) = 2;
            esol{4}{2}(1,1,1,2,1) = 3;
            esol{4}{2}(1,1,1,2,4) = 4;
            
            dims{4}{3} = 3;
            esol{4}{3} = ary{4};
            
            dims{4}{4} = 4;
            esol{4}{4} = ones(1,3,1,1,4);
            esol{4}{4}(1,2,1,1,1) = 2;
            esol{4}{4}(1,1,1,1,1) = 3;
            esol{4}{4}(1,1,1,1,4) = 4;
            
            dims{4}{5} = 5;
            esol{4}{5} = ones(1,3,1,3,1);
            esol{4}{5}(1,2,1,1,1) = 2;
            esol{4}{5}(1,1,1,2,1) = 4;
            
            dims{4}{6} = [1 2];
            esol{4}{6} = ones(1,1,1,3,4);
            esol{4}{6}(1,1,1,1,1) = 2;
            esol{4}{6}(1,1,1,2,1) = 3;
            esol{4}{6}(1,1,1,2,4) = 4;
            
            dims{4}{7} = [1 3];
            esol{4}{7} = ary{4};

            dims{4}{8} = [1 5];
            esol{4}{8} = ones(1,3,1,3,1);
            esol{4}{8}(1,2,1,1,1) = 2;
            esol{4}{8}(1,1,1,2,1) = 4;
            
            
            dims{4}{9} = [2 3];
            esol{4}{9} = ones(1,1,1,3,4);
            esol{4}{9}(1,1,1,1,1) = 2;
            esol{4}{9}(1,1,1,2,1) = 3;
            esol{4}{9}(1,1,1,2,4) = 4;
            
            dims{4}{10} = [2 5];
            esol{4}{10} = ones(1,1,1,3,1);
            esol{4}{10}(1,1,1,1,1) = 2;
            esol{4}{10}(1,1,1,2,1) = 4;
            
            
            dims{4}{11} = [3 5];
            esol{4}{11} = ones(1,3,1,3,1);
            esol{4}{11}(1,2,1,1,1) = 2;
            esol{4}{11}(1,1,1,2,1) = 4;      
            
            dims{4}{12} = [4 5];
            esol{4}{12} = ones(1,3,1,1,1);
            esol{4}{12}(1,2,1,1,1) = 2;
            esol{4}{12}(1,1,1,1,1) = 4;
            
            for iAry = 1:length(ary)
                for iDims = 1:length(dims{iAry})
                    
                    log(testCase,1,['current test data set: ary{' num2str(iAry) '} dims{' num2str(iAry) '}{' num2str(iDims) '}']);
                    
                    actSolution = maxnd( ary{iAry}, dims{iAry}{iDims} );
                    expSolution = esol{iAry}{iDims};
                    
                    testCase.verifyEqual(actSolution,expSolution);
                end
            end
            
        end
    end
    
end