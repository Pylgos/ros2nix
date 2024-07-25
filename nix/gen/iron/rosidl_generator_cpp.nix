{
  ament_cmake,
  ament_cmake_core,
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
  rosidl_generator_type_description,
  rosidl_parser,
  rosidl_pycommon,
  rosidl_runtime_cpp,
  substituteSource,
}:
let
  sources = rec {
    rosidl_generator_cpp = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "247e65736f4b0ac35baf415d1c49aa21ecb9effb";
        hash = "sha256-3VPSVLSZ05z4Y4K+9feL/7vjlh1IsB16HbBuCr1uuSA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_cpp";
  version = "4.0.1-1";
  src = sources.rosidl_generator_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_index_python python3 rosidl_cli rosidl_generator_c rosidl_generator_type_description rosidl_parser rosidl_pycommon ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ ament_cmake_core ament_index_python rosidl_cli rosidl_generator_c rosidl_generator_type_description rosidl_parser rosidl_pycommon ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ rosidl_runtime_cpp ];
}
