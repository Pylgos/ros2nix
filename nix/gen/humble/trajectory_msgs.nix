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
        rev = "25fd27cc6224dbee72d489d536aa6075acea31cc";
        hash = "sha256-Ue4uGV15p1CoAheprEG3NYFPqoSb9OLBmzavipVznvk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "trajectory_msgs";
  version = "4.2.4-1";
  src = sources.trajectory_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
