{
  ament_cmake,
  binutils,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  plotjuggler,
  python3Packages,
  qt5,
  rclcpp,
  rcpputils,
  rosbag2,
  rosbag2_transport,
  substituteSource,
  tf2_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    plotjuggler_ros = substituteSource {
      src = fetchgit {
        name = "plotjuggler_ros-source";
        url = "https://github.com/ros2-gbp/plotjuggler-ros-plugins-release.git";
        rev = "5a684640ce9f525261f5aa4aecd1afcf25b1a798";
        hash = "sha256-J52faIDgEo6CGL8TyLTf/3xfg0flEObgbOseNuXxLJI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plotjuggler_ros";
  version = "2.1.0-1";
  src = sources.plotjuggler_ros;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ binutils plotjuggler python3Packages.boost qt5.qtbase qt5.qtsvg qt5.qtwebsockets rclcpp rcpputils rosbag2 rosbag2_transport tf2_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
