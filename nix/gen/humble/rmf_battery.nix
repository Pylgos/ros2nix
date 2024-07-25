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
        rev = "dc76e2d05cdf63b395e174b7a54d07b00750b934";
        hash = "sha256-7KUSu6yQUDFeZGyZk56EW0DdiuWcT8cCYloZTsdYG7U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_battery";
  version = "0.1.5-1";
  src = sources.rmf_battery;
  nativeBuildInputs = [ cmake eigen3_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rmf_traffic rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
