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
        rev = "3d4c17c245994a7310c4d008dfb4a519ae2d8e12";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_cam_msgs etsi_its_denm_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
