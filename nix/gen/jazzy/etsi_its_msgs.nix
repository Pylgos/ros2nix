{
  ament_cmake,
  buildRosPackage,
  etsi_its_cam_msgs,
  etsi_its_denm_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_msgs = substituteSource {
      src = fetchgit {
        name = "etsi_its_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "3404554c458115cac3981a5d678f6547f00d9e03";
        hash = "sha256-PisQE2Jlo+Xk9Tvs8yuv5Ai3aj8zb/DD+8RBh9DdH40=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_msgs";
  version = "2.0.2-1";
  src = sources.etsi_its_msgs;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_cam_msgs etsi_its_denm_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
