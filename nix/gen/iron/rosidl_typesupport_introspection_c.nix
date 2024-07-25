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
  rosidl_parser,
  rosidl_pycommon,
  rosidl_runtime_c,
  rosidl_typesupport_interface,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_introspection_c = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_introspection_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "8dd4380519e567705f24331629dd9ef2a2850f14";
        hash = "sha256-hLDuUlevWqQ/mtz237DVBzKyOD2/rWxMuxlnmks0Lw0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_introspection_c";
  version = "4.0.1-1";
  src = sources.rosidl_typesupport_introspection_c;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake ament_index_python python3 rosidl_cli rosidl_generator_c rosidl_parser rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_runtime_c rosidl_typesupport_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
