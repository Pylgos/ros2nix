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
        rev = "30c7e48ee1da3415d1cf2b34bd9f8ac4153fef22";
        hash = "sha256-Fu8BWEXr2czT8qsbkO9m87ZmG85ToLdHGrVNN26h4gc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_lifecycle";
  version = "5.3.8-1";
  src = sources.rcl_lifecycle;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rcl rcutils rosidl_runtime_c tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
