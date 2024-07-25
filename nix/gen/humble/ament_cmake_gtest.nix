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
        rev = "16d0566d6958dd412620178d11dbbe04a4bd08bb";
        hash = "sha256-qd60xcoVN9ziTjq1Kbh4mxXpqmKOdpZvqjGrWvBm0ZM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_gtest";
  version = "1.3.9-1";
  src = sources.ament_cmake_gtest;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test gtest gtest_vendor ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test gtest gtest_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
