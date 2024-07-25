{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_acceleration = substituteSource {
      src = fetchgit {
        name = "ament_acceleration-source";
        url = "https://github.com/ros2-gbp/ament_acceleration-release.git";
        rev = "ee33cfa0a853b339566de5f88e6ba9431db983f1";
        hash = "sha256-tnkilfsTlrhC8xcFlu9E8VIt8hGsNKCcdD53KV8JRac=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_acceleration";
  version = "0.2.0-2";
  src = sources.ament_acceleration;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
