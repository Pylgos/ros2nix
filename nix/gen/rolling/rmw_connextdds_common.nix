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
  tracetools,
}:
let
  sources = rec {
    rmw_connextdds_common = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds_common-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "73ef0674e7a25ccbe6165ec438189c1d6dbdf2df";
        hash = "sha256-3E0CoXHagt3qLFlunKXCTB/eyPwrWUqbEHaSEbVH7f8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_connextdds_common";
  version = "0.24.0-1";
  src = sources.rmw_connextdds_common;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fastcdr rcpputils rcutils rmw rmw_dds_common rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_fastrtps_c rosidl_typesupport_fastrtps_cpp rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp rti_connext_dds_cmake_module tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
