{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  sdl2_vendor,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    joy = substituteSource {
      src = fetchgit {
        name = "joy-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "9a46cc53064e80e18c060abef5a7e1a253113315";
        hash = "sha256-D1K9/q5C0I7lztfZMomXMVDmBUV0UKvl2iNljHx2pPY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joy";
  version = "3.3.0-1";
  src = sources.joy;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components sdl2_vendor sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
