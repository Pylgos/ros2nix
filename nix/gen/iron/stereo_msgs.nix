{
  ament_cmake,
  ament_lint_common,
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
    stereo_msgs = substituteSource {
      src = fetchgit {
        name = "stereo_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "597722fb98379225263db3f9bf0cccf6624ec47c";
        hash = "sha256-Rn+D4ePkpjHCa1Naw3+SrE9MtqOx7duKQGSe1so66hs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "stereo_msgs";
  version = "5.0.1-1";
  src = sources.stereo_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
