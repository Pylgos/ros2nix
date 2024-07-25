{
  ament_cmake,
  ament_cmake_pytest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
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
        rev = "ba0681509f9199c84ea46f845be7fd11ebd93bf9";
        hash = "sha256-vN5rH9DFy2IZhKm515RO+TjANyEq1/rlmL8y1Im84Dw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_py";
  version = "0.18.0-2";
  src = sources.rosidl_generator_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_index_python buildPackages.python3Packages.numpy python_cmake_module rmw rosidl_cli rosidl_generator_c rosidl_parser rosidl_pycommon rpyutils ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ament_index_python python3Packages.numpy python_cmake_module rmw rosidl_cli rosidl_generator_c rosidl_parser rosidl_pycommon rpyutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ rosidl_runtime_c rosidl_typesupport_c rosidl_typesupport_interface ];
}
