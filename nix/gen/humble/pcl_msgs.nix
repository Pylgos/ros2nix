{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    pcl_msgs = substituteSource {
      src = fetchgit {
        name = "pcl_msgs-source";
        url = "https://github.com/ros2-gbp/pcl_msgs-release.git";
        rev = "bfc47345603ead755899b092e701d2308a0af0a5";
        hash = "sha256-YdspDlpwU8CIVBKEa3kLCnDsR3MsuehC9zuvXtAnt4w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pcl_msgs";
  version = "1.0.0-7";
  src = sources.pcl_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
