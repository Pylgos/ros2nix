{
  ament_cmake,
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
    clearpath_customization = substituteSource {
      src = fetchgit {
        name = "clearpath_customization-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "e5f0104c919e2eaaedbdb73f321a751fed6704fa";
        hash = "sha256-kyny+Ejx15GYWmKifnQ7Ae5Bzvb7HKmbfq3V1ZS3Oik=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_customization";
  version = "0.2.9-1";
  src = sources.clearpath_customization;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
