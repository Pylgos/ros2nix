{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  orocos_kdl_vendor,
  python3Packages,
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
        rev = "6d7eafcae41f6f3e6975e1c78c08588185bed9b8";
        hash = "sha256-kbcPedelkBYDIgTb28cG82KqD2KLKk6cUqHwUdAQRjc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_geometry_msgs";
  version = "0.38.0-1";
  src = sources.tf2_geometry_msgs;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs orocos_kdl_vendor python3Packages.numpy tf2 tf2_ros tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
