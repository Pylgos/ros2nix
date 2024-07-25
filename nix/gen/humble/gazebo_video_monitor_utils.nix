{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_msgs,
  rclpy,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    gazebo_video_monitor_utils = substituteSource {
      src = fetchgit {
        name = "gazebo_video_monitor_utils-source";
        url = "https://github.com/ros2-gbp/gazebo_video_monitors-release.git";
        rev = "f49c6659093fa96e833c19c224461836e3017026";
        hash = "sha256-vEJNNeclh5xygZUb79ndkgcSo49xEDCEILVbPF0EioI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_video_monitor_utils";
  version = "0.8.1-1";
  src = sources.gazebo_video_monitor_utils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_msgs rclpy std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}