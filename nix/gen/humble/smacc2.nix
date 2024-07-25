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
        url = "https://github.com/robosoft-ai/SMACC2-release.git";
        rev = "89014bf5672cf42cd93fa25135ef43ea14a82872";
        hash = "sha256-5jDKlxM1vi4tl/62N1ioJFbkyW2nUNy2IikLt9zgDDE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smacc2";
  version = "2.3.18-1";
  src = sources.smacc2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lttng-ust python3Packages.boost rcl rclcpp rclcpp_action smacc2_msgs tracetools tracetools_launch tracetools_trace ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
