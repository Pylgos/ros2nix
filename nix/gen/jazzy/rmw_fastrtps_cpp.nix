{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fastcdr,
  fastrtps,
  fastrtps_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  rcpputils,
  rcutils,
  rmw,
  rmw_dds_common,
  rmw_fastrtps_shared_cpp,
  rosidl_dynamic_typesupport,
  rosidl_dynamic_typesupport_fastrtps,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_fastrtps_c,
  rosidl_typesupport_fastrtps_cpp,
  substituteSource,
  test_msgs,
  tracetools,
}:
let
  sources = rec {
    rmw_fastrtps_cpp = substituteSource {
      src = fetchgit {
        name = "rmw_fastrtps_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_fastrtps-release.git";
        rev = "200c86865116196d4debb4e58dad7cdb05db2d2f";
        hash = "sha256-JgRbkDDPKgz9Hd3CBhShc1N/rmcR/5R3NBdAY5MWnbY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_fastrtps_cpp";
  version = "8.4.1-1";
  src = sources.rmw_fastrtps_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake fastrtps_cmake_module rmw rosidl_dynamic_typesupport ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fastcdr fastrtps rcpputils rcutils rmw_dds_common rmw_fastrtps_shared_cpp rosidl_dynamic_typesupport_fastrtps rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_fastrtps_c rosidl_typesupport_fastrtps_cpp tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
