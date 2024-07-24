{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tinyxml-2,
}:
let
  sources = rec {
    tinyxml2_vendor = substituteSource {
      src = fetchgit {
        name = "tinyxml2_vendor-source";
        url = "https://github.com/ros2-gbp/tinyxml2_vendor-release.git";
        rev = "155ed531ad0a75b6f9e1d1ee39cd80fb47e9e341";
        hash = "sha256-ptCYnrl38I2LTVvOgSO8OXjxfgGAen17kQSYDOgZZRQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tinyxml2_vendor";
  version = "0.9.1-3";
  src = sources.tinyxml2_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
