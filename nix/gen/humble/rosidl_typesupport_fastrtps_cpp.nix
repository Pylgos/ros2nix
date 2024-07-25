{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fastcdr,
  fastrtps_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  performance_test_fixture,
  python3,
  rmw,
  rosidl_cli,
  rosidl_cmake,
  rosidl_generator_cpp,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_interface,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_fastrtps_cpp = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_fastrtps_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "f52b704ae4de3cd685b9b770618be0fcf8eb99e2";
        hash = "sha256-232Vr+xMLXjWYxoCvb3duqpFtTEbCyofKLF9bis+k+4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_fastrtps_cpp";
  version = "2.2.2-2";
  src = sources.rosidl_typesupport_fastrtps_cpp;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake_ros ament_index_python fastrtps_cmake_module python3 rmw rosidl_cli rosidl_cmake rosidl_generator_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fastcdr rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
