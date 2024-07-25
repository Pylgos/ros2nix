{
  ament_cmake_core,
  ament_cmake_python,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3,
  rcutils,
  rosidl_cli,
  rosidl_generator_type_description,
  rosidl_parser,
  rosidl_pycommon,
  rosidl_typesupport_interface,
  substituteSource,
}:
let
  sources = rec {
    rosidl_generator_c = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "2e05454a4585e0289e1265ceee16b9d0026a5626";
        hash = "sha256-Yw9RfWlMNbWXv4/VUypawKJXdYFwunv2+b8abG1Q4tU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_c";
  version = "4.0.1-1";
  src = sources.rosidl_generator_c;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_index_python python3 rosidl_cli rosidl_generator_type_description rosidl_parser rosidl_pycommon ];
  buildInputs = [ ament_cmake_python ament_cmake_ros ];
  propagatedBuildInputs = [ ament_cmake_core ament_index_python rosidl_cli rosidl_generator_type_description rosidl_parser rosidl_pycommon ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ rcutils rosidl_typesupport_interface ];
}
