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
  rmw,
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
        rev = "2dbe9e12889ee3f3d83233b1dd1829321a29e2fa";
        hash = "sha256-nvyVNRHT7s9A3yWb+qofNvhzVxvexv5oitQKX0U/W90=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libstatistics_collector";
  version = "1.8.0-1";
  src = sources.libstatistics_collector;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rcl rcpputils rmw statistics_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
