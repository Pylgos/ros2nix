{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lely_core_libraries,
  lifecycle_msgs,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    canopen_fake_slaves = substituteSource {
      src = fetchgit {
        name = "canopen_fake_slaves-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "401250013ff3a88b8a0ace3e69f49134e1f00ac0";
        hash = "sha256-IC+FEMc92uuchP1MQZLid074MgZKizbxqBTZ0qyp934=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_fake_slaves";
  version = "0.2.11-2";
  src = sources.canopen_fake_slaves;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lely_core_libraries lifecycle_msgs rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
