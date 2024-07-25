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
        rev = "d94b28c93f52331e13ceeca52feb5e819c0734be";
        hash = "sha256-WOc5lvdKgJ+lKPHwVJyPnIHme1f0okabmG1xSzSj5NE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_vendor_package";
  version = "1.3.9-1";
  src = sources.ament_cmake_vendor_package;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies vcstool ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies vcstool ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
