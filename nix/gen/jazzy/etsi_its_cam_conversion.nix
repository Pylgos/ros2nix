{
  ament_cmake,
  buildRosPackage,
  etsi_its_cam_coding,
  etsi_its_cam_msgs,
  etsi_its_primitives_conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_cam_conversion = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "33bb208ef2e4f74ea1e24d9bdce15cd341c73cba";
        hash = "sha256-U04yBihW8oMI74WedgJ09WHsei9+FLV0DlBwpixQFTI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_cam_conversion";
  version = "2.0.2-1";
  src = sources.etsi_its_cam_conversion;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_cam_coding etsi_its_cam_msgs etsi_its_primitives_conversion ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
