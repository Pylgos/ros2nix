{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  kitti_metrics_eval,
  mola_bridge_ros2,
  mola_demos,
  mola_imu_preintegration,
  mola_input_euroc_dataset,
  mola_input_kitti360_dataset,
  mola_input_kitti_dataset,
  mola_input_mulran_dataset,
  mola_input_paris_luco_dataset,
  mola_input_rawlog,
  mola_input_rosbag2,
  mola_kernel,
  mola_launcher,
  mola_metric_maps,
  mola_navstate_fg,
  mola_navstate_fuse,
  mola_pose_list,
  mola_relocalization,
  mola_traj_tools,
  mola_viz,
  mola_yaml,
  substituteSource,
}:
let
  sources = rec {
    mola = substituteSource {
      src = fetchgit {
        name = "mola-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "1b064189dc601460ac347c848a4910768c175c2b";
        hash = "sha256-0k6S97+RfOGopfefX+vpaklgl1JH2VpH22vHt4bt2uQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola";
  version = "1.0.6-1";
  src = sources.mola;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_auto ament_lint_common kitti_metrics_eval mola_bridge_ros2 mola_demos mola_imu_preintegration mola_input_euroc_dataset mola_input_kitti360_dataset mola_input_kitti_dataset mola_input_mulran_dataset mola_input_paris_luco_dataset mola_input_rawlog mola_input_rosbag2 mola_kernel mola_launcher mola_metric_maps mola_navstate_fg mola_navstate_fuse mola_pose_list mola_relocalization mola_traj_tools mola_viz mola_yaml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
