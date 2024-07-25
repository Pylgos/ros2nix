{
  ament_cmake,
  buildRosPackage,
  controller_manager,
  diff_drive_controller,
  fetchgit,
  fetchurl,
  fetchzip,
  imu_filter_madgwick,
  interactive_marker_twist_server,
  joint_state_broadcaster,
  joint_trajectory_controller,
  joy_linux,
  robot_localization,
  robot_state_publisher,
  substituteSource,
  teleop_twist_joy,
  twist_mux,
}:
let
  sources = rec {
    clearpath_control = substituteSource {
      src = fetchgit {
        name = "clearpath_control-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "70fd774fbb612f22cc54ede93e233723f2c95a6c";
        hash = "sha256-APl+426d0ZcyfPfI8FuzZuJH8D74+iTLsjd5RBPPJSY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_control";
  version = "0.2.9-1";
  src = sources.clearpath_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager diff_drive_controller imu_filter_madgwick interactive_marker_twist_server joint_state_broadcaster joint_trajectory_controller joy_linux robot_localization robot_state_publisher teleop_twist_joy twist_mux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
