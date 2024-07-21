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
  rosidl_cli,
  rosidl_parser,
  substituteSource,
}:
let
  sources = rec {
    rosidl_generator_type_description = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_type_description-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "f9e925141a8c57f331e0533060e16f68f7f95397";
        hash = "sha256-H3dIGZRfMX0OOi2a1Te6a3GOmCmBfxMRiTkjObPjMMs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_type_description";
  version = "4.6.3-1";
  src = sources.rosidl_generator_type_description;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_python ament_cmake_ros ament_index_python python3 rosidl_cli rosidl_parser ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_python ament_cmake_ros ament_index_python rosidl_cli rosidl_parser ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
