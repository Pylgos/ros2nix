{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_yaml = substituteSource {
      src = fetchgit {
        name = "mola_yaml-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "db02f3b6262f1b27d82ad5eba487f3c8a334f920";
        hash = "sha256-8cfBNObwcLp+gG8Vd2pi7dy5xHk7Ke578Qp9ZMUEFsY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_yaml";
  version = "1.0.6-1";
  src = sources.mola_yaml;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
