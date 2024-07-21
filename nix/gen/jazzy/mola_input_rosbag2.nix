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
        rev = "a2f0f35687d65abb2c3411e33721070b8bf32991";
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
