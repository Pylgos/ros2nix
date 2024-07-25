{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_relocalization,
  mp2p_icp,
  mrpt2,
  mrpt_msgs,
  mrpt_msgs_bridge,
  mrpt_tutorials,
  nav_msgs,
  pose_cov_ops,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    mrpt_pf_localization = substituteSource {
      src = fetchgit {
        name = "mrpt_pf_localization-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "9ed187664d71e29907269d09829259a998f45d79";
        hash = "sha256-c645b+A6uepkHV4RJzusYt6PHdi8Zi3AdNwXO/eYODQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_pf_localization";
  version = "2.0.1-1";
  src = sources.mrpt_pf_localization;
  nativeBuildInputs = [ ament_cmake cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common mola_relocalization mp2p_icp mrpt2 mrpt_msgs mrpt_msgs_bridge nav_msgs pose_cov_ops sensor_msgs std_msgs tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
