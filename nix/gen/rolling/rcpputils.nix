{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_gen_version_h,
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
        rev = "704230a4cea3c0638596593bd18b3d4ed6221f17";
        hash = "sha256-PS8A4utEDv3r3jMiBRpVCLUATa4gpziVABiX/Ds1OZA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcpputils";
  version = "2.12.0-1";
  src = sources.rcpputils;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
