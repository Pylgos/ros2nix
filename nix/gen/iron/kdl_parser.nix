{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  orocos_kdl_vendor,
  rcutils,
  substituteSource,
  urdf,
  urdfdom_headers,
}:
let
  sources = rec {
    kdl_parser = substituteSource {
      src = fetchgit {
        name = "kdl_parser-source";
        url = "https://github.com/ros2-gbp/kdl_parser-release.git";
        rev = "941750d8670fc4a9725e7db30ba33bad3814d6d9";
        hash = "sha256-ds1/cWLkUW1RdPnA+Z3Uoi5dc370hj+MB2sX3E6XlVM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kdl_parser";
  version = "2.9.0-3";
  src = sources.kdl_parser;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ orocos_kdl_vendor rcutils urdf urdfdom_headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
