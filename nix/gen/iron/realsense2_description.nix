{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
  rclcpp,
  rclcpp_components,
  realsense2_camera_msgs,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    realsense2_description = substituteSource {
      src = fetchgit {
        name = "realsense2_description-source";
        url = "https://github.com/IntelRealSense/realsense-ros-release.git";
        rev = "8ed2ccb2c901f55ab016de00c8e6147c326edb58";
        hash = "sha256-Er8wmje8+L8O8X37B/c7pa22cwsjuK21LnWLzY2bo0c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "realsense2_description";
  version = "4.55.1-1";
  src = sources.realsense2_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros rclcpp rclcpp_components realsense2_camera_msgs xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
