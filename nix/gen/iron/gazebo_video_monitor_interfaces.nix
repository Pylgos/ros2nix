{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    gazebo_video_monitor_interfaces = substituteSource {
      src = fetchgit {
        name = "gazebo_video_monitor_interfaces-source";
        url = "https://github.com/ros2-gbp/gazebo_video_monitors-release.git";
        rev = "7ebb1b18cf13a050e216d0aa0900839a3f806897";
        hash = "sha256-bAH0auqkiKTCzphiaUV8FZaZ1shqr0qEHf81IBt+SQs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_video_monitor_interfaces";
  version = "0.8.1-1";
  src = sources.gazebo_video_monitor_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
