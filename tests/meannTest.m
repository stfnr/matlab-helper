classdef meannTest < matlab.unittest.TestCase
    % meannTest 
    % tests can be run via
    %   >> meannTests = matlab.unittest.TestSuite.fromClass(?meannTest);
    %   >> result = run(meannTests);
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
        function testInputOutputEqualsMeanSolution(testCase)
            
            ary{1} = rand(3,1);
            ary{2} = rand(1,3);
            ary{3} = rand(3,3,1,3);
            ary{4} = rand(1,3,1,3);
            
            for i = 1:length(ary)
                actSolution = meann(ary{i});
                expSolution = mean(ary{i}(:));
                testCase.verifyEqual(actSolution,expSolution);
            end
            
        end
        
        function testSingleElement(testCase)
            % Test with single element array
            actSolution = meann(5);
            testCase.verifyEqual(actSolution, 5);
            
            actSolution = meann([5]);
            testCase.verifyEqual(actSolution, 5);
        end
        
        function testEmptyArray(testCase)
            % Test with empty array
            actSolution = meann([]);
            testCase.verifyTrue(isnan(actSolution));
        end
        
        function testComplexNumbers(testCase)
            % Test with complex numbers
            X = rand(3,3) + 1i * rand(3,3);
            actSolution = meann(X);
            expSolution = mean(X(:));
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testNegativeValues(testCase)
            % Test with negative values
            X = -rand(3,3);
            actSolution = meann(X);
            expSolution = mean(X(:));
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testAllZeros(testCase)
            % Test with all zeros
            X = zeros(3,3);
            actSolution = meann(X);
            testCase.verifyEqual(actSolution, 0);
        end
        
        function testNaNValues(testCase)
            % Test with NaN values
            X = [1, NaN, 3, 5];
            actSolution = meann(X);
            expSolution = mean(X(:));
            testCase.verifyTrue(isnan(actSolution));
        end
        
        function testMixedNaN(testCase)
            % Test with mixed values including NaN
            X = [1, 2, NaN, 4];
            actSolution = meann(X);
            % mean with NaN returns NaN
            testCase.verifyTrue(isnan(actSolution));
        end
        
        function testInfValues(testCase)
            % Test with Inf values
            X = [1, Inf, 3, -Inf];
            actSolution = meann(X);
            expSolution = mean(X(:));
            testCase.verifyEqual(actSolution, expSolution);
        end
        
        function testAllInf(testCase)
            % Test with all Inf values
            X = [Inf, Inf, Inf];
            actSolution = meann(X);
            testCase.verifyTrue(isinf(actSolution) && actSolution > 0);
        end
        
        function testSparseMatrix(testCase)
            % Test with sparse matrix
            X = sparse(100, 100);
            X(50, 50) = 10;
            X(25, 75) = 5;
            actSolution = meann(X);
            % Mean of sparse matrix with mostly zeros
            % Convert to full for comparison
            testCase.verifyEqual(full(actSolution), 15/10000, 'AbsTol', 1e-10);
        end
        
        function testIntegerTypes(testCase)
            % Test with integer types
            X = int8([1, 2, 3, 4]);
            actSolution = meann(X);
            testCase.verifyEqual(actSolution, mean(X(:)));
            
            X = uint16([100, 200, 300]);
            actSolution = meann(X);
            testCase.verifyEqual(actSolution, mean(X(:)));
        end
    end
    
end