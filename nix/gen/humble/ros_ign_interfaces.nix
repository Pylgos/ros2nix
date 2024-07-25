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
        rev = "0a55a03dfc98c78c711cdaa1768230b45dec96d6";
        hash = "sha256-XCGd56zJmCaofm9D4Jf4/LXQwtJr/r835phv66nAIZo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_ign_interfaces";
  version = "0.244.15-1";
  src = sources.ros_ign_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs ros_gz_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
