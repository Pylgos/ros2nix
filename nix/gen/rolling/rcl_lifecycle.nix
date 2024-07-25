{
  ament_cmake_gen_version_h,
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
        rev = "2d6b6c2dc0ff9efafd40f8c25ae775943cb87655";
        hash = "sha256-FRI+fTwp4EWW/BC3VioKzmObbLrZOQoffQXkQAtf8LY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_lifecycle";
  version = "9.4.0-1";
  src = sources.rcl_lifecycle;
  nativeBuildInputs = [ ament_cmake_gen_version_h ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rcl rcutils rmw rosidl_runtime_c tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
