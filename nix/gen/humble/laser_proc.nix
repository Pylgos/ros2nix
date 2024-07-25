{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    laser_proc = substituteSource {
      src = fetchgit {
        name = "laser_proc-source";
        url = "https://github.com/ros2-gbp/laser_proc-release.git";
        rev = "02d1f66ad2821896cbfbd210f97f363e5af0f2a0";
        hash = "sha256-h2lPjaJimCF/20eVEH3+ZS7CDqoML9voXq2B0x32NSY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "laser_proc";
  version = "1.0.2-5";
  src = sources.laser_proc;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}