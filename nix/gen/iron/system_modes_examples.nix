{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_system_modes,
  rclcpp,
  rclcpp_lifecycle,
  ros2launch,
  substituteSource,
  system_modes,
  system_modes_msgs,
}:
let
  sources = rec {
    system_modes_examples = substituteSource {
      src = fetchgit {
        name = "system_modes_examples-source";
        url = "https://github.com/ros2-gbp/system_modes-release.git";
        rev = "e73e908de38e5cdf5f31c013b8fb107db71a0698";
        hash = "sha256-0kfAi8ExAnUicuzTFtWKNQwRZP8qipcdbz4XUrg7EQM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "system_modes_examples";
  version = "0.9.0-5";
  src = sources.system_modes_examples;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_system_modes rclcpp rclcpp_lifecycle ros2launch system_modes system_modes_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
