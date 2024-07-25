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
        rev = "613369f17137b78c0359f3f8abe416a1a40235d6";
        hash = "sha256-fVs4QeDZbOgp/HUZ1TWvLFsFky6DTAoGb0Av0NPqbKI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_vendor_package";
  version = "2.0.5-1";
  src = sources.ament_cmake_vendor_package;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies vcstool ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies vcstool ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
