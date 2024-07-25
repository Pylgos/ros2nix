{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  can_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lusb,
  rclcpp,
  rclcpp_components,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    dataspeed_can_usb = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_usb-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "36018e89b83dbbb42ef53018248288bf6c10f3b4";
        hash = "sha256-ydTwDeP2cNM8nLY8vHK6lkU+AoPQElN7C3xc7yaOoqc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dataspeed_can_usb";
  version = "2.0.1-1";
  src = sources.dataspeed_can_usb;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs lusb rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
