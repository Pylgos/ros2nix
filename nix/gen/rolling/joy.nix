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
        rev = "f445427e97a65ec06798dcbe1652890fa056c1fa";
        hash = "sha256-D1K9/q5C0I7lztfZMomXMVDmBUV0UKvl2iNljHx2pPY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joy";
  version = "3.3.0-2";
  src = sources.joy;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components sdl2_vendor sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}