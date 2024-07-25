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
        rev = "9451fde79e00eefd6195eb564301d421780d6592";
        hash = "sha256-aD36j4A/ZXgWvPj1zYIImfeYkx6gVOWpgU06H8yceno=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zbar_ros";
  version = "0.5.1-1";
  src = sources.zbar_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge rclcpp sensor_msgs std_msgs zbar ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
