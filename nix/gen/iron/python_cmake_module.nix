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
        rev = "cc41c76b9c00e2d3658c334557597219359c86ea";
        hash = "sha256-ngERoOumFYnMVRNsgR4CwUKfWAG9z0UrJJcOWOXWGcA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "python_cmake_module";
  version = "0.10.2-3";
  src = sources.python_cmake_module;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ python3 ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ python3 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
