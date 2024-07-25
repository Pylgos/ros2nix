{
  ament_cmake,
  bison,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flex,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    popf = substituteSource {
      src = fetchgit {
        name = "popf-source";
        url = "https://github.com/fmrico/popf-release.git";
        rev = "17394a4bbdbb21f29f7bfe2ac5d51939fb00ec5e";
        hash = "sha256-5QAvnX2e+4KCF60pKDJZXU0toOzZd/35wJT/y9rLPCg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "popf";
  version = "0.0.14-1";
  src = sources.popf;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bison flex rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
