{
  ament_cmake_gmock,
  ament_cmake_ros,
  ament_cmake_version,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  rcutils,
  rosidl_dynamic_typesupport,
  rosidl_runtime_c,
  substituteSource,
}:
let
  sources = rec {
    rmw = substituteSource {
      src = fetchgit {
        name = "rmw-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "221ad82f50fc11d87c0fda292ffa13c39de33f99";
        hash = "sha256-jYhNw0/Pg3N3I+Xw/EmQyhNjiq918IIZppooBnEaXCQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw";
  version = "7.1.0-2";
  src = sources.rmw;
  nativeBuildInputs = [ ament_cmake_ros ament_cmake_version ];
  propagatedNativeBuildInputs = [ rosidl_dynamic_typesupport ];
  buildInputs = [ ament_cmake_ros ament_cmake_version ];
  propagatedBuildInputs = [ rosidl_dynamic_typesupport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ rcutils rosidl_runtime_c ];
}
