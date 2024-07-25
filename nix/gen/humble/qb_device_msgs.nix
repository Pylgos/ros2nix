{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    qb_device_msgs = substituteSource {
      src = fetchgit {
        name = "qb_device_msgs-source";
        url = "https://bitbucket.org/qbrobotics/qbdevice-ros2-release.git";
        rev = "1b8deddab54cadf0fc1db339728337a626ebcb33";
        hash = "sha256-1u6q1Q3om7xdWhEQMztTZHFaeepcFvRdfmA8pV5IErM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qb_device_msgs";
  version = "4.1.3-1";
  src = sources.qb_device_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
