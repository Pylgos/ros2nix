{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_generator_py,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_c,
  rosidl_typesupport_cpp,
  rosidl_typesupport_fastrtps_c,
  rosidl_typesupport_fastrtps_cpp,
  rosidl_typesupport_introspection_c,
  rosidl_typesupport_introspection_cpp,
  substituteSource,
}:
let
  sources = rec {
    rosidl_core_runtime = substituteSource {
      src = fetchgit {
        name = "rosidl_core_runtime-source";
        url = "https://github.com/ros2-gbp/rosidl_core-release.git";
        rev = "c188af0ac3b90cc867086c53c7401cd8aafa7fab";
        hash = "sha256-NEpTeaiX8517sB5rwONF2QeR226fOrZrOGQC3+zKeHs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_core_runtime";
  version = "0.2.0-3";
  src = sources.rosidl_core_runtime;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_generator_py ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_c rosidl_typesupport_cpp rosidl_typesupport_fastrtps_c rosidl_typesupport_fastrtps_cpp rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
