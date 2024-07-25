{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_interfaces = substituteSource {
      src = fetchgit {
        name = "rosbag2_interfaces-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "6d831bea97d66f815ea48d6b23fb275f9219f31e";
        hash = "sha256-Bs5IftHq45F3sgIqyhYeK8IpfnkHhlX1n4y2whKEpG0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_interfaces";
  version = "0.15.11-1";
  src = sources.rosbag2_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
