{
  ament_cmake,
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
  rosidl_dynamic_typesupport,
  rosidl_dynamic_typesupport_fastrtps,
  rosidl_runtime_c,
  rosidl_typesupport_introspection_c,
  rosidl_typesupport_introspection_cpp,
  substituteSource,
  tracetools,
}:
let
  sources = rec {
    rmw_fastrtps_shared_cpp = substituteSource {
      src = fetchgit {
        name = "rmw_fastrtps_shared_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_fastrtps-release.git";
        rev = "a8987daf5672023eccdce8e032acaf75ac01f4aa";
        hash = "sha256-bPq7WfptPsgoT3+tOy06VFaePsX4mF7mLZo7bNuIoHY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_fastrtps_shared_cpp";
  version = "7.1.3-1";
  src = sources.rmw_fastrtps_shared_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake fastrtps_cmake_module rmw rosidl_dynamic_typesupport ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fastcdr fastrtps rcpputils rcutils rmw_dds_common rosidl_dynamic_typesupport_fastrtps rosidl_runtime_c rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
