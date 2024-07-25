{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  crane_plus_control,
  crane_plus_description,
  crane_plus_moveit_config,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_geometry,
  moveit_ros_planning_interface,
  opencv,
  rclcpp,
  substituteSource,
  tf2_geometry_msgs,
  usb_cam,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    crane_plus_examples = substituteSource {
      src = fetchgit {
        name = "crane_plus_examples-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "48a0fbcbb12a3db610c7dc1179adfc296a5b23b8";
        hash = "sha256-ZYQprt6t7q4XDQ+BeBX2VL36hprZ9Vhqz9UAPRQ8L+E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "crane_plus_examples";
  version = "2.0.1-1";
  src = sources.crane_plus_examples;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ crane_plus_control crane_plus_description crane_plus_moveit_config cv_bridge geometry_msgs image_geometry moveit_ros_planning_interface opencv rclcpp tf2_geometry_msgs usb_cam ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
