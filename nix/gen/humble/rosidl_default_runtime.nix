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
    rosidl_default_runtime = substituteSource {
      src = fetchgit {
        name = "rosidl_default_runtime-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "66bde956f690df5acfbcebdebfa70ad5671f9898";
        hash = "sha256-D8f8pyTUOE6fCgzufPRrcZ55sRlr69SdumuckOP+L9A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_default_runtime";
  version = "1.2.0-2";
  src = sources.rosidl_default_runtime;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_generator_py ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_c rosidl_typesupport_cpp rosidl_typesupport_fastrtps_c rosidl_typesupport_fastrtps_cpp rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
