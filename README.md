# matlab-helper

[![codecov](https://codecov.io/gh/stfnr/matlab-helper/branch/master/graph/badge.svg?token=H997NAIBQ8)](https://codecov.io/gh/stfnr/matlab-helper)

Collection of MATLAB helper scripts and snippets, mainly for N-dimensional array operations and parallel computing utilities.

## Installation

Add the `matlab-helper` directory with subdirectories to MATLAB path (recommended for full functionality):

```matlab
addpath(genpath('/path/to/matlab-helper'));
```

## Functions

### N-dimensional Array Operations

These functions extend MATLAB's built-in operations to work across multiple dimensions simultaneously.

| Function | Description |
|----------|-------------|
| `fhnd` | Core function to perform any operation along multiple dimensions |
| `maxnd` | Maximum along multiple dimensions |
| `minnd` | Minimum along multiple dimensions |
| `meannd` | Mean along multiple dimensions |
| `maxn` | Maximum of all elements (equivalent to `max(x(:))`) |
| `minn` | Minimum of all elements (equivalent to `min(x(:))`) |
| `meann` | Mean of all elements (equivalent to `mean(x(:))`) |
| `sumn` | Sum of all elements (equivalent to `sum(x(:))`) |

### Utility Functions

| Function | Description |
|----------|-------------|
| `display_environment_info` | Display system, MATLAB, and Git information for documentation |
| `setNumWorkers` | Set the number of workers for parallel computing |
| `shutdownParpool` | Safely shutdown the parallel pool |
| `kill_ProgressBar` | Clean up ProgressBar timer objects |
| `ind2subarray` | Convert linear index to subscript array |

## Usage Examples

### Using `fhnd` for Custom Operations

```matlab
% Perform max along dimensions 1, 3, and 5
X = rand(3, 3, 3, 3, 3);
Y = fhnd(@(x,d) max(x,[],d), X, [1 3 5]);
% Result: Y has size [1, 3, 1, 3, 1]
```

### Using `maxnd`, `minnd`, `meannd`

```matlab
% Maximum along dimensions 1 and 2
X = rand(4, 5, 6);
Y = maxnd(X, [1, 2]);
% Result: Y has size [1, 1, 6]

% Minimum along dimension 3
Y = minnd(X, 3);
% Result: Y has size [4, 5, 1]

% Mean along dimensions 1 and 3
Y = meannd(X, [1, 3]);
% Result: Y has size [1, 5, 1]
```

### Using `maxn`, `minn`, `meann`, `sumn`

```matlab
X = rand(3, 4, 5);

% Get maximum of all elements
maxVal = maxn(X);  % Equivalent to max(X(:))

% Get minimum of all elements
minVal = minn(X);  % Equivalent to min(X(:))

% Get mean of all elements
meanVal = meann(X);  % Equivalent to mean(X(:))

% Get sum of all elements
sumVal = sumn(X);  % Equivalent to sum(X(:))
```

### Parallel Computing Utilities

```matlab
% Set number of workers for local profile
setNumWorkers(6);

% Set number of workers for a specific profile
setNumWorkers(12, 'remote');

% Safely shutdown parallel pool
shutdownParpool();
```

### Display Environment Information

```matlab
% Display system, MATLAB, and Git information
display_environment_info();
```

## Running Tests

Run all tests from the `tests` directory:

```matlab
cd tests;
runall_tests;
```

Or run individual test classes:

```matlab
fhndTests = matlab.unittest.TestSuite.fromClass(?fhndTest);
result = run(fhndTests);
```

## Dependencies

### Third-Party Tools (included in `3rd/` directory)

- **GetFullPath** - Get full path of files
- **getGitInfo** - Extract Git repository information
- **MatlabProgressBar** - Progress bar for MATLAB operations
- **rdir** - Recursive directory listing
- **tight_subplot** - Create tightly packed subplots
- **transposeTable** - Transpose MATLAB tables

## License

See [LICENSE](LICENSE) file for license information.

## Authors

Stefan Ruschke (stefan.ruschke@tum.de)

### Institution

Body Magnetic Resonance Research Group  
Department of Diagnostic and Interventional Radiology  
Technical University of Munich  
Klinikum rechts der Isar  
22 Ismaninger St., 81675 Munich  

https://www.bmrr.de
