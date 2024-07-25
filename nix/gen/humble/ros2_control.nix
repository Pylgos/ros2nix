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
        rev = "93c479757d58641e9297373be2ea17a0a380bee7";
        hash = "sha256-52Vfejtx0OzndSXBdYrooaXsWRM2GRupksrUzVD0ROE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_control";
  version = "2.41.0-1";
  src = sources.ros2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_interface controller_manager controller_manager_msgs hardware_interface joint_limits ros2_control_test_assets ros2controlcli transmission_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
