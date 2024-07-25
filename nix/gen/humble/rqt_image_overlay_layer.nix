{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  pluginlib,
  qt5,
  rclcpp,
  rcpputils,
  rosidl_runtime_cpp,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_image_overlay_layer = substituteSource {
      src = fetchgit {
        name = "rqt_image_overlay_layer-source";
        url = "https://github.com/ros2-gbp/rqt_image_overlay-release.git";
        rev = "bf3df52eb546b45d2de5a96a0839ab413df5065a";
        hash = "sha256-qBXKAQurQgQhoyzn8PRbIOjiZJ2TiEYEaqPtQO+o7H8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_image_overlay_layer";
  version = "0.1.3-1";
  src = sources.rqt_image_overlay_layer;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters pluginlib qt5.qtbase rclcpp rcpputils rosidl_runtime_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
