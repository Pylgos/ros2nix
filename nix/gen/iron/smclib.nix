{
  ament_cmake,
  ament_cmake_python,
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
    smclib = substituteSource {
      src = fetchgit {
        name = "smclib-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "e1946ea2e7bbd8f5dff4c1b0945ee2e4e1bd93bb";
        hash = "sha256-F73Murx7nsDKLtgPHJ5EAjpH67fZ7LZMHDas6Up4fk0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smclib";
  version = "4.0.0-4";
  src = sources.smclib;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
