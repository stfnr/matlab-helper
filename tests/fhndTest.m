classdef fhndTest < matlab.unittest.TestCase
    % fhndTest 
    % tests can be run via
    %   >> fhndTests = matlab.unittest.TestSuite.fromClass(?fhndTest);
    %   >> result = run(fhndTests);
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
        function testBasicFunctionality(testCase)
            % Test basic functionality with various array sizes
            
            % Test with 2D array
            X = rand(3,4);
            Y = fhnd(@(x,d) max(x,[],d), X, 1);
            testCase.verifyEqual(size(Y), [1, 4]);
            testCase.verifyEqual(Y, max(X, [], 1));
            
            Y = fhnd(@(x,d) max(x,[],d), X, 2);
            testCase.verifyEqual(size(Y), [3, 1]);
            testCase.verifyEqual(Y, max(X, [], 2));
            
            % Test with 3D array
            X = rand(3,4,5);
            Y = fhnd(@(x,d) max(x,[],d), X, [1, 2]);
            testCase.verifyEqual(size(Y), [1, 1, 5]);
            testCase.verifyEqual(Y, max(max(X, [], 1), [], 2));
        end
        
        function testMultipleDimensions(testCase)
            % Test with multiple dimensions specified
            
            X = rand(3,3,3,3,3);
            Y = fhnd(@(x,d) max(x,[],d), X, [1, 3, 5]);
            testCase.verifyEqual(size(Y), [1, 3, 1, 3, 1]);
            
            % Verify result is correct
            expY = X;
            for d = [5, 3, 1]  % Apply in reverse order
                expY = max(expY, [], d);
            end
            testCase.verifyEqual(Y, expY);
        end
        
        function testUnsortedDimensions(testCase)
            % Test that unsorted DIM values work correctly
            
            X = rand(3,4,5);
            Y1 = fhnd(@(x,d) max(x,[],d), X, [1, 2]);
            Y2 = fhnd(@(x,d) max(x,[],d), X, [2, 1]);
            testCase.verifyEqual(Y1, Y2);
        end
        
        function testSingleElementArray(testCase)
            % Test with single element array
            
            X = 5;
            Y = fhnd(@(x,d) max(x,[],d), X, 1);
            testCase.verifyEqual(Y, 5);
        end
        
        function testEmptyArray(testCase)
            % Test with empty array
            
            X = [];
            Y = fhnd(@(x,d) max(x,[],d), X, 1);
            testCase.verifyEqual(Y, []);
        end
        
        function testComplexNumbers(testCase)
            % Test with complex number arrays
            
            X = rand(3,3) + 1i * rand(3,3);
            Y = fhnd(@(x,d) max(x,[],d), X, 1);
            testCase.verifyEqual(size(Y), [1, 3]);
            testCase.verifyEqual(Y, max(X, [], 1));
        end
        
        function testMinFunction(testCase)
            % Test with min function
            
            X = rand(3,4,5);
            Y = fhnd(@(x,d) min(x,[],d), X, [1, 2]);
            expY = min(min(X, [], 1), [], 2);
            testCase.verifyEqual(Y, expY);
        end
        
        function testMeanFunction(testCase)
            % Test with mean function
            
            X = rand(3,4,5);
            Y = fhnd(@(x,d) mean(x,d), X, [1, 2]);
            expY = mean(mean(X, 1), 2);
            testCase.verifyEqual(Y, expY, 'AbsTol', 1e-10);
        end
        
        function testSumFunction(testCase)
            % Test with sum function
            
            X = rand(3,4,5);
            Y = fhnd(@(x,d) sum(x,d), X, [1, 2]);
            expY = sum(sum(X, 1), 2);
            testCase.verifyEqual(Y, expY);
        end
        
        function testDimensionExceedsArrayDimensions(testCase)
            % Test when DIM exceeds array dimensions
            
            X = rand(3,4);
            Y = fhnd(@(x,d) max(x,[],d), X, [1, 5]);
            testCase.verifyEqual(size(Y), [1, 4, 1, 1, 1]);
        end
        
        function testAllDimensions(testCase)
            % Test when operating on all dimensions
            
            X = rand(3,4,5);
            Y = fhnd(@(x,d) max(x,[],d), X, [1, 2, 3]);
            testCase.verifyEqual(Y, max(X(:)));
        end
        
        function testErrorOnInsufficientInputs(testCase)
            % Test error when insufficient inputs provided
            
            testCase.verifyError(@() fhnd(), 'fhnd:InsufficientInputs');
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d)), 'fhnd:InsufficientInputs');
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3)), 'fhnd:InsufficientInputs');
        end
        
        function testErrorOnInvalidFunctionHandle(testCase)
            % Test error when first argument is not a function handle
            
            testCase.verifyError(@() fhnd('notAFunction', rand(3,3), 1), 'fhnd:InvalidInput');
            testCase.verifyError(@() fhnd(123, rand(3,3), 1), 'fhnd:InvalidInput');
        end
        
        function testErrorOnInvalidX(testCase)
            % Test error when X is not numeric
            
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), 'string', 1), 'fhnd:InvalidInput');
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), {'cell'}, 1), 'fhnd:InvalidInput');
        end
        
        function testErrorOnInvalidDIM(testCase)
            % Test error when DIM is invalid
            
            % Non-vector DIM
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3), [1; 2; 3]), 'fhnd:InvalidInput');
            
            % Negative dimension
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3), -1), 'fhnd:InvalidDimension');
            
            % Zero dimension
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3), 0), 'fhnd:InvalidDimension');
            
            % Non-integer dimension
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3), 1.5), 'fhnd:InvalidDimension');
            
            % NaN dimension
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3), NaN), 'fhnd:InvalidDimension');
            
            % Inf dimension
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3), Inf), 'fhnd:InvalidDimension');
        end
        
        function testErrorOnDuplicateDimensions(testCase)
            % Test error when DIM contains duplicate values
            
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3), [1, 1]), 'fhnd:DuplicateDimension');
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3,3), [1, 2, 1]), 'fhnd:DuplicateDimension');
        end
        
    end
    
end