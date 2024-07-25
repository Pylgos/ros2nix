{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3,
  substituteSource,
}:
let
  sources = rec {
    python_cmake_module = substituteSource {
      src = fetchgit {
        name = "python_cmake_module-source";
        url = "https://github.com/ros2-gbp/python_cmake_module-release.git";
        rev = "afb4c5c6c5f78ced88a5f5802caf5707025b6b33";
        hash = "sha256-q4W1DWKOd7QWWbr0OQrkiC+TBZptN74ufvEGNY/qtN8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "python_cmake_module";
  version = "0.10.0-2";
  src = sources.python_cmake_module;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ python3 ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ python3 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
