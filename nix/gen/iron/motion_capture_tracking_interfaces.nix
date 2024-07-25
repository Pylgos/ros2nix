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
    motion_capture_tracking_interfaces = substituteSource {
      src = fetchgit {
        name = "motion_capture_tracking_interfaces-source";
        url = "https://github.com/ros2-gbp/motion_capture_tracking-release.git";
        rev = "4b903f72a17cbe463e53f1187e8db9c4fc6f8e84";
        hash = "sha256-x7usaHJd7aI8kki/HfgQ/4sS0688kKdLnayPwsXhFjA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "motion_capture_tracking_interfaces";
  version = "1.0.4-1";
  src = sources.motion_capture_tracking_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
