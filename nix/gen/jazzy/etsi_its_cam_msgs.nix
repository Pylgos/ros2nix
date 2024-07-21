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
    etsi_its_cam_msgs = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "5efbe0797b0e493279caa27bed2458319f70530a";
        hash = "sha256-0rqmElxLU0ZXNqZjizWBw254fX9WJZu3CBUGdH5DldE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_cam_msgs";
  version = "2.0.2-1";
  src = sources.etsi_its_cam_msgs;
  nativeBuildInputs = [ rosidl_default_generators ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
