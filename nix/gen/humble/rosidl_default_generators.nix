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
    rosidl_default_generators = substituteSource {
      src = fetchgit {
        name = "rosidl_default_generators-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "0b7f3d9cbfd579443784e94336adc4c2dd3101fa";
        hash = "sha256-vtXybJ/2s8rmMVm19tQKopkkTncUiSzDqk5LQS/2tBc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_default_generators";
  version = "1.2.0-2";
  src = sources.rosidl_default_generators;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_core rosidl_cmake rosidl_generator_c rosidl_generator_cpp rosidl_generator_py ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ ament_cmake_core rosidl_cmake rosidl_generator_c rosidl_generator_cpp rosidl_generator_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ rosidl_typesupport_c rosidl_typesupport_cpp rosidl_typesupport_fastrtps_c rosidl_typesupport_fastrtps_cpp rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp ];
}
