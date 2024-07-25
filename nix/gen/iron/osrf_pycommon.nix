{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    osrf_pycommon = substituteSource {
      src = fetchgit {
        name = "osrf_pycommon-source";
        url = "https://github.com/ros2-gbp/osrf_pycommon-release.git";
        rev = "ea9fb49d7065f23ab01afe075e704f9061784521";
        hash = "sha256-jUNyXlvgVcezr3SoQLGFCi+uhhRjNRAwmI6aCNTaX5s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "osrf_pycommon";
  version = "2.1.2-3";
  src = sources.osrf_pycommon;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.importlib-metadata ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.importlib-metadata ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
