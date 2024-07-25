{
  abseil-cpp,
  ament_cmake,
  buildRosPackage,
  cartographer,
  cartographer_ros,
  cartographer_ros_msgs,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  python3Packages,
  rclcpp,
  rviz_common,
  rviz_ogre_vendor,
  rviz_rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    cartographer_rviz = substituteSource {
      src = fetchgit {
        name = "cartographer_rviz-source";
        url = "https://github.com/ros2-gbp/cartographer_ros-release.git";
        rev = "ef82c9d112b4dbf2c30fe42eb7e5426ef0c2fbe5";
        hash = "sha256-SYLs4HwfMyRxFT3r+b1js6dWZnlU1+/g6eKDIXxXKLg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cartographer_rviz";
  version = "2.0.9002-1";
  src = sources.cartographer_rviz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ abseil-cpp cartographer cartographer_ros cartographer_ros_msgs eigen pluginlib python3Packages.boost rclcpp rviz_common rviz_ogre_vendor rviz_rendering ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
