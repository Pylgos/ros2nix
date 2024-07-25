{
  ament_cmake_core,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  gtest_vendor,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_gtest = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gtest-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "697a0522848124f7a53f9d9b008361535f886bc4";
        hash = "sha256-ZWELIbqMzBsf41Q0WtrBuTTVjpZzYtm6gWXylbH0LpE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_gtest";
  version = "2.0.5-1";
  src = sources.ament_cmake_gtest;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test gtest gtest_vendor ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test gtest gtest_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
