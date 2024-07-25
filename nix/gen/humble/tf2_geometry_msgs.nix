{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  orocos_kdl_vendor,
  python_cmake_module,
  rclcpp,
  substituteSource,
  tf2,
  tf2_ros,
  tf2_ros_py,
}:
let
  sources = rec {
    tf2_geometry_msgs = substituteSource {
      src = fetchgit {
        name = "tf2_geometry_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "770726317bc6af68e9b1398e3871384c026a3d90";
        hash = "sha256-2bL96zIcCQNMC2ay9fagmVP7xsgsxF/GRJVq6Doumf8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_geometry_msgs";
  version = "0.25.7-1";
  src = sources.tf2_geometry_msgs;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs orocos_kdl_vendor tf2 tf2_ros tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
