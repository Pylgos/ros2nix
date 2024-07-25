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
        rev = "a3fb398c476684ba92c2cb7c3f0ace7504624626";
        hash = "sha256-Tn6OxNgcc9HTgnNe4zXfGb8pk+v9vKQoZv/DNmp8HnU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometry2";
  version = "0.38.0-1";
  src = sources.geometry2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tf2 tf2_bullet tf2_eigen tf2_eigen_kdl tf2_geometry_msgs tf2_kdl tf2_msgs tf2_py tf2_ros tf2_sensor_msgs tf2_tools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
