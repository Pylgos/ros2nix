{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    tf2_eigen = substituteSource {
      src = fetchgit {
        name = "tf2_eigen-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "5212a37feb549f81e53002c87318f67822f21f5c";
        hash = "sha256-S7UvmiZqGbpnDdGwEekO+fhElSAk6/Xo0RogZUvE9ow=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_eigen";
  version = "0.25.7-1";
  src = sources.tf2_eigen;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
