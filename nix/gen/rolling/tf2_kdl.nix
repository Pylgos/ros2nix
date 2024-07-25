{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  orocos_kdl_vendor,
  rclcpp,
  substituteSource,
  tf2,
  tf2_msgs,
  tf2_ros,
  tf2_ros_py,
}:
let
  sources = rec {
    tf2_kdl = substituteSource {
      src = fetchgit {
        name = "tf2_kdl-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "a83bdf2fb35fa9ca93ffeabeea13024c8cf49fc7";
        hash = "sha256-H/9plec+tkNyBJ3oZpYSDtGO1pSKyYDLS/FFCh5FVWo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_kdl";
  version = "0.38.0-1";
  src = sources.tf2_kdl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs orocos_kdl_vendor tf2 tf2_ros tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
