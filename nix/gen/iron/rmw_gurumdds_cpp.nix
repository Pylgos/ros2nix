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
        rev = "cd7e9b749707056eaced42cb5aae667ff3be43c1";
        hash = "sha256-/dxJm887k5s53pWhh4nolVG2Ini5Wlih+S4hPexcnto=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_gurumdds_cpp";
  version = "5.0.0-1";
  src = sources.rmw_gurumdds_cpp;
  nativeBuildInputs = [ ament_cmake_ros rosidl_cmake ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gurumdds_cmake_module rcutils rmw_dds_common rosidl_generator_dds_idl rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
