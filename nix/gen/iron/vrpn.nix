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
        rev = "4a73a927907795634202ab9326a2cf9426b07cfc";
        hash = "sha256-gVABNgsOIA99lKIlrcjjsnCvXMYzmJtNB/5AH1Im0Wc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vrpn";
  version = "7.35.0-14";
  src = sources.vrpn;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
