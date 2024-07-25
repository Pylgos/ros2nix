{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rviz_2d_overlay_msgs = substituteSource {
      src = fetchgit {
        name = "rviz_2d_overlay_msgs-source";
        url = "https://github.com/ros2-gbp/rviz_2d_overlay_plugins-release.git";
        rev = "2ad3467943c5b245a890997f4ba9a0ebdc137891";
        hash = "sha256-5D74IzZ2A8JXaF9VzMxWd4WryX6A8MsUtaz+3ZRBFK4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_2d_overlay_msgs";
  version = "1.3.0-1";
  src = sources.rviz_2d_overlay_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
