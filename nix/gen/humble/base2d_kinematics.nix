{
  ament_cmake,
  base2d_kinematics_msgs,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_2d_msgs,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    base2d_kinematics = substituteSource {
      src = fetchgit {
        name = "base2d_kinematics-source";
        url = "https://github.com/ros2-gbp/metro_nav-release.git";
        rev = "596fe0db3224aae00523fd21607a9ea171f5a6b7";
        hash = "sha256-jKh8CzkLaGmIvEw+kJLHz+DYk65IGUtVDLz0/JNi+/E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "base2d_kinematics";
  version = "0.2.0-1";
  src = sources.base2d_kinematics;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ base2d_kinematics_msgs geometry_msgs nav_2d_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
