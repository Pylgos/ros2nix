{
  ament_cmake,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3,
  rosidl_cli,
  rosidl_generator_c,
  rosidl_generator_cpp,
  rosidl_parser,
  rosidl_pycommon,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_interface,
  rosidl_typesupport_introspection_c,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_introspection_cpp = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_introspection_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "0fd0b3767aba8e45c9ccdf35dcb15640d376bf9a";
        hash = "sha256-ORrlN/jhh1ZVJnsEHF5aBCI6vDWs0u/caZsLtUGvW90=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_introspection_cpp";
  version = "4.0.1-1";
  src = sources.rosidl_typesupport_introspection_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake ament_index_python python3 rosidl_cli rosidl_generator_c rosidl_generator_cpp rosidl_parser rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_interface rosidl_typesupport_introspection_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
