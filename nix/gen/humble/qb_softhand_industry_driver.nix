{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qb_softhand_industry_srvs,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    qb_softhand_industry_driver = substituteSource {
      src = fetchgit {
        name = "qb_softhand_industry_driver-source";
        url = "https://bitbucket.org/qbrobotics/qbshin-ros2-release.git";
        rev = "bc238cb0bc2732b3a3b7e1582a53d218379b848c";
        hash = "sha256-CLqBrRYFS36sEMXIJBJzs+pTjv9AUKNxzgDUtcSZoUg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qb_softhand_industry_driver";
  version = "2.1.2-4";
  src = sources.qb_softhand_industry_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qb_softhand_industry_srvs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
