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
        rev = "bfaf981363e7ae511071b87298ad434fc36593a8";
        hash = "sha256-kbxKCPctIeCQIpH7MYSFhHGR93vWUupeV+uPuMPiZAY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ouster_msgs";
  version = "0.5.1-5";
  src = sources.ouster_msgs;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
