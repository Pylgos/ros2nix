{
  ament_cmake,
  buildRosPackage,
  controller_interface,
  controller_manager,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  joint_limits,
  ros2_control_test_assets,
  ros2controlcli,
  substituteSource,
  transmission_interface,
}:
let
  sources = rec {
    ros2_control = substituteSource {
      src = fetchgit {
        name = "ros2_control-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "7bec9df7beb13c993b27d830322c554dd008cdd3";
        hash = "sha256-zTdr4m6XxqGF5Y6IjSOHyYTHOAScQ2f6i/OatTEV6+s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_control";
  version = "4.12.0-1";
  src = sources.ros2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_interface controller_manager controller_manager_msgs hardware_interface joint_limits ros2_control_test_assets ros2controlcli transmission_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
