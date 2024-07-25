{
  ament_cmake,
  ament_cmake_core,
  ament_cmake_gtest,
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
  rosidl_generator_c,
  rosidl_parser,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  substituteSource,
  test_interface_files,
}:
let
  sources = rec {
    rosidl_generator_cpp = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "69f8913b549dc1df939ab9d8071342cd3781d14a";
        hash = "sha256-pz8mZofA6Mg13myWcPLvXrZoPa7grIe3P0WEs+vme8c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_cpp";
  version = "3.1.5-2";
  src = sources.rosidl_generator_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_index_python python3 rosidl_cli rosidl_cmake rosidl_generator_c rosidl_parser ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ ament_cmake_core ament_index_python rosidl_cli rosidl_cmake rosidl_generator_c rosidl_parser ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ rosidl_runtime_cpp ];
}
