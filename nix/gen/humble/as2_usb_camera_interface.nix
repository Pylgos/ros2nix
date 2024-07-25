{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  as2_core,
  as2_msgs,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    as2_usb_camera_interface = substituteSource {
      src = fetchgit {
        name = "as2_usb_camera_interface-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "9f6ac2c312e44f1a352d1d1dca3c3068997b2106";
        hash = "sha256-K9M+vYzMPgETn5K1/L8iBbJm+bwVveQDtUwTgqj2/Xs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_usb_camera_interface";
  version = "1.0.9-1";
  src = sources.as2_usb_camera_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_core as2_msgs cv_bridge rclcpp sensor_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
