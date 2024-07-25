{
  ament_cmake_core,
  ament_cmake_gtest,
  ament_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_gen_version_h = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gen_version_h-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "900ab14e1bc8345d5cb5a0f86bd97d398474ef33";
        hash = "sha256-p0g8mEhAeJo5BcChj0prz1svSvV8X5L7ElgwVHgm678=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_gen_version_h";
  version = "1.3.9-1";
  src = sources.ament_cmake_gen_version_h;
  nativeBuildInputs = [ ament_package ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [ ament_package ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
