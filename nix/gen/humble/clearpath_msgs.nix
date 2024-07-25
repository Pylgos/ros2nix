{
  ament_cmake,
  buildRosPackage,
  clearpath_platform_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    clearpath_msgs = substituteSource {
      src = fetchgit {
        name = "clearpath_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "ba1e10d12cc6a259e782b2d08b6b50fc7ab86c75";
        hash = "sha256-zTvVKW68qo7Ait9V0g72Ala3W2cR7KT1xofu8YRHfrU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_msgs";
  version = "0.2.0-1";
  src = sources.clearpath_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clearpath_platform_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
