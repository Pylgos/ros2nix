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
        rev = "23e9561ab298142edc8bb3a34e284237f93a395a";
        hash = "sha256-bMYgLcTRb5UvNDZS4HmtCbd1SRpRfQypQmT4SJPbONY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aws_robomaker_small_warehouse_world";
  version = "1.0.5-4";
  src = sources.aws_robomaker_small_warehouse_world;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_plugins gazebo_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
