{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  python3Packages,
  rclcpp,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    unitree_ros = substituteSource {
      src = fetchgit {
        name = "unitree_ros-source";
        url = "https://github.com/ros2-gbp/unitree_ros-release.git";
        rev = "b6796d29151373eb7c5b2d75376569e7adee5fd2";
        hash = "sha256-8Rfp2FeF+/MKJy4zX2MXdo8++BRbCcPZA3Cmhb+60GE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "unitree_ros";
  version = "1.1.1-1";
  src = sources.unitree_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav_msgs python3Packages.boost rclcpp rosidl_default_runtime sensor_msgs std_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
