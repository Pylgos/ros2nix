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
    diagnostic_msgs = substituteSource {
      src = fetchgit {
        name = "diagnostic_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "a47631e0045f1c724d3a8ffbe0dff91e2e51dd3c";
        hash = "sha256-eaFvJUaRGimzvTQiZCdxyw80bbw7SEQvnyOSMixD5P8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_msgs";
  version = "5.0.1-1";
  src = sources.diagnostic_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
