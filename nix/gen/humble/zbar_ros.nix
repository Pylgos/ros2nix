{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
  zbar,
}:
let
  sources = rec {
    zbar_ros = substituteSource {
      src = fetchgit {
        name = "zbar_ros-source";
        url = "https://github.com/ros2-gbp/zbar_ros-release.git";
        rev = "0e5167430076ab02dd652acc89a2a476e2793a27";
        hash = "sha256-BeWiZdJMxky3DsMi8Bd9EVHFxD69/Ay8Q80jjKnccJ4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zbar_ros";
  version = "0.4.1-1";
  src = sources.zbar_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge rclcpp sensor_msgs std_msgs zbar ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
