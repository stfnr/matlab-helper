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
    %               0.2 (Mar 16, 2026)
    %                   Simplified tests to focus on core functionality.
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
            % fhnd collapses dimensions 1 and 2, leaving dimension 3
            expY = sum(sum(X, 1), 2);
            % Both should have size [1, 1, 5]
            testCase.verifyEqual(size(Y), [1, 1, 5]);
            testCase.verifyEqual(squeeze(Y), squeeze(expY), 'AbsTol', 1e-10);
        end
        
        function testAllDimensions(testCase)
            % Test when operating on all dimensions
            
            X = rand(3,4,5);
            Y = fhnd(@(x,d) max(x,[],d), X, [1, 2, 3]);
            testCase.verifyEqual(Y, max(X(:)));
        end
        
        function testInvalidFunctionHandle(testCase)
            % Test error when first argument is not a function handle
            
            testCase.verifyError(@() fhnd('notAFunction', rand(3,3), 1), 'fhnd:InvalidInput');
            testCase.verifyError(@() fhnd(123, rand(3,3), 1), 'fhnd:InvalidInput');
        end
        
        function testInvalidX(testCase)
            % Test error when X is not numeric
            
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), 'string', 1), 'fhnd:InvalidInput');
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), {'cell'}, 1), 'fhnd:InvalidInput');
        end
        
        function testInvalidDIM(testCase)
            % Test error when DIM is invalid
            
            % Negative dimension
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3), -1), 'fhnd:InvalidDimension');
            
            % Zero dimension
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3), 0), 'fhnd:InvalidDimension');
            
            % Non-integer dimension
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3), 1.5), 'fhnd:InvalidDimension');
            
            % NaN dimension
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3), NaN), 'fhnd:InvalidDimension');
        end
        
        function testDuplicateDimensions(testCase)
            % Test error when DIM contains duplicate values
            
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3), [1, 1]), 'fhnd:DuplicateDimension');
            testCase.verifyError(@() fhnd(@(x,d) max(x,[],d), rand(3,3,3), [1, 2, 1]), 'fhnd:DuplicateDimension');
        end
        
    end
    
end