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
        rev = "d3665e2759ffdb6cabc0b1a83929fd691d9679cb";
        hash = "sha256-fucX2BkaWAKGq0PLdbZ+inqt83+Vgcal/NDBINo+AYM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_pf_localization";
  version = "2.0.0-1";
  src = sources.mrpt_pf_localization;
  nativeBuildInputs = [ ament_cmake cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common mola_relocalization mp2p_icp mrpt2 mrpt_msgs mrpt_msgs_bridge nav_msgs pose_cov_ops sensor_msgs std_msgs tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
