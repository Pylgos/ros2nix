{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_cmake,
  rosidl_default_generators,
  rosidl_default_runtime,
  rosidl_typesupport_cpp,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_performance_benchmarking_msgs = substituteSource {
      src = fetchgit {
        name = "rosbag2_performance_benchmarking_msgs-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "1724d1f025e11ac380358599f6f97a28130a18f9";
        hash = "sha256-JmPb1vGuCLBq8W3onniINTIuI3Mr5+6bugqc8EiEYW8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_performance_benchmarking_msgs";
  version = "0.22.6-1";
  src = sources.rosbag2_performance_benchmarking_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
