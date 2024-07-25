{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  naoqi_libqi,
  substituteSource,
}:
let
  sources = rec {
    naoqi_libqicore = substituteSource {
      src = fetchgit {
        name = "naoqi_libqicore-source";
        url = "https://github.com/ros-naoqi/libqicore-release.git";
        rev = "d02ebdc1cc2c230664fd0b12e4e7df8346f83a63";
        hash = "sha256-PXfc+J6QV0X+RlP88zErJ3Lr6lL9DorLKb1oYuD/UI8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "naoqi_libqicore";
  version = "3.0.0-1";
  src = sources.naoqi_libqicore;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ naoqi_libqi ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
