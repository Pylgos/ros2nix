{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_flake8,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_flake8 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_flake8-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "16ec4e5b6d56dd623bafa92c0df07fd8418d3f0b";
        hash = "sha256-odoN7OCZrSadMda9DOrcmfIE5TAGLOKG23aTs4naN00=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_flake8";
  version = "0.12.11-1";
  src = sources.ament_cmake_flake8;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_flake8 ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test ament_flake8 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
