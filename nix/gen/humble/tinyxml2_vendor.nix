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
        rev = "86316a0d57e4f3bc7041841d79b5f53c54812a7f";
        hash = "sha256-Hzwv+ogjpwgDD1mQPZrlBxPwYd/cPeuf/oD4LC6w1UE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tinyxml2_vendor";
  version = "0.7.6-1";
  src = sources.tinyxml2_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
