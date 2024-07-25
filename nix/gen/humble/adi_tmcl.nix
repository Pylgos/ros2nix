{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  ros2launch,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    adi_tmcl = substituteSource {
      src = fetchgit {
        name = "adi_tmcl-source";
        url = "https://github.com/ros2-gbp/adi_tmcl-release.git";
        rev = "84c5c64fbf08ee58e6181454f0e1fb386f7a63ae";
        hash = "sha256-XNXnB1gBOfaW67y4W/VOdV/l1VPXqBomVXcowt0dB3Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "adi_tmcl";
  version = "2.0.0-1";
  src = sources.adi_tmcl;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclcpp ros2launch rosidl_default_runtime std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
