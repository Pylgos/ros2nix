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
        rev = "b6ce03e72358f55bd5191b20c03a3f923a7135f1";
        hash = "sha256-ghTRqimr7Q9pEWyaM5BeG/W2r8K98goBjJh12QtUXq4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_core_runtime";
  version = "0.1.1-3";
  src = sources.rosidl_core_runtime;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_generator_py ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_c rosidl_typesupport_cpp rosidl_typesupport_fastrtps_c rosidl_typesupport_fastrtps_cpp rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
