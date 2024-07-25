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
        rev = "3d5a811e2ee0b6a9f16d484c4540cbc845b66360";
        hash = "sha256-AN/eyLroQDeZjI/JosPYI5tZHhbJn0jP1d8D3wjuN54=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcss3d_agent_msgs";
  version = "0.4.1-3";
  src = sources.rcss3d_agent_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
