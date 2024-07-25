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
        rev = "53bbf4ff5b039aa3e21855fccc7579a1c3434a64";
        hash = "sha256-3jdI83pa9XvFUsNQpCWB0+vk6/NJwar4VMPOv/DMxZI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plotjuggler_ros";
  version = "2.1.1-1";
  src = sources.plotjuggler_ros;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ binutils plotjuggler python3Packages.boost qt5.qtbase qt5.qtsvg qt5.qtwebsockets rclcpp rcpputils rosbag2 rosbag2_transport tf2_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
