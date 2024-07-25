{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    marti_perception_msgs = substituteSource {
      src = fetchgit {
        name = "marti_perception_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "8ab7ccb194071da828d40671dd67f07931bc3ca8";
        hash = "sha256-2qxhSta0F3EVZvP65ORIvmv7wvdpFJtBiATwG+jFkXE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_perception_msgs";
  version = "1.5.2-2";
  src = sources.marti_perception_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
