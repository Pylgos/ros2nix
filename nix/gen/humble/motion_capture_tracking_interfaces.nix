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
        rev = "195b48946d44b301595188e39b639ad4d77e9420";
        hash = "sha256-Q0Ev2Q3Szm0/MddIBOrD392RBnqgSkuatRrxENpEiC0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "motion_capture_tracking_interfaces";
  version = "1.0.5-1";
  src = sources.motion_capture_tracking_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
