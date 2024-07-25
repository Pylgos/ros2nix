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
        rev = "28ffafbe5e47cbb4995f69f449961da438a5b3d7";
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
