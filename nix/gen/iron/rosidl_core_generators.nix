{
  ament_cmake,
  ament_cmake_core,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_cmake,
  rosidl_generator_c,
  rosidl_generator_cpp,
  rosidl_generator_py,
  rosidl_generator_type_description,
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
    rosidl_core_generators = substituteSource {
      src = fetchgit {
        name = "rosidl_core_generators-source";
        url = "https://github.com/ros2-gbp/rosidl_core-release.git";
        rev = "3c048d40f3ebb1a631d71ecbe3bbfa7c3a464c1f";
        hash = "sha256-TjOMTy77IjrjQvCMVSgmbNS6vo7OlW9RKo7Tx6NQ9ME=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_core_generators";
  version = "0.1.1-3";
  src = sources.rosidl_core_generators;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_core rosidl_cmake rosidl_generator_c rosidl_generator_cpp rosidl_generator_py ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ ament_cmake_core rosidl_cmake rosidl_generator_c rosidl_generator_cpp rosidl_generator_py rosidl_generator_type_description rosidl_typesupport_fastrtps_c rosidl_typesupport_fastrtps_cpp rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ rosidl_typesupport_c rosidl_typesupport_cpp rosidl_typesupport_fastrtps_c rosidl_typesupport_fastrtps_cpp rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp ];
}
