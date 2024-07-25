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
        rev = "f8a54eb5b6ddb3bdb5c0ed2b6c2f03d3fb69bea1";
        hash = "sha256-1hDq17lBXOgJFS0NzvWe66N9KvhthMEk2EBeinJ8iQA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pycodestyle";
  version = "0.14.3-1";
  src = sources.ament_pycodestyle;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pycodestyle ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pycodestyle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
