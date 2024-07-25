{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    plansys2_msgs = substituteSource {
      src = fetchgit {
        name = "plansys2_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "17b7b0f58cdba94b6e934d3af7f16c7de1070493";
        hash = "sha256-WlVE5vRilxZrlcer2VZ9xtGa5jU+LP7PvFK3lcT71Rw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_msgs";
  version = "2.0.11-1";
  src = sources.plansys2_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
