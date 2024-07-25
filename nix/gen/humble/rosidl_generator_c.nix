{
  ament_cmake_core,
  ament_cmake_gtest,
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
  rosidl_cmake,
  rosidl_parser,
  rosidl_runtime_c,
  rosidl_typesupport_interface,
  substituteSource,
  test_interface_files,
}:
let
  sources = rec {
    rosidl_generator_c = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "3134dc8bca0f75b8aa719412673d893a255c184b";
        hash = "sha256-4UoiPYDf/FytKE5BcYcdVbUsEul5Y99nZ7yi05jKL3U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_c";
  version = "3.1.5-2";
  src = sources.rosidl_generator_c;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_index_python python3 rosidl_cli rosidl_cmake rosidl_parser ];
  buildInputs = [ ament_cmake_python ament_cmake_ros ];
  propagatedBuildInputs = [ ament_cmake_core ament_index_python rosidl_cli rosidl_cmake rosidl_parser ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ rcutils rosidl_typesupport_interface ];
}
