{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_include_directories = substituteSource {
      src = fetchgit {
        name = "ament_cmake_include_directories-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "7f8c58147095934a57628256ec16d417c6c257d1";
        hash = "sha256-UVmNK28VnJXKUTVAGrgTo7ZL5dKhtz2bAypv+L0F7+w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_include_directories";
  version = "1.3.9-1";
  src = sources.ament_cmake_include_directories;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
