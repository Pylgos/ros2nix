{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    as2_msgs = substituteSource {
      src = fetchgit {
        name = "as2_msgs-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "92091dada004a37fb515b12504a1b509f37cd303";
        hash = "sha256-KyjKz3/Lwe9udT3p4jG93YuUUaPako9+d4wusT3Xm+A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_msgs";
  version = "1.0.9-1";
  src = sources.as2_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces geographic_msgs geometry_msgs nav_msgs rclcpp rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
