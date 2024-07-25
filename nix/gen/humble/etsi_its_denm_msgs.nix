{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_denm_msgs = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "510e82655252fca3e64bb905c87fdc3ea0c0c06b";
        hash = "sha256-soDc6jIybbGRSr5DigIDNv6qQ6RnoG+FqOa3DytlQ3M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_denm_msgs";
  version = "2.0.2-1";
  src = sources.etsi_its_denm_msgs;
  nativeBuildInputs = [ rosidl_default_generators ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
