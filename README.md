# COpenBlas

A Swift wrapper for the C libraries `libopenblas-dev` and `liblapacke-dev`. They provide various matrix and hardware accelerated linear algebra operations. On MacOS, this functionality is provided by [Accelerate](https://developer.apple.com/documentation/accelerate). However, Accelerate does not run in Linux environments. Hence, `COpenBlas`. Currently, `COpenBlas` only supports 64-bit arm Linux environments. I don't have any other machines to test on, so if you download it and it won't compile, `module.modulemap` probably needs an entry with the correct header for your environment.

## Install
On Mac, no installation is needed. Use compiler directives to check if Accelerate is available and not import COpenBlas if so.

On Linux, run `apt-get install libopenblas-dev` and `apt-get install liblapacke-dev` (notice the 'e' in 'lapacke'). You should be able to build COpenBlas now.
## Usage
* In your `Package.swift`, add `.package(url: "https://github.com/CooperCorona/COpenBlas.git", from: "1.0.0")` (or whatever version you want to use) in the `dependencies` array. Then, in the `dependencies` array for each target, add `COpenBlas`.
* In any file you want to use BLAS or LAPACK functions, add the following to your imports:
```
#if os(macOS)
import Accelerate
#else
import COpenBlas
// Optional
private typealias __CLPK_integer = Int32
#endif
```
`Accelerate` only exists on Mac, but `COpenBlas` only exists on Linux. The `__CLPK_integer` typealias is defined by `Accelerate`. If you use it, you may need to define it yourself. **WARNING:** I _think_ `Int32` is the correct type, but it may depend on environment, so I'm not sure.
