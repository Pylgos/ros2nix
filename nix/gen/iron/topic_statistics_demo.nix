{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rcutils,
  sensor_msgs,
  statistics_msgs,
  substituteSource,
}:
let
  sources = rec {
    topic_statistics_demo = substituteSource {
      src = fetchgit {
        name = "topic_statistics_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "b96d64ecfae6ac11b6d7fe93f892cddd3a202f91";
        hash = "sha256-YPVHwpTJiqwsKJ3qP0N9btdP/aOC2HKRJRQ5hjWUry8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_statistics_demo";
  version = "0.27.1-1";
  src = sources.topic_statistics_demo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rcutils sensor_msgs statistics_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
