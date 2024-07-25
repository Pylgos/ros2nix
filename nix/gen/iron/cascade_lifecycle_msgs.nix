{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rosidl_default_generators,
  substituteSource,
}:
let
  sources = rec {
    cascade_lifecycle_msgs = substituteSource {
      src = fetchgit {
        name = "cascade_lifecycle_msgs-source";
        url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
        rev = "4826338d8829c36c663377e434fdd4f226ef14c4";
        hash = "sha256-FeXHwXjkOW6WU4eEm7nlcMHat2+rldQdsVoQNOZpzSg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cascade_lifecycle_msgs";
  version = "1.0.5-1";
  src = sources.cascade_lifecycle_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces lifecycle_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
