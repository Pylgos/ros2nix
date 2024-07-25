{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    micro_ros_msgs = substituteSource {
      src = fetchgit {
        name = "micro_ros_msgs-source";
        url = "https://github.com/ros2-gbp/micro_ros_msgs-release.git";
        rev = "4a92200ded173fee7e01457cfa314e3b48ff53c6";
        hash = "sha256-kuDv7e3C0BCXolx6ePv0TLEpK9E3OfLGFAh0K/9Wb8o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "micro_ros_msgs";
  version = "1.0.0-4";
  src = sources.micro_ros_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}