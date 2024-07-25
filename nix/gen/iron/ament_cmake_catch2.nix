{
  ament_cmake_core,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_catch2 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_catch2-source";
        url = "https://github.com/ros2-gbp/ament_cmake_catch2-release.git";
        rev = "e3d9a8e29b825dd2f52222b7cae3b6dc2a07c565";
        hash = "sha256-5AkFuVMqWvsaRpDIOnB3RKhQfL5T7UHZ8Y8ELct7qM4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_catch2";
  version = "1.3.1-1";
  src = sources.ament_cmake_catch2;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
