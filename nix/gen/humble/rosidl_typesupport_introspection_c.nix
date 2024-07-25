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
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_introspection_c = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_introspection_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "482e8b20577b357493e5382fbf1b11f787e12a84";
        hash = "sha256-zdQTzA6Hi9855GWyxYpLQp+LxDF/ofM7A67iVqEO6ms=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_introspection_c";
  version = "3.1.5-2";
  src = sources.rosidl_typesupport_introspection_c;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake ament_index_python python3 rosidl_cli rosidl_cmake rosidl_parser ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
