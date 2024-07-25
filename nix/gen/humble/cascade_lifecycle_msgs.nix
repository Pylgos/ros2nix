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
        rev = "030879a4241d6dedcbcca3b181ddff67daf8da3d";
        hash = "sha256-zmOY/vNG6SpKHkTAIAHTB1jxV4PwvGd7A9WoIhvIX1Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cascade_lifecycle_msgs";
  version = "1.1.0-1";
  src = sources.cascade_lifecycle_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces lifecycle_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
