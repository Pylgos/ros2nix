{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_command_line = substituteSource {
      src = fetchgit {
        name = "ecl_command_line-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "f9f941661ee74e5aea6ea8015798ca4f7a7f6fbd";
        hash = "sha256-0rOoPXNkY6U26dMB39t2IjB44typZqO4T5rW2jrEOl8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_command_line";
  version = "1.2.1-5";
  src = sources.ecl_command_line;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
