{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    ur_dashboard_msgs = substituteSource {
      src = fetchgit {
        name = "ur_dashboard_msgs-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "7ffd1cdba288f923fc0c8c03f25b53cfa5d1bc0b";
        hash = "sha256-t+FZXWBjKtu/3LsftkbY/QZf9iH0m+TlXtziMp6Vziw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_dashboard_msgs";
  version = "2.2.14-1";
  src = sources.ur_dashboard_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
