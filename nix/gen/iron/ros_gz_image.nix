{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  pkg-config,
  rclcpp,
  ros_gz_bridge,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    ros_gz_image = substituteSource {
      src = fetchgit {
        name = "ros_gz_image-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "2d30ccf881ed13af098c1db90dbcd1f0ca37a6bd";
        hash = "sha256-BQbaaxP+UMu7G5PLPm0RHDFtopG4EtjpnETSUzU41UI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_image";
  version = "0.254.1-1";
  src = sources.ros_gz_image;
  nativeBuildInputs = [ ament_cmake pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ image_transport rclcpp ros_gz_bridge sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
