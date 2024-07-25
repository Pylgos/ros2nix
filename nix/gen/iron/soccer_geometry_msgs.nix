{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    soccer_geometry_msgs = substituteSource {
      src = fetchgit {
        name = "soccer_geometry_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "03a3dafb38e234c17583472543eecd7900ff9b5a";
        hash = "sha256-irPt/2E0Q4W6KTCsY1PEEq4Qugl/Q875wWxpLgaB+IU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_geometry_msgs";
  version = "0.3.0-1";
  src = sources.soccer_geometry_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
