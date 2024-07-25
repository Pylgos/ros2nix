{
  ament_cmake,
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    wiimote_msgs = substituteSource {
      src = fetchgit {
        name = "wiimote_msgs-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "ac1afec39da76d6b7369b975f33e4d449e53284b";
        hash = "sha256-CTizMiNOKAwVd/bOq8yB5s7j00cvCsHVQotPLLXwrhI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "wiimote_msgs";
  version = "3.3.0-1";
  src = sources.wiimote_msgs;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
