{
  ament_cmake,
  ament_cmake_vendor_package,
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
    ecal-vendor_source-benchmark-0 = substituteSource {
      src = fetchgit {
        name = "ecal-vendor_source-benchmark-0-source";
        url = "https://github.com/google/benchmark.git";
        rev = "f91b6b42b1b9854772a90ae9501464a161707d1e";
        hash = "sha256-EAJk3JhLdkuGKRMtspTLejck8doWPd7Z0Lv/Mvf3KFY=";
      };
      substitutions = [
      ];
    };
    spdlog_vendor = substituteSource {
      src = fetchgit {
        name = "spdlog_vendor-source";
        url = "https://github.com/ros2-gbp/spdlog_vendor-release.git";
        rev = "f9ebbb06b3af20a3e9f5cb13a1ae2e26d42e3f32";
        hash = "sha256-9k7bQmIpVHxO4/n3KwozH4kfqV9XLMn8Az+TXCSy4as=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gabime/spdlog.git";
          to = "VCS_TYPE path VCS_URL ${spdlog_vendor-vendor_source-spdlog-0}";
        }
      ];
    };
    spdlog_vendor-vendor_source-spdlog-0 = substituteSource {
      src = fetchgit {
        name = "spdlog_vendor-vendor_source-spdlog-0-source";
        url = "https://github.com/gabime/spdlog.git";
        rev = "7e635fca68d014934b4af8a1cf874f63989352b7";
        hash = "sha256-cxTaOuLXHRU8xMz9gluYz0a93O0ez2xOxbloyc1m1ns=";
      };
      substitutions = [
        {
          path = "bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${ecal-vendor_source-benchmark-0}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "spdlog_vendor";
  version = "1.7.0-1";
  src = sources.spdlog_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ spdlog ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}