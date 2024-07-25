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
        rev = "2de90d1ccacd8bd001c17a6c85a3fdc067ef734d";
        hash = "sha256-Om5c5UJp2Z+CWgKGHxYNnChZQij6UHJ42OGNfrzxmKY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometry2";
  version = "0.25.7-1";
  src = sources.geometry2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tf2 tf2_bullet tf2_eigen tf2_eigen_kdl tf2_geometry_msgs tf2_kdl tf2_msgs tf2_py tf2_ros tf2_sensor_msgs tf2_tools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
