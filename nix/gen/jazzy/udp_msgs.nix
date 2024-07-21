{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
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
    udp_msgs = substituteSource {
      src = fetchgit {
        name = "udp_msgs-source";
        url = "https://github.com/ros2-gbp/udp_msgs-release.git";
        rev = "be225e6194a24e9617456332f43415ade552f9eb";
        hash = "sha256-g0Gi+BMs9cMS5t5Fh+epx+fKUhebhUczapOPMz9Bg5A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "udp_msgs";
  version = "0.0.3-7";
  src = sources.udp_msgs;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
