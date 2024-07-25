{
  ament_acceleration,
  ament_cmake_core,
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_vitis = substituteSource {
      src = fetchgit {
        name = "ament_vitis-source";
        url = "https://github.com/ros2-gbp/ament_vitis-release.git";
        rev = "a88396485b1f429bf3cd62c997e4bdd3e825ae25";
        hash = "sha256-Na2vZDmx1yo4NFMDS9mmn1De1NRtjjs953gSAHRCxtc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_vitis";
  version = "0.10.1-4";
  src = sources.ament_vitis;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_acceleration ament_cmake_core ament_cmake_ros ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_acceleration ament_cmake_core ament_cmake_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
