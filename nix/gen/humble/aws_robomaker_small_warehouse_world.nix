{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_plugins,
  gazebo_ros,
  substituteSource,
}:
let
  sources = rec {
    aws_robomaker_small_warehouse_world = substituteSource {
      src = fetchgit {
        name = "aws_robomaker_small_warehouse_world-source";
        url = "https://github.com/ros2-gbp/aws_robomaker_small_warehouse_world-release.git";
        rev = "f9c9070e9cd91a1427854905bb1f46810f66d37d";
        hash = "sha256-bMYgLcTRb5UvNDZS4HmtCbd1SRpRfQypQmT4SJPbONY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aws_robomaker_small_warehouse_world";
  version = "1.0.5-1";
  src = sources.aws_robomaker_small_warehouse_world;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_plugins gazebo_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
