{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav_msgs,
  rclcpp,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    odom_to_tf_ros2 = substituteSource {
      src = fetchgit {
        name = "odom_to_tf_ros2-source";
        url = "https://github.com/ros2-gbp/odom_to_tf_ros2-release.git";
        rev = "61524ac2397dc4c90ab8809ada04e69fbb1824e2";
        hash = "sha256-0/u/YYeXujwGxRaQtoi8WfVuy0NFu558FY9r5etmJkY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "odom_to_tf_ros2";
  version = "1.0.2-1";
  src = sources.odom_to_tf_ros2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav_msgs rclcpp tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
