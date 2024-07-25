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
  rosidl_cmake,
  rosidl_parser,
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
        rev = "9bd6385a1e9ea6c5f6cc8540346f6b89e7696be3";
        hash = "sha256-Qo5skbbMbNeorMoQq7Ujgf6kFiRp5L8ogrzKMCrQODk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_introspection_cpp";
  version = "3.1.5-2";
  src = sources.rosidl_typesupport_introspection_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake ament_index_python python3 rosidl_cli rosidl_cmake rosidl_parser ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_interface rosidl_typesupport_introspection_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
