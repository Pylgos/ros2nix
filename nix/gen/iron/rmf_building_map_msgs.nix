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
  substituteSource,
}:
let
  sources = rec {
    rmf_building_map_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_building_map_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_building_map_msgs-release.git";
        rev = "2208f68bd0a6ee15440a3f7fca1bd2a300e57b78";
        hash = "sha256-F2fXhMcXZu4QhWmHgmVOdm6x5LKa0ACBsLJxMC8Fe/A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_building_map_msgs";
  version = "1.3.1-1";
  src = sources.rmf_building_map_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
