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
        rev = "101fdf4e481913d28ee256c7066465d50c9fab45";
        hash = "sha256-RioeZe/GzxM1InGm1RjElfTpDmZxxHp7E7Vc5VI0HKQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_kdl";
  version = "0.25.7-1";
  src = sources.tf2_kdl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs orocos_kdl_vendor tf2 tf2_ros tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
