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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    autoware_internal_msgs = substituteSource {
      src = fetchgit {
        name = "autoware_internal_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "540dcac14e55cb94f772b249abbe2c6f3db81d90";
        hash = "sha256-o0LLAep3fmsKNFwsA/PE0iu3HCSZQSHvL5Aztip1BX8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_internal_msgs";
  version = "1.0.1-1";
  src = sources.autoware_internal_msgs;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
