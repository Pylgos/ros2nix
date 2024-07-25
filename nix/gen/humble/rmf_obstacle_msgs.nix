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
}:
let
  sources = rec {
    rmf_obstacle_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_obstacle_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "e9c0d0a80f7744b611202c17f862f466af6e8dfb";
        hash = "sha256-+iLzJTM/DzfUiMGtXO4JtDt2ucrzw6fntRRgsEIID/s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_obstacle_msgs";
  version = "3.0.4-1";
  src = sources.rmf_obstacle_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
