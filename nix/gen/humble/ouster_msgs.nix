{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ouster_msgs = substituteSource {
      src = fetchgit {
        name = "ouster_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_ouster_drivers-release.git";
        rev = "b4867f80a0733b47665af4b5f0d84b5e0102c6a0";
        hash = "sha256-0JRMNiCpLrnFxurjJk0W54ur3aggszagwWsUAvz7Imw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ouster_msgs";
  version = "0.4.2-1";
  src = sources.ouster_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
