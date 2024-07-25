{
  ament_cmake,
  ament_cmake_copyright,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  openssl,
  pluginlib,
  python3Packages,
  rclcpp,
  std_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    warehouse_ros = substituteSource {
      src = fetchgit {
        name = "warehouse_ros-source";
        url = "https://github.com/ros2-gbp/warehouse_ros-release.git";
        rev = "d4ccdf47f8d8747674ec4befed9c873a834043ce";
        hash = "sha256-89Ku8Zth68EgdS2DXIeyBjbm75ZItsbMZ0ZbKGlw6Fw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "warehouse_ros";
  version = "2.0.4-4";
  src = sources.warehouse_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs openssl pluginlib python3Packages.boost rclcpp std_msgs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
