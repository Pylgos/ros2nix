{
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
  rosidl_generator_c,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_fastrtps_cpp,
  rosidl_typesupport_interface,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_fastrtps_c = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_fastrtps_c-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "dd8b972a9567d9f944d29b4c3d5cded08782ac3d";
        hash = "sha256-hUQy5EkEyx+c7FGfB9oDTfI7BsBAGnvva0EhOd4HdAE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_fastrtps_c";
  version = "2.2.2-2";
  src = sources.rosidl_typesupport_fastrtps_c;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake_ros ament_index_python fastrtps_cmake_module python3 rmw rosidl_cli rosidl_cmake rosidl_generator_c ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fastcdr rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_fastrtps_cpp rosidl_typesupport_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
