classdef maxnTest < matlab.unittest.TestCase
    % maxnTest 
    % tests can be run via
    %   >> maxnTests = matlab.unittest.TestSuite.fromClass(?maxnTest);
    %   >> result = run(maxnTests);
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    % Created:	Apr 15, 2019
    %
    % Revisions:    0.1 (Apr 15, 2019)
    %					Initial version.
    %               0.2 (Mar 16, 2026)
    %                   Added edge case tests (single element, empty, complex, negative, index).
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
        function testInputOutputEqualsMaxSolution(testCase)
            
            ary{1} = rand(3,1);
            ary{2} = rand(1,3);
            ary{3} = rand(3,3,1,3);
            ary{4} = rand(1,3,1,3);
            
            for i = 1:length(ary)
                actSolution = maxn(ary{i});
                expSolution = max(ary{i}(:));
                testCase.verifyEqual(actSolution,expSolution);
            end
            
        end
        
        function testSingleElement(testCase)
            % Test with single element array
            actSolution = maxn(5);
            testCase.verifyEqual(actSolution, 5);
            
            actSolution = maxn([5]);
            testCase.verifyEqual(actSolution, 5);
        end
        
        function testEmptyArray(testCase)
            % Test with empty array
            [actSolution, I] = maxn([]);
            testCase.verifyEqual(actSolution, []);
            testCase.verifyEqual(I, []);
        end
        
        function testComplexNumbers(testCase)
            % Test with complex numbers
            X = rand(3,3) + 1i * rand(3,3);
            actSolution = maxn(X);
            expSolution = max(X(:));
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testNegativeValues(testCase)
            % Test with negative values
            X = -rand(3,3);
            actSolution = maxn(X);
            expSolution = max(X(:));
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testReturnsIndex(testCase)
            % Test that index is returned correctly
            X = [1, 5, 3, 2];
            [y, I] = maxn(X);
            testCase.verifyEqual(y, 5);
            testCase.verifyEqual(I, 2);
        end
        
        function testNaNValues(testCase)
            % Test with NaN values
            X = [1, NaN, 3, 5];
            actSolution = maxn(X);
            expSolution = max(X(:));
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testAllNaN(testCase)
            % Test with all NaN values
            X = [NaN, NaN, NaN];
            actSolution = maxn(X);
            testCase.verifyTrue(isnan(actSolution));
        end
        
        function testInfValues(testCase)
            % Test with Inf values
            X = [1, Inf, 3, -Inf];
            actSolution = maxn(X);
            expSolution = max(X(:));
            testCase.verifyEqual(actSolution, Inf);
        end
        
        function testNegativeInf(testCase)
            % Test with -Inf values
            X = [-Inf, -10, -5];
            actSolution = maxn(X);
            testCase.verifyEqual(actSolution, -5);
        end
        
        function testSparseMatrix(testCase)
            % Test with sparse matrix
            X = sparse(100, 100);
            X(50, 50) = 10;
            X(25, 75) = 5;
            actSolution = maxn(X);
            % Convert sparse result to full for comparison
            testCase.verifyEqual(full(actSolution), 10);
        end
        
        function testIntegerTypes(testCase)
            % Test with integer types
            X = int8([1, 5, 3, 2]);
            actSolution = maxn(X);
            testCase.verifyEqual(actSolution, int8(5));
            
            X = uint16([100, 200, 150]);
            actSolution = maxn(X);
            testCase.verifyEqual(actSolution, uint16(200));
        end
    end
    
end