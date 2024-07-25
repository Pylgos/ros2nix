{
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
        rev = "4eb29777669c335eafc1ea4664cdb3ed5e4b9880";
        hash = "sha256-JlyZxZY3C7AYQawxE/f0lwcAO0a15WccwufPv76ONOY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kdl_parser";
  version = "2.6.4-1";
  src = sources.kdl_parser;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ orocos_kdl_vendor rcutils urdf urdfdom_headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
