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
  rosidl_runtime_c,
  rosidl_typesupport_introspection_c,
  rosidl_typesupport_introspection_cpp,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rmw_fastrtps_dynamic_cpp = substituteSource {
      src = fetchgit {
        name = "rmw_fastrtps_dynamic_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_fastrtps-release.git";
        rev = "bb9f5decb177b0c6ca0a89d940897e261f7aae24";
        hash = "sha256-VMOtQ60IO8FM70re/jGxiHQbnBjWiwYkoSzwcHXDIEE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_fastrtps_dynamic_cpp";
  version = "9.0.0-1";
  src = sources.rmw_fastrtps_dynamic_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake fastrtps_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fastcdr fastrtps rcpputils rcutils rmw rmw_dds_common rmw_fastrtps_shared_cpp rosidl_runtime_c rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
