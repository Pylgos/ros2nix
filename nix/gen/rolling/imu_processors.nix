{
  ament_cmake,
  ament_cmake_cpplint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    imu_processors = substituteSource {
      src = fetchgit {
        name = "imu_processors-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "96e485da4d27f0f792095ad361ce54d8cdc6e6ab";
        hash = "sha256-ShCwGu82++kzA8jDNQZHJIG8R7Av04iVDxp8sMYze2g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_processors";
  version = "0.5.0-2";
  src = sources.imu_processors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav_msgs rclcpp rclcpp_components sensor_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}