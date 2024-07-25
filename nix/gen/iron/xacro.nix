{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_index_python,
  ament_lint_auto,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    xacro = substituteSource {
      src = fetchgit {
        name = "xacro-source";
        url = "https://github.com/ros2-gbp/xacro-release.git";
        rev = "1ee9a7d6dbed46ae7ea243143a1c458ea88d7080";
        hash = "sha256-iAjFc4cKtEu8BNXL+OAowBSksnSlys4dhgbBZ3BguPo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "xacro";
  version = "2.0.9-3";
  src = sources.xacro;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
