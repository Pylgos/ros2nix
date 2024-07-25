{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lttng-ust,
  python3Packages,
  rcl,
  rclcpp,
  rclcpp_action,
  smacc2_msgs,
  substituteSource,
  tracetools,
  tracetools_launch,
  tracetools_trace,
}:
let
  sources = rec {
    smacc2 = substituteSource {
      src = fetchgit {
        name = "smacc2-source";
        url = "https://github.com/ros2-gbp/SMACC2-release.git";
        rev = "08f546b4580b810ea994473a0090c0589911f703";
        hash = "sha256-yI0OXFGrQ42OcS1v1pv7VdeoqmflWYkFqHfGbacMe+Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smacc2";
  version = "0.4.0-3";
  src = sources.smacc2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lttng-ust python3Packages.boost rcl rclcpp rclcpp_action smacc2_msgs tracetools tracetools_launch tracetools_trace ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
