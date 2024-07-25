{
  ament_cmake_core,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mimick_vendor,
  performance_test_fixture,
  python3,
  rcpputils,
  rcutils,
  rosidl_cli,
  rosidl_runtime_c,
  rosidl_typesupport_fastrtps_c,
  rosidl_typesupport_interface,
  rosidl_typesupport_introspection_c,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_c = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_c-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport-release.git";
        rev = "4a771c0e27f11c4862aeafe839a3ea17bfcf3efc";
        hash = "sha256-6/6DfIZztbvcI9RZFwbrOGC14d42woKjUz4i1aGJeCM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_c";
  version = "2.0.1-1";
  src = sources.rosidl_typesupport_c;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_index_python python3 rosidl_cli ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcpputils rcutils rosidl_runtime_c rosidl_typesupport_fastrtps_c rosidl_typesupport_interface rosidl_typesupport_introspection_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
