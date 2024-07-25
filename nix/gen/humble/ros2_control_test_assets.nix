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
    ros2_control_test_assets = substituteSource {
      src = fetchgit {
        name = "ros2_control_test_assets-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "e4a55b9e4f334ddb290fecf7e642decf789ea00b";
        hash = "sha256-jXLAnQM7HEvZq6hi/cUcmMQqU7ayLRjQklsTn+h7Q20=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_control_test_assets";
  version = "2.41.0-1";
  src = sources.ros2_control_test_assets;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
