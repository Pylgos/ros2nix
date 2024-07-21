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
  rosidl_pycommon,
  substituteSource,
}:
let
  sources = rec {
    rosidl_generator_dds_idl = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_dds_idl-source";
        url = "https://github.com/ros2-gbp/rosidl_dds-release.git";
        rev = "97af97f45b3bb41d4e49c28aa1f50a7ff48e5554";
        hash = "sha256-nJaLUL1Ey0Ie3J6YMr3sYag2w9r0FEkdrowJp1MGklY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_dds_idl";
  version = "0.11.1-3";
  src = sources.rosidl_generator_dds_idl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_index_python rosidl_cli rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}