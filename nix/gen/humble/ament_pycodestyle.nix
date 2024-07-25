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
    ament_pycodestyle = substituteSource {
      src = fetchgit {
        name = "ament_pycodestyle-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "d8dd4f6482b85acfe9d8e1b88512f53acc74571d";
        hash = "sha256-0muFIvDYVlWSnfRjSD/s/zhqJO7gx2TqBCpd+u7jpTA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pycodestyle";
  version = "0.12.11-1";
  src = sources.ament_pycodestyle;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pycodestyle ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pycodestyle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
