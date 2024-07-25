{
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    cmake_generate_parameter_module_example = substituteSource {
      src = fetchgit {
        name = "cmake_generate_parameter_module_example-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "d6ca9bf14b807600f4329e8cc4fc4d273e22b536";
        hash = "sha256-fv1GUmHiJR1Zj2CI0CdtNFcUIVXuykeEmbSN9ib0fRw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cmake_generate_parameter_module_example";
  version = "0.3.8-3";
  src = sources.cmake_generate_parameter_module_example;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ generate_parameter_library rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}