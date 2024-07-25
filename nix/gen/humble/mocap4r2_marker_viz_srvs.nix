{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
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
    mocap4r2_marker_viz_srvs = substituteSource {
      src = fetchgit {
        name = "mocap4r2_marker_viz_srvs-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "b2f050039eedc9e9a35fbde6db5be8694e7e5850";
        hash = "sha256-IX8TD+uAFWLqVOYhDPyuQPYPwLSV+lRBI4FgcttAwrg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mocap4r2_marker_viz_srvs";
  version = "0.0.7-1";
  src = sources.mocap4r2_marker_viz_srvs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
