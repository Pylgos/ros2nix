{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  cmake,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_traffic,
  rmf_utils,
  substituteSource,
}:
let
  sources = rec {
    rmf_battery = substituteSource {
      src = fetchgit {
        name = "rmf_battery-source";
        url = "https://github.com/ros2-gbp/rmf_battery-release.git";
        rev = "a3a991708911c06b4ca9f12b3057859348d59775";
        hash = "sha256-yJFWcPNlFPZiOBt8Nw7S8iiIYCLgYQrSqjRLIT8b7yI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_battery";
  version = "0.2.1-1";
  src = sources.rmf_battery;
  nativeBuildInputs = [ cmake eigen3_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rmf_traffic rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
