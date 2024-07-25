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
        rev = "624a45829f28e58458ad3d5e5d11edef4b0fcbb8";
        hash = "sha256-w86vqlc7t/EJJOh8aI+DT1ECcEMdvidOeDtsyDhjTXc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_image_overlay_layer";
  version = "0.3.1-3";
  src = sources.rqt_image_overlay_layer;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters pluginlib qt5.qtbase rclcpp rcpputils rosidl_runtime_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
