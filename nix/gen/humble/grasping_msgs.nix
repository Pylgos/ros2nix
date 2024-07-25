{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  moveit_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  shape_msgs,
  substituteSource,
}:
let
  sources = rec {
    grasping_msgs = substituteSource {
      src = fetchgit {
        name = "grasping_msgs-source";
        url = "https://github.com/mikeferguson/grasping_msgs-ros2-gbp.git";
        rev = "36f13b1f1fd1c4f918a77131231b48fcb956e8a9";
        hash = "sha256-7jkZuQAfwrBxZtca5lsT7W9diA/c+snR1FHkf4JjZoM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grasping_msgs";
  version = "0.4.0-1";
  src = sources.grasping_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs moveit_msgs rosidl_default_runtime sensor_msgs shape_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
