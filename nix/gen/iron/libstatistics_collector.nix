{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rcl,
  rcpputils,
  rcutils,
  rosidl_default_generators,
  rosidl_default_runtime,
  statistics_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    libstatistics_collector = substituteSource {
      src = fetchgit {
        name = "libstatistics_collector-source";
        url = "https://github.com/ros2-gbp/libstatistics_collector-release.git";
        rev = "4d8c8c6c27069dccee61221824b30876cbc8eba3";
        hash = "sha256-6rah7eVHUmwkwClYYG81sbaVxe2B/hEVLyGrhYwKTIs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libstatistics_collector";
  version = "1.5.2-1";
  src = sources.libstatistics_collector;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rcl rcpputils statistics_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
