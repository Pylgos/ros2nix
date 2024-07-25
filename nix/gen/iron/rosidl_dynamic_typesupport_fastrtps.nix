{
  ament_cmake_ros,
  buildRosPackage,
  fastcdr,
  fastrtps,
  fastrtps_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  rcutils,
  rosidl_dynamic_typesupport,
  substituteSource,
}:
let
  sources = rec {
    rosidl_dynamic_typesupport_fastrtps = substituteSource {
      src = fetchgit {
        name = "rosidl_dynamic_typesupport_fastrtps-source";
        url = "https://github.com/ros2-gbp/rosidl_dynamic_typesupport_fastrtps-release.git";
        rev = "2cf086ddfc3aae2d5b11a3b210c30b5e936f9886";
        hash = "sha256-QB0ehBMYDvPyBNeS68ZZ22mw5UUplmyg3Q+hHKl0CFg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_dynamic_typesupport_fastrtps";
  version = "0.0.2-2";
  src = sources.rosidl_dynamic_typesupport_fastrtps;
  nativeBuildInputs = [ ament_cmake_ros fastrtps_cmake_module ];
  propagatedNativeBuildInputs = [ rosidl_dynamic_typesupport ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fastcdr fastrtps rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
