{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_pep257,
  ament_cmake_pytest,
  ament_cmake_uncrustify,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  python_cmake_module,
  rmw,
  rosidl_cli,
  rosidl_cmake,
  rosidl_generator_c,
  rosidl_generator_cpp,
  rosidl_parser,
  rosidl_pycommon,
  rosidl_runtime_c,
  rosidl_typesupport_c,
  rosidl_typesupport_fastrtps_c,
  rosidl_typesupport_interface,
  rosidl_typesupport_introspection_c,
  rpyutils,
  substituteSource,
  test_interface_files,
}:
let
  sources = rec {
    rosidl_generator_py = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_py-source";
        url = "https://github.com/ros2-gbp/rosidl_python-release.git";
        rev = "535bc7f637a110cd1ddc725b1ca2f81b0e649f11";
        hash = "sha256-41P+aG+YcVxjNKVoaa73NS0XiYb2odma/GwelgSySs0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_py";
  version = "0.23.1-1";
  src = sources.rosidl_generator_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_cppcheck ament_cmake_flake8 ament_cmake_pep257 ament_index_python python_cmake_module rosidl_cli rosidl_generator_c rosidl_parser rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_cpplint ament_cmake_uncrustify python3Packages.numpy rmw rosidl_runtime_c rosidl_typesupport_c rosidl_typesupport_interface rpyutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}