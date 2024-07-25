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
        rev = "00da147b17c19bc225408dc693ed8fdc14c314ab";
        hash = "sha256-Ts6Pl7nF9GmL1gZhVdxh41pg24BQX99ilG1Exmsjwas=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_package";
  version = "0.14.0-4";
  src = sources.ament_package;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.importlib-metadata buildPackages.python3Packages.importlib-resources buildPackages.python3Packages.setuptools ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.importlib-metadata python3Packages.importlib-resources python3Packages.setuptools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
