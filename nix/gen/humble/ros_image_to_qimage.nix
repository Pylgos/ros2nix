{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  qt5,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ros_image_to_qimage = substituteSource {
      src = fetchgit {
        name = "ros_image_to_qimage-source";
        url = "https://github.com/ros2-gbp/ros_image_to_qimage-release.git";
        rev = "6a7a548a3c8984141e6d9714f69be44ece6e484f";
        hash = "sha256-iMqDiWxhiE4eCCykP4aNhTgnJKweSAasczj8BSo2yK8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_image_to_qimage";
  version = "0.2.1-1";
  src = sources.ros_image_to_qimage;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge qt5.qtbase sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
