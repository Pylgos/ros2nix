{
  action_msgs,
  ament_cmake,
  ament_cmake_gtest,
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
  test_interface_files,
}:
let
  sources = rec {
    test_msgs = substituteSource {
      src = fetchgit {
        name = "test_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "e56768734f15c1bcf5d39473a92c36992b4b87d7";
        hash = "sha256-k66Etl4hgxk54Angntcz/T4ISPLrnJcam2cbBWFEeyw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_msgs";
  version = "1.2.1-1";
  src = sources.test_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime test_interface_files ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
