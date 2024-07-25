{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_auto = substituteSource {
      src = fetchgit {
        name = "ament_cmake_auto-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "37544a7f984e94ec6ad6891eb428ad53c351f912";
        hash = "sha256-vvhHHW4JVAKjJfIdy/ZhQCQzbKMT05qA9ibZis4rusk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_auto";
  version = "1.3.9-1";
  src = sources.ament_cmake_auto;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
