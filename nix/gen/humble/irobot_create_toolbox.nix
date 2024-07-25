{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    irobot_create_toolbox = substituteSource {
      src = fetchgit {
        name = "irobot_create_toolbox-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "0d9cbf3c3eb2bee3283f48fdeff9cf6537fdaa18";
        hash = "sha256-8nJ52vZWOgz0zQASJ+NkDp2Xy4C24uJYself8punurI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_toolbox";
  version = "2.1.0-1";
  src = sources.irobot_create_toolbox;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
