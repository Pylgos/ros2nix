{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  bond,
  bondcpp,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  pkg-config,
  rclcpp,
  rclcpp_lifecycle,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
  util-linux,
}:
let
  sources = rec {
    test_bond = substituteSource {
      src = fetchgit {
        name = "test_bond-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "3598cacf3e3a934d4ec733fc361189072ea5fd30";
        hash = "sha256-fHi349x6QDk41rEy2eRf220CkcMmPbS/gLmad/CmxGQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_bond";
  version = "4.0.0-4";
  src = sources.test_bond;
  nativeBuildInputs = [ rosidl_default_generators ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rclcpp_lifecycle rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
