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
    ament_package = substituteSource {
      src = fetchgit {
        name = "ament_package-source";
        url = "https://github.com/ros2-gbp/ament_package-release.git";
        rev = "4767944c7c58a6e8759d54463d449a1ad9e65b8c";
        hash = "sha256-bVqADL9ok7fry+Hjrzu88jZPbHrTp1fNeUwkD7LDi98=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_package";
  version = "0.15.3-2";
  src = sources.ament_package;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.importlib-metadata buildPackages.python3Packages.importlib-resources buildPackages.python3Packages.setuptools ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.importlib-metadata python3Packages.importlib-resources python3Packages.setuptools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
