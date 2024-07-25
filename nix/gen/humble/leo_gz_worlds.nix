{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    leo_gz_worlds = substituteSource {
      src = fetchgit {
        name = "leo_gz_worlds-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "a7be42a97ca545af9fcd2040157035c63d6f8bfe";
        hash = "sha256-/seAJUvazKQtbck87r0idIJflGy2g3a70ILGSxwzZfA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_gz_worlds";
  version = "1.1.0-1";
  src = sources.leo_gz_worlds;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
