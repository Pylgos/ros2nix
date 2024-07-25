{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  pluginlib,
  substituteSource,
}:
let
  sources = rec {
    transmission_interface = substituteSource {
      src = fetchgit {
        name = "transmission_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "ec3aa6b97a2e736da3118f063b3ee0f9a1c4ab19";
        hash = "sha256-ZzJUDPFoZRNEBriNWKV/P6OXFTc5qB98XWu3oa+6p/M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "transmission_interface";
  version = "2.41.0-1";
  src = sources.transmission_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ hardware_interface pluginlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
