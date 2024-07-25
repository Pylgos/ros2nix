{
  ament_cmake,
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
        rev = "446aec24d64585acd73968bc1ddc48bdb9d75e6a";
        hash = "sha256-sSwtyIzyLlqUEc3eCuD1NSyo19b7js8NslHAk48ExpQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libstatistics_collector";
  version = "1.3.1-1";
  src = sources.libstatistics_collector;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rcl rcpputils rosidl_default_runtime statistics_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
