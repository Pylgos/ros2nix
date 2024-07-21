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
        rev = "19e6ce4bc36465f2bbd2b6a8c359391d8cd8d166";
        hash = "sha256-3/FPYI561bff5nqES47wLASGbBezxQt3pcmShGE1WOM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_fake_slaves";
  version = "0.2.9-2";
  src = sources.canopen_fake_slaves;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lely_core_libraries lifecycle_msgs rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}