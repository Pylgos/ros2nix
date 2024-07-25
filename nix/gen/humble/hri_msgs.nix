{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    hri_msgs = substituteSource {
      src = fetchgit {
        name = "hri_msgs-source";
        url = "https://github.com/ros4hri/hri_msgs-release.git";
        rev = "8d829481606340bce386a48f7e1a065c9105332e";
        hash = "sha256-Rheq1DzpYp8rneuPcc+dWLLwA24vlLVWIzZNspSeK5U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hri_msgs";
  version = "2.0.0-1";
  src = sources.hri_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
