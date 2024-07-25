{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  gbenchmark,
  git,
  substituteSource,
}:
let
  sources = rec {
    google_benchmark_vendor = substituteSource {
      src = fetchgit {
        name = "google_benchmark_vendor-source";
        url = "https://github.com/ros2-gbp/google_benchmark_vendor-release.git";
        rev = "9928f8c2fe03fd257d1e5a797d36514937a1df61";
        hash = "sha256-Rr+EgdHdf5F24w5vZYHtuJB4eogZULxjQwDbfqTeQlE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${google_benchmark_vendor-vendor_source-benchmark-0}";
        }
      ];
    };
    google_benchmark_vendor-vendor_source-benchmark-0 = substituteSource {
      src = fetchgit {
        name = "google_benchmark_vendor-vendor_source-benchmark-0-source";
        url = "https://github.com/google/benchmark.git";
        rev = "0d98dba29d66e93259db7daa53a9327df767a415";
        hash = "sha256-yUiFxi80FWBmTZgqmqTMf9oqcBeg3o4I4vKd4djyRWY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "google_benchmark_vendor";
  version = "0.3.0-4";
  src = sources.google_benchmark_vendor;
  nativeBuildInputs = [ cmake git ];
  propagatedNativeBuildInputs = [ gbenchmark ];
  buildInputs = [ cmake git ];
  propagatedBuildInputs = [ gbenchmark ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
