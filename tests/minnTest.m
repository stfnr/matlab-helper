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
    %               0.2 (Mar 16, 2026)
    %                   Added edge case tests (single element, empty, complex, negative).
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
        
        function testSingleElement(testCase)
            % Test with single element array
            actSolution = minn(5);
            testCase.verifyEqual(actSolution, 5);
            
            actSolution = minn([5]);
            testCase.verifyEqual(actSolution, 5);
        end
        
        function testEmptyArray(testCase)
            % Test with empty array
            [actSolution, I] = minn([]);
            testCase.verifyEqual(actSolution, []);
            testCase.verifyEqual(I, []);
        end
        
        function testComplexNumbers(testCase)
            % Test with complex numbers
            X = rand(3,3) + 1i * rand(3,3);
            actSolution = minn(X);
            expSolution = min(X(:));
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testNegativeValues(testCase)
            % Test with negative values
            X = -rand(3,3);
            actSolution = minn(X);
            expSolution = min(X(:));
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testNaNValues(testCase)
            % Test with NaN values
            X = [1, NaN, 3, 5];
            actSolution = minn(X);
            expSolution = min(X(:));
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testAllNaN(testCase)
            % Test with all NaN values
            X = [NaN, NaN, NaN];
            actSolution = minn(X);
            testCase.verifyTrue(isnan(actSolution));
        end
        
        function testInfValues(testCase)
            % Test with Inf values
            X = [1, Inf, 3, -Inf];
            actSolution = minn(X);
            expSolution = min(X(:));
            testCase.verifyEqual(actSolution, -Inf);
        end
        
        function testPositiveInf(testCase)
            % Test with all Inf values
            X = [Inf, Inf, 10, 5];
            actSolution = minn(X);
            testCase.verifyEqual(actSolution, 5);
        end
        
        function testSparseMatrix(testCase)
            % Test with sparse matrix
            X = sparse(100, 100);
            X(50, 50) = 10;
            X(25, 75) = -5;
            X(10, 10) = 3;
            actSolution = minn(X);
            % Convert sparse result to full for comparison
            testCase.verifyEqual(full(actSolution), -5);
        end
        
        function testIntegerTypes(testCase)
            % Test with integer types
            X = int8([1, 5, 3, 2]);
            actSolution = minn(X);
            testCase.verifyEqual(actSolution, int8(1));
            
            X = uint16([100, 200, 150]);
            actSolution = minn(X);
            testCase.verifyEqual(actSolution, uint16(100));
        end
    end
    
end