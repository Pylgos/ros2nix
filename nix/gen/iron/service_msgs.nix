{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_core_generators,
  rosidl_core_runtime,
  substituteSource,
}:
let
  sources = rec {
    service_msgs = substituteSource {
      src = fetchgit {
        name = "service_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "873f4e4bfc4cf2eb06c8c0b1a5ff865f3b2d92fa";
        hash = "sha256-i/ctuZBiLCgFMnwStYTvYboTxcd38P8z6g6p5efcmAs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "service_msgs";
  version = "1.6.0-2";
  src = sources.service_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_core_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_core_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
