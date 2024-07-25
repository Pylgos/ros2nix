{
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
        rev = "d63929d34074532bb64557d99862f15912db77ef";
        hash = "sha256-Tq46Gyamz4dwh9/yJWprFVy3FSausnfJ4gZd8FIJFJY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_msgs";
  version = "1.6.0-2";
  src = sources.test_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime test_interface_files ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
