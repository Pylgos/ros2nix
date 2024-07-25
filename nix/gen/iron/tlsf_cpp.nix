{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rmw,
  rmw_implementation_cmake,
  std_msgs,
  substituteSource,
  tlsf,
}:
let
  sources = rec {
    tlsf_cpp = substituteSource {
      src = fetchgit {
        name = "tlsf_cpp-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "a804b2f1cc4b27c61e601ae2da6ae9c8af15b811";
        hash = "sha256-ZbjptWujAhtBL4dBpUCq3KV2Nqsm4WspSBK+rHIXLMc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tlsf_cpp";
  version = "0.15.0-3";
  src = sources.tlsf_cpp;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp std_msgs tlsf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
