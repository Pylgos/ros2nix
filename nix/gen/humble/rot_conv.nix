{
  ament_cmake,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rot_conv = substituteSource {
      src = fetchgit {
        name = "rot_conv-source";
        url = "https://github.com/ros2-gbp/rot_conv_lib-release.git";
        rev = "e793af8fd25bf694648d7b8e11490252c3b848ff";
        hash = "sha256-6/6mfqRarCEYQCMc18m5vFDCS0UjiBqGWsoHUEB7LiU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rot_conv";
  version = "1.0.11-2";
  src = sources.rot_conv;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
