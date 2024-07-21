{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_msgs_vendor,
  gz_transport_vendor,
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
        rev = "9bfbc65098329e8517660bd7dcf02a4ac48a3a71";
        hash = "sha256-MixLUjOfR/eSA3mqa5cKocItzS6PglAJHMnehRj8s80=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_image";
  version = "1.0.0-1";
  src = sources.ros_gz_image;
  nativeBuildInputs = [ ament_cmake pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_msgs_vendor gz_transport_vendor image_transport rclcpp ros_gz_bridge sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
