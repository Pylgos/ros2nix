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
        rev = "0e3f02019767400f241becf544855592c9b8ef39";
        hash = "sha256-RrYQwyzEHHMMxiKhzO5bghVHK3+VbXPjFWUfFp/V1G8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_dds_idl";
  version = "0.10.1-3";
  src = sources.rosidl_generator_dds_idl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_index_python rosidl_cli rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
