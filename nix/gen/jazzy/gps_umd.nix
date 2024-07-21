{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gps_msgs,
  gps_tools,
  gpsd_client,
  substituteSource,
}:
let
  sources = rec {
    gps_umd = substituteSource {
      src = fetchgit {
        name = "gps_umd-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "ff0f9cdec7713df9990a4d9ed38373f80998f00e";
        hash = "sha256-vIL98+Jzy8M+CuClxVCxEEDOOgpD+n26au28onECvQ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gps_umd";
  version = "2.0.3-2";
  src = sources.gps_umd;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gps_msgs gps_tools gpsd_client ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
