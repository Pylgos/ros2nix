{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  osrf_testing_tools_cpp,
  rcl,
  rcutils,
  rmw,
  rosidl_runtime_c,
  substituteSource,
  tracetools,
}:
let
  sources = rec {
    rcl_lifecycle = substituteSource {
      src = fetchgit {
        name = "rcl_lifecycle-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "b8c823a50e8d8b7eb1976419ccc362cb6ca42d72";
        hash = "sha256-IAlpUYeb9Cn6oKXvNA8TC/vlRJYvU0CNbFvL3bHn/ng=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_lifecycle";
  version = "6.0.5-1";
  src = sources.rcl_lifecycle;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rcl rcutils rosidl_runtime_c tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
