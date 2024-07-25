{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  spdlog,
  substituteSource,
}:
let
  sources = rec {
    spdlog_vendor = substituteSource {
      src = fetchgit {
        name = "spdlog_vendor-source";
        url = "https://github.com/ros2-gbp/spdlog_vendor-release.git";
        rev = "43818fb2f0ba4af12876cc909d548dc3dfb7d01c";
        hash = "sha256-9OjlnEOVpDKHMl/hyC8ZNdcnIFsbSxbkf+URjeyVWZA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/gabime/spdlog/archive/v1.8.2.tar.gz";
          to = "URL ${spdlog_vendor-vendor_source-v1-0}";
        }
      ];
    };
    spdlog_vendor-vendor_source-v1-0 = substituteSource {
      src = fetchzip {
        name = "spdlog_vendor-vendor_source-v1-0-source";
        url = "https://github.com/gabime/spdlog/archive/v1.8.2.tar.gz";
        hash = "sha256-vYled5Z9fmxuO9193lefpFzIHAiSgvYn2iOfneLidQ8=";
      };
      substitutions = [
        {
          path = "bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${spdlog_vendor-vendor_source-v1-0-vendor_source-benchmark-0}";
        }
      ];
    };
    spdlog_vendor-vendor_source-v1-0-vendor_source-benchmark-0 = substituteSource {
      src = fetchgit {
        name = "spdlog_vendor-vendor_source-v1-0-vendor_source-benchmark-0-source";
        url = "https://github.com/google/benchmark.git";
        rev = "73d4d5e8d6d449fc8663765a42aa8aeeee844489";
        hash = "sha256-6gKLIKPnY7eXWGQcaWyPbLs3E6Q9VyqVoWoZ/u9TPY8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "spdlog_vendor";
  version = "1.3.1-1";
  src = sources.spdlog_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ spdlog ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
