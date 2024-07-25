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
        rev = "af688c13cfe91b60aec18715f2607be1192ae499";
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
