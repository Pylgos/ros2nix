{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_uncrustify,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rmf_cmake_uncrustify = substituteSource {
      src = fetchgit {
        name = "rmf_cmake_uncrustify-source";
        url = "https://github.com/ros2-gbp/rmf_cmake_uncrustify-release.git";
        rev = "66787d123188380569a9ad1d29680caad59e36ac";
        hash = "sha256-YwXGjK9Uaj03Os5oVwylNtS6dDmirgOgm6bY+0K+8Ic=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_cmake_uncrustify";
  version = "1.2.0-5";
  src = sources.rmf_cmake_uncrustify;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_uncrustify ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
