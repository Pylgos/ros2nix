{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  urdfdom_headers,
}:
let
  sources = rec {
    urdf_parser_plugin = substituteSource {
      src = fetchgit {
        name = "urdf_parser_plugin-source";
        url = "https://github.com/ros2-gbp/urdf-release.git";
        rev = "226d818d5f5aa5e3f6ff21fdd1ad30e4ae3cff3e";
        hash = "sha256-zGvP4ScEKB+ZABmdjD0+AH6jBTMui65t103hBVgW4Yk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf_parser_plugin";
  version = "2.8.2-3";
  src = sources.urdf_parser_plugin;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ urdfdom_headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
