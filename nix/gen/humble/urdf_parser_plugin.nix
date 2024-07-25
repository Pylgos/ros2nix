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
        rev = "ec11cfc4a436b162e092fb9486b3c055de5d93ea";
        hash = "sha256-IndBEHqwYnUahPk9aQnJETRqOPeKT7zRR2upZN3pWR4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf_parser_plugin";
  version = "2.6.0-2";
  src = sources.urdf_parser_plugin;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ urdfdom_headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
