{
  ament_cmake_core,
  ament_cmake_export_libraries,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_export_interfaces = substituteSource {
      src = fetchgit {
        name = "ament_cmake_export_interfaces-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "e232c00c567210ba8d6cdc9529bd488f835291ca";
        hash = "sha256-mh5d0ynKpeJNMKtE1QjDThZ3grw9Tn2H8QEV7p8T02Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_export_interfaces";
  version = "1.3.9-1";
  src = sources.ament_cmake_export_interfaces;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_libraries ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_libraries ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
