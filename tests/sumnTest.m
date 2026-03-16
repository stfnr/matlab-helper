classdef sumnTest < matlab.unittest.TestCase
    % sumnTest 
    % tests can be run via
    %   >> sumnTests = matlab.unittest.TestSuite.fromClass(?sumnTest);
    %   >> result = run(sumnTests);
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    % Created:	Apr 15, 2019
    %
    % Revisions:    0.1 (Apr 15, 2019)
    %					Initial version.
    %               0.2 (Mar 16, 2026)
    %                   Added edge case tests (single element, empty, complex, negative, zeros).
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
        function testInputOutputEqualsSumSolution(testCase)
            
            ary{1} = rand(3,1);
            ary{2} = rand(1,3);
            ary{3} = rand(3,3,1,3);
            ary{4} = rand(1,3,1,3);
            
            for i = 1:length(ary)
                actSolution = sumn(ary{i});
                expSolution = sum(ary{i}(:));
                testCase.verifyEqual(actSolution,expSolution);
            end
            
        end
        
        function testSingleElement(testCase)
            % Test with single element array
            actSolution = sumn(5);
            testCase.verifyEqual(actSolution, 5);
            
            actSolution = sumn([5]);
            testCase.verifyEqual(actSolution, 5);
        end
        
        function testEmptyArray(testCase)
            % Test with empty array
            actSolution = sumn([]);
            testCase.verifyEqual(actSolution, 0);
        end
        
        function testComplexNumbers(testCase)
            % Test with complex numbers
            X = rand(3,3) + 1i * rand(3,3);
            actSolution = sumn(X);
            expSolution = sum(X(:));
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testNegativeValues(testCase)
            % Test with negative values
            X = -rand(3,3);
            actSolution = sumn(X);
            expSolution = sum(X(:));
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testAllZeros(testCase)
            % Test with all zeros
            X = zeros(3,3);
            actSolution = sumn(X);
            testCase.verifyEqual(actSolution, 0);
        end
        
        function testMixedPositiveNegative(testCase)
            % Test with mixed positive and negative values
            X = [1, -1, 2, -2, 3, -3];
            actSolution = sumn(X);
            testCase.verifyEqual(actSolution, 0);
        end
        
        function testNaNValues(testCase)
            % Test with NaN values
            X = [1, NaN, 3, 5];
            actSolution = sumn(X);
            expSolution = sum(X(:));
            testCase.verifyTrue(isnan(actSolution));
        end
        
        function testInfValues(testCase)
            % Test with Inf values
            X = [1, Inf, 3, -Inf];
            actSolution = sumn(X);
            expSolution = sum(X(:));
            testCase.verifyTrue(isnan(actSolution));
        end
        
        function testAllInf(testCase)
            % Test with all Inf values
            X = [Inf, Inf, Inf];
            actSolution = sumn(X);
            testCase.verifyEqual(actSolution, Inf);
        end
        
        function testNegativeInf(testCase)
            % Test with all -Inf values
            X = [-Inf, -Inf, -Inf];
            actSolution = sumn(X);
            testCase.verifyEqual(actSolution, -Inf);
        end
        
        function testSparseMatrix(testCase)
            % Test with sparse matrix
            X = sparse(100, 100);
            X(50, 50) = 10;
            X(25, 75) = 5;
            actSolution = sumn(X);
            % Convert sparse result to full for comparison
            testCase.verifyEqual(full(actSolution), 15);
        end
        
        function testIntegerTypes(testCase)
            % Test with integer types
            X = int8([1, 2, 3, 4]);
            actSolution = sumn(X);
            % sum returns double for integer types
            testCase.verifyEqual(actSolution, double(10));
            
            X = uint16([100, 200, 300]);
            actSolution = sumn(X);
            testCase.verifyEqual(actSolution, double(600));
        end
    end
    
end