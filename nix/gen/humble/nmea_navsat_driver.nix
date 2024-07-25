{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nmea_msgs,
  python3Packages,
  rclpy,
  sensor_msgs,
  substituteSource,
  tf_transformations,
}:
let
  sources = rec {
    nmea_navsat_driver = substituteSource {
      src = fetchgit {
        name = "nmea_navsat_driver-source";
        url = "https://github.com/ros2-gbp/nmea_navsat_driver-release.git";
        rev = "e06fd5237ddc29bd7336241f5ad0e3c5425527aa";
        hash = "sha256-Sk5PVLiGhnZlswzI74j4DqsxsA7icXEWu6Wb6JlbN4s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nmea_navsat_driver";
  version = "2.0.1-1";
  src = sources.nmea_navsat_driver;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nmea_msgs python3Packages.pyserial rclpy sensor_msgs tf_transformations ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
