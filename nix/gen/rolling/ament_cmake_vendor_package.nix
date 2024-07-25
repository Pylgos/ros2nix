{
  ament_cmake_core,
  ament_cmake_export_dependencies,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  vcstool,
}:
let
  sources = rec {
    ament_cmake_vendor_package = substituteSource {
      src = fetchgit {
        name = "ament_cmake_vendor_package-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "8a65d8812e213b00f90cfcf92c2d062b328f8b37";
        hash = "sha256-daoMQP7Ondq4QX+qm1GZURdroE1bTid2yWeQweFcEoI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_vendor_package";
  version = "2.7.0-1";
  src = sources.ament_cmake_vendor_package;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies vcstool ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies vcstool ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}