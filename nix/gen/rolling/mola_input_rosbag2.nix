{
  buildRosPackage,
  cmake,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_kernel,
  mrpt2,
  rosbag2_cpp,
  sensor_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_msgs,
  tf2_ros,
}:
let
  sources = rec {
    mola_input_rosbag2 = substituteSource {
      src = fetchgit {
        name = "mola_input_rosbag2-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "9e3f746ce52b02c4b57e57fb6a880fdf9c31bfb3";
        hash = "sha256-K3+U9HWRCi4GzWtIlh7AReA7LcLidA2LAcoyJek7rKM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_rosbag2";
  version = "1.0.6-1";
  src = sources.mola_input_rosbag2;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge mola_kernel mrpt2 rosbag2_cpp sensor_msgs tf2_geometry_msgs tf2_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
