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
        rev = "4394d6c752155ad8f2f0c6989e54cfbdf8086d13";
        hash = "sha256-Qb9FZrIppoeyv3Zvj1u4vWuEfjMO+LEUMXpYs71WVb4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_fastrtps_cpp";
  version = "9.0.0-1";
  src = sources.rmw_fastrtps_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake fastrtps_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fastcdr fastrtps rcpputils rcutils rmw rmw_dds_common rmw_fastrtps_shared_cpp rosidl_dynamic_typesupport rosidl_dynamic_typesupport_fastrtps rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_fastrtps_c rosidl_typesupport_fastrtps_cpp tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
