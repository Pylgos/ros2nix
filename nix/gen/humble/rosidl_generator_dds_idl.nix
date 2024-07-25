{
  ament_cmake,
  ament_cmake_pytest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_cli,
  rosidl_cmake,
  substituteSource,
}:
let
  sources = rec {
    rosidl_generator_dds_idl = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_dds_idl-source";
        url = "https://github.com/ros2-gbp/rosidl_dds-release.git";
        rev = "36a89f4b5e5b9e1deee03da9cb80b7aa4763b644";
        hash = "sha256-UbHyVv/Xq0JbRDATE+abOq2ictJ0GXQ/mufIPF8i8A8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_dds_idl";
  version = "0.8.1-2";
  src = sources.rosidl_generator_dds_idl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_index_python rosidl_cli rosidl_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
