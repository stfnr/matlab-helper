classdef ind2subarrayTest < matlab.unittest.TestCase
    % ind2subarrayTest 
    % tests can be run via
    %   >> ind2subarrayTests = matlab.unittest.TestSuite.fromClass(?ind2subarrayTest);
    %   >> result = run(ind2subarrayTests);
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    % Created:	Apr 4, 2019
    %
    % Revisions:    0.1 (Apr 4, 2019)
    %					Initial version.
    %               0.2 (Mar 16, 2026)
    %                   Added additional tests (simple array, multiple indices, edge cases).
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
        function testInputOutputSolution(testCase)
            
            siz{1} = [1 19 1 1 2 1 9 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
            ndx{1} = 100;
            A{1} = [1 5 1 1 2 1 3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
            
            siz{2} = [1 19 1 1 2 1 9 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
            ndx{2} = 1;
            A{2} = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
            
            siz{3} = [1 19 1 1 2 1 9 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
            ndx{3} = 342;
            A{3} = [1 19 1 1 2 1 9 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

            for i = 1:length(siz)
                actSolution = ind2subarray(siz{i},ndx{i});
                expSolution = A{i};
                testCase.verifyEqual(actSolution,expSolution);
            end
            
        end
        
        function testSimpleArray(testCase)
            % Test with simple 2D array
            siz = [3, 4];
            ndx = 5;  % Row 2, Column 2 (row-major: 1+3=4, 2+3=5)
            actSolution = ind2subarray(siz, ndx);
            % ind2sub returns [row, col], so for index 5 in a 3x4 matrix:
            % row = mod(5-1, 3) + 1 = 2, col = floor((5-1)/3) + 1 = 2
            testCase.verifyEqual(actSolution(1), 2);
            testCase.verifyEqual(actSolution(2), 2);
        end
        
        function testMultipleIndices(testCase)
            % Test with multiple indices
            siz = [3, 4];
            ndx = [1, 5, 12];
            actSolution = ind2subarray(siz, ndx);
            % cell2mat horizontally concatenates, producing [1, 2, 3, 1, 2, 4]
            % i.e., [row_vals, col_vals] = [1,2,3, 1,2,4]
            testCase.verifyEqual(size(actSolution), [1, 6]);
            % Verify the concatenated values
            % Index 1 -> (1,1), Index 5 -> (2,2), Index 12 -> (3,4)
            % Output: [row1, row2, row3, col1, col2, col3] = [1, 2, 3, 1, 2, 4]
            testCase.verifyEqual(actSolution, [1, 2, 3, 1, 2, 4]);
        end
        
        function testSingleDimension(testCase)
            % Test with single dimension array
            siz = [10];
            ndx = 5;
            actSolution = ind2subarray(siz, ndx);
            testCase.verifyEqual(actSolution, 5);
        end
        
        function testLastIndex(testCase)
            % Test with last index
            siz = [3, 4, 2];
            ndx = prod(siz);  % 24
            actSolution = ind2subarray(siz, ndx);
            % Should give the last element: [3, 4, 2]
            testCase.verifyEqual(actSolution(1), 3);
            testCase.verifyEqual(actSolution(2), 4);
            testCase.verifyEqual(actSolution(3), 2);
        end
        
        function testFirstIndex(testCase)
            % Test with first index
            siz = [3, 4, 2];
            ndx = 1;
            actSolution = ind2subarray(siz, ndx);
            testCase.verifyEqual(actSolution(1), 1);
            testCase.verifyEqual(actSolution(2), 1);
            testCase.verifyEqual(actSolution(3), 1);
        end
    end
    
end