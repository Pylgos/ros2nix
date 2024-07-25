{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
  trajectory_msgs,
}:
let
  sources = rec {
    gazebo_msgs = substituteSource {
      src = fetchgit {
        name = "gazebo_msgs-source";
        url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release.git";
        rev = "857f9b2fa536c73d5b64d6b90996f6ec599e97a3";
        hash = "sha256-UEKtnD23be8+FhZoXcZ5WNX/ki81mNNmoreVf2LEcHM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_msgs";
  version = "3.7.0-1";
  src = sources.gazebo_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
