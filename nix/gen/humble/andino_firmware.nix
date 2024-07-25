{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    andino_firmware = substituteSource {
      src = fetchgit {
        name = "andino_firmware-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "c140e6cddbf59965e00330f54a97424f50c39eca";
        hash = "sha256-EKlLMXLrPV+UZ3xMgRXfYxSPOEsXxVfu9FYZIWUpXto=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "andino_firmware";
  version = "0.1.0-1";
  src = sources.andino_firmware;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
