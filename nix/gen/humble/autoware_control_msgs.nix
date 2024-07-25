{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    autoware_control_msgs = substituteSource {
      src = fetchgit {
        name = "autoware_control_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "e4d427e19cb556b14819f58234f10d0722257a8b";
        hash = "sha256-ka1LsUG3V5LgaUP4rD7F+n5yk79a9XGUiwqOsERHQO4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_control_msgs";
  version = "1.1.0-1";
  src = sources.autoware_control_msgs;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
