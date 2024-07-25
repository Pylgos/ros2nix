{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    pal_navigation_cfg_params = substituteSource {
      src = fetchgit {
        name = "pal_navigation_cfg_params-source";
        url = "https://github.com/pal-gbp/pal_navigation_cfg_public-release.git";
        rev = "5cc4118e1f1c5493d7e9083d715f3cbf967a7b8f";
        hash = "sha256-rf4mzxiz6tOTAeDFUng1RkBMmQ9ieKPw17pvNaQPFJg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_navigation_cfg_params";
  version = "3.0.6-1";
  src = sources.pal_navigation_cfg_params;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
