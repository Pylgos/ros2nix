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
  rosidl_generator_c,
  rosidl_generator_type_description,
  rosidl_pycommon,
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
        rev = "59d237421996e606cc754db05dcb09b5e796b722";
        hash = "sha256-agktI+DKGrEqfyO3NvlMhpN7lI2tI3k+Ha46zmRLywg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_cpp";
  version = "3.0.1-1";
  src = sources.rosidl_typesupport_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_index_python python3 rosidl_cli rosidl_generator_c rosidl_generator_type_description rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcpputils rcutils rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_c rosidl_typesupport_fastrtps_cpp rosidl_typesupport_interface rosidl_typesupport_introspection_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}