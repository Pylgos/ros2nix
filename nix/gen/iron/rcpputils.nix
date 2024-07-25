{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_ros,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcutils,
  substituteSource,
}:
let
  sources = rec {
    rcpputils = substituteSource {
      src = fetchgit {
        name = "rcpputils-source";
        url = "https://github.com/ros2-gbp/rcpputils-release.git";
        rev = "ba830ec6a9e83f1d77bf4bb4c51ca6cc656fc9ce";
        hash = "sha256-XPvv0cbGGiWNbFWGYGw8minepMif3Ls5ELMW7Si6dIk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcpputils";
  version = "2.6.3-1";
  src = sources.rcpputils;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
