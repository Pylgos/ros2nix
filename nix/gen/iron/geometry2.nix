{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tf2,
  tf2_bullet,
  tf2_eigen,
  tf2_eigen_kdl,
  tf2_geometry_msgs,
  tf2_kdl,
  tf2_msgs,
  tf2_py,
  tf2_ros,
  tf2_sensor_msgs,
  tf2_tools,
}:
let
  sources = rec {
    geometry2 = substituteSource {
      src = fetchgit {
        name = "geometry2-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "493a6bd64a580ac115e06323aec7184ec59404c1";
        hash = "sha256-LMgk0RzRnLDyJZtrO1VpK8rP6MhcFMWKpQ5esx+PUwg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometry2";
  version = "0.31.7-1";
  src = sources.geometry2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tf2 tf2_bullet tf2_eigen tf2_eigen_kdl tf2_geometry_msgs tf2_kdl tf2_msgs tf2_py tf2_ros tf2_sensor_msgs tf2_tools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
