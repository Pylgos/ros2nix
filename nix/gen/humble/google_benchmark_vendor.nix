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
        rev = "09fbf04c117c61fb62ca998d7761b56f810894a4";
        hash = "sha256-8l3apgFIZQ7aBDryq/cFZDErE5Feg7j3eRzHkAuUHFY=";
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
        rev = "c05843a9f622db08ad59804c190f98879b76beba";
        hash = "sha256-h/e2vJacUp7PITez9HPzGc5+ofz7Oplso44VibECmsI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "google_benchmark_vendor";
  version = "0.1.2-1";
  src = sources.google_benchmark_vendor;
  nativeBuildInputs = [ cmake git ];
  propagatedNativeBuildInputs = [ gbenchmark ];
  buildInputs = [ cmake git ];
  propagatedBuildInputs = [ gbenchmark ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
