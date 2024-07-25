{
  ament_cmake,
  buildRosPackage,
  etsi_its_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geographiclib,
  geometry_msgs,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_msgs_utils = substituteSource {
      src = fetchgit {
        name = "etsi_its_msgs_utils-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "f52b99b1a57ca43d91404882b4fc9e8b6d7fa802";
        hash = "sha256-4m9rkftE0f05rRclVc/Ydtwxsa10Ly68mzSIds7ouP4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_msgs_utils";
  version = "2.0.2-1";
  src = sources.etsi_its_msgs_utils;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_msgs geographiclib geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
