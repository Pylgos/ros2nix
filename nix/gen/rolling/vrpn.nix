{
  ament_cmake,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    vrpn = substituteSource {
      src = fetchgit {
        name = "vrpn-source";
        url = "https://github.com/ros2-gbp/vrpn-release.git";
        rev = "358301cb68d6b50ecb00e64c22c69a6021ba0900";
        hash = "sha256-2oOc4KpLGkfRc8tNDvM7xxjiHahtaoa5tGYhQEA7ViA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vrpn";
  version = "7.35.0-20";
  src = sources.vrpn;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}