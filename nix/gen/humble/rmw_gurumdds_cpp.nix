{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gurumdds_cmake_module,
  rcutils,
  rmw,
  rmw_dds_common,
  rosidl_cmake,
  rosidl_generator_dds_idl,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_introspection_c,
  rosidl_typesupport_introspection_cpp,
  substituteSource,
}:
let
  sources = rec {
    rmw_gurumdds_cpp = substituteSource {
      src = fetchgit {
        name = "rmw_gurumdds_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_gurumdds-release.git";
        rev = "03b6e386167ab9ad9f2410ea1b1617cbc564dae2";
        hash = "sha256-b2qqmEMotUSG+oBxnlLlGzqdyX1gERuvxjz1q/tirJ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_gurumdds_cpp";
  version = "3.4.2-1";
  src = sources.rmw_gurumdds_cpp;
  nativeBuildInputs = [ ament_cmake_ros rosidl_cmake ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gurumdds_cmake_module rcutils rmw_dds_common rosidl_generator_dds_idl rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
