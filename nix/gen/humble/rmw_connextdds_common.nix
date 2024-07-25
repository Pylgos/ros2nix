{
  ament_cmake,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  rcpputils,
  rcutils,
  rmw,
  rmw_dds_common,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_fastrtps_c,
  rosidl_typesupport_fastrtps_cpp,
  rosidl_typesupport_introspection_c,
  rosidl_typesupport_introspection_cpp,
  rti_connext_dds_cmake_module,
  substituteSource,
}:
let
  sources = rec {
    rmw_connextdds_common = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds_common-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "c3f8a08218425d9e865df89ef5448d1c11a1f0fd";
        hash = "sha256-oC1l1Pv9U9IdJY7IX/9peV+MMerSVHFLyu8sTdsYGdU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_connextdds_common";
  version = "0.11.2-1";
  src = sources.rmw_connextdds_common;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fastcdr rcpputils rcutils rmw_dds_common rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_fastrtps_c rosidl_typesupport_fastrtps_cpp rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp rti_connext_dds_cmake_module ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
