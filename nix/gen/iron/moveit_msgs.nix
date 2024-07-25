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
        rev = "92e5c08300df2bdc33ca7e3808a8050a4d97dbd4";
        hash = "sha256-AEbp3Ti85x0CRQZMfDwb6MtI1gZUMXgjjDKgbrDPecw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_msgs";
  version = "2.3.0-1";
  src = sources.moveit_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs geometry_msgs object_recognition_msgs octomap_msgs rosidl_default_runtime sensor_msgs shape_msgs std_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}