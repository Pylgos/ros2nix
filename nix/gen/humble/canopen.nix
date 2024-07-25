{
  ament_cmake,
  buildRosPackage,
  canopen_402_driver,
  canopen_base_driver,
  canopen_core,
  canopen_interfaces,
  canopen_proxy_driver,
  fetchgit,
  fetchurl,
  fetchzip,
  lely_core_libraries,
  substituteSource,
}:
let
  sources = rec {
    canopen = substituteSource {
      src = fetchgit {
        name = "canopen-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "8cdfb48b9ecdddd383aa44f9cefe37fe01fc188b";
        hash = "sha256-wC+k/wfrP7r8ceAzljUlFWZ1k8LVp2FYimd8zkr7LfQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen";
  version = "0.2.11-2";
  src = sources.canopen;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_402_driver canopen_base_driver canopen_core canopen_interfaces canopen_proxy_driver lely_core_libraries ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
