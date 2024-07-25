{
  action_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  object_recognition_msgs,
  octomap_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  shape_msgs,
  std_msgs,
  substituteSource,
  trajectory_msgs,
}:
let
  sources = rec {
    moveit_msgs = substituteSource {
      src = fetchgit {
        name = "moveit_msgs-source";
        url = "https://github.com/ros2-gbp/moveit_msgs-release.git";
        rev = "d6dc68834f8c3058ae31143ed9e559dcb9d9e68a";
        hash = "sha256-j2kN0/aZXgqQgw3wkRghueiY+X/URho8qm57Ze8n1y0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_msgs";
  version = "2.2.1-1";
  src = sources.moveit_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs geometry_msgs object_recognition_msgs octomap_msgs rosidl_default_runtime sensor_msgs shape_msgs std_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
