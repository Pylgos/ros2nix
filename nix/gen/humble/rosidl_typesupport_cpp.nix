{
  ament_cmake_core,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  python3,
  rcpputils,
  rcutils,
  rosidl_cli,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_c,
  rosidl_typesupport_fastrtps_cpp,
  rosidl_typesupport_interface,
  rosidl_typesupport_introspection_cpp,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_cpp = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport-release.git";
        rev = "cff598fe507af33123d2b11222cbed9f00477699";
        hash = "sha256-r3Yictq1ldIuIRW8aw0d4l6SIsdWBg//vCPsNFsUJrQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_cpp";
  version = "2.0.1-1";
  src = sources.rosidl_typesupport_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_index_python python3 rosidl_cli ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcpputils rcutils rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_c rosidl_typesupport_fastrtps_cpp rosidl_typesupport_interface rosidl_typesupport_introspection_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
