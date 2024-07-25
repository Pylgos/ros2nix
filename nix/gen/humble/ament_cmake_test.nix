{
  ament_cmake_core,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_test = substituteSource {
      src = fetchgit {
        name = "ament_cmake_test-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "b53a7acc2ec0190aaccf22488a07b139ad4d2983";
        hash = "sha256-5aBCbeAkjP+aCT/Bk1IWOdBSjO0f6zPlPS/hMs0ySYI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_test";
  version = "1.3.9-1";
  src = sources.ament_cmake_test;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [ ament_cmake_python ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
