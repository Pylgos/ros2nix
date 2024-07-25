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
        rev = "ddc66e4bb0a4cbac3cb8ca9ab9f582d926f7c010";
        hash = "sha256-WIXozbzHKKM/cuaQ/TCIvi3ErLMNIqkBRHSECO1zhSE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_battery";
  version = "0.4.0-1";
  src = sources.rmf_battery;
  nativeBuildInputs = [ cmake eigen3_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rmf_traffic rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}