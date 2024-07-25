{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_constraints,
  fuse_core,
  fuse_graphs,
  fuse_msgs,
  fuse_variables,
  geometry_msgs,
  nav_msgs,
  pluginlib,
  rclcpp,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    fuse_publishers = substituteSource {
      src = fetchgit {
        name = "fuse_publishers-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "a582456263181baac93469fe854c213e7378612f";
        hash = "sha256-7omFoZW4EJNjWK2wZiCyvYTPfaMvKrsI5opHtZnmh0E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_publishers";
  version = "1.0.1-4";
  src = sources.fuse_publishers;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fuse_core fuse_msgs fuse_variables geometry_msgs nav_msgs pluginlib rclcpp tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
