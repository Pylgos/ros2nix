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
    trajectory_msgs = substituteSource {
      src = fetchgit {
        name = "trajectory_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "c19aea6c1d72c99aa397289cfcd19213576948ea";
        hash = "sha256-7CDVCo1MH2SjEg2UKfl2N4aU4ygYOLtn8EhASs6E/pE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "trajectory_msgs";
  version = "5.3.5-1";
  src = sources.trajectory_msgs;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
