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
%               0.2 (Mar 16, 2026)
%                   Added edge case tests (single element, empty, complex, negative).
%               0.3 (Mar 16, 2026)
%                   Added NaN/Inf and sparse matrix tests.
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
        
        function testSingleElement(testCase)
            % Test with single element array
            actSolution = meannd(5, 1);
            testCase.verifyEqual(actSolution, 5);
        end
        
        function testEmptyArray(testCase)
            % Test with empty array
            actSolution = meannd([], 1);
            % meannd returns empty array for empty input
            testCase.verifyEqual(actSolution, []);
        end
        
        function testComplexNumbers(testCase)
            % Test with complex numbers
            X = rand(3,3) + 1i * rand(3,3);
            actSolution = meannd(X, 1);
            expSolution = mean(X, 1);
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testNegativeValues(testCase)
            % Test with negative values
            X = -rand(3,4);
            actSolution = meannd(X, 1);
            expSolution = mean(X, 1);
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testAllSameValues(testCase)
            % Test with all same values
            X = ones(3,4,5);
            actSolution = meannd(X, [1, 2]);
            testCase.verifyEqual(actSolution, ones(1,1,5));
        end
        
        function testNaNValues(testCase)
            % Test with NaN values
            X = [1, NaN, 3; 4, 5, 6];
            actSolution = meannd(X, 1);
            expSolution = mean(X, 1);
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testInfValues(testCase)
            % Test with Inf values
            X = [1, Inf, -Inf; 4, 5, 6];
            actSolution = meannd(X, 1);
            expSolution = mean(X, 1);
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testSparseMatrix(testCase)
            % Test with sparse matrix
            X = sparse(10, 10);
            X(5, 5) = 10;
            X(3, 7) = 5;
            actSolution = meannd(X, 1);
            expSolution = mean(X, 1);
            testCase.verifyEqual(actSolution, expSolution, 'AbsTol', 1e-10);
        end
        
        function testIntegerTypes(testCase)
            % Test with integer types
            X = int8([1, 2, 3; 4, 5, 6]);
            actSolution = meannd(X, 1);
            expSolution = mean(X, 1);
            testCase.verifyEqual(actSolution, expSolution);
        end
    end
    
end