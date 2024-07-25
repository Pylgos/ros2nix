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
        rev = "ff688a4507797c35a48710be678c06defc5e6629";
        hash = "sha256-gVABNgsOIA99lKIlrcjjsnCvXMYzmJtNB/5AH1Im0Wc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vrpn";
  version = "7.35.0-11";
  src = sources.vrpn;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
