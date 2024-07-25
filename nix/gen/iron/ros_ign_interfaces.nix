{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ros_gz_interfaces,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ros_ign_interfaces = substituteSource {
      src = fetchgit {
        name = "ros_ign_interfaces-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "d52ee3cf62945d8147892183161fc1bf60b4c814";
        hash = "sha256-tR3nxzVljE2kcUD/DHEihG7iPfpRtHzkS7+UMrGvpQY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_ign_interfaces";
  version = "0.254.1-1";
  src = sources.ros_ign_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs ros_gz_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
