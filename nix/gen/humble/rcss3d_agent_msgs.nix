{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rcss3d_agent_msgs = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent_msgs-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "d3069acfd24be5adc40d0389b37288f74d6e369b";
        hash = "sha256-U5/xBh3zM6pnCwpRRYlhiUhE3c2LKGYhLqZfRlRHJMA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcss3d_agent_msgs";
  version = "0.2.2-1";
  src = sources.rcss3d_agent_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
