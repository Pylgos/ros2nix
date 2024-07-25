{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_ros,
  message_filters,
  rclcpp,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  turtlesim,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtle_tf2_cpp = substituteSource {
      src = fetchgit {
        name = "turtle_tf2_cpp-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "c18ff88b9b385ee005312a4ce362f077c8c2b234";
        hash = "sha256-/+vZZp6tpMuKd5xAZHma9sMN5Q0aWVwbu5ZnKW6t2nQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtle_tf2_cpp";
  version = "0.3.6-4";
  src = sources.turtle_tf2_cpp;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs launch_ros message_filters rclcpp tf2 tf2_geometry_msgs tf2_ros turtlesim ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
