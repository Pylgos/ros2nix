{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_copyright,
  ament_flake8,
  ament_pep257,
  as2_core,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rclcpp,
  ros_gz_bridge,
  ros_gz_sim,
  sensor_msgs,
  substituteSource,
  tf2_msgs,
  tf2_ros,
}:
let
  sources = rec {
    as2_gazebo_assets = substituteSource {
      src = fetchgit {
        name = "as2_gazebo_assets-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "f4b8db1d1f2f44ee50405d379e170509b1f76343";
        hash = "sha256-Us8i6n21F1jRFa9qP5prGX5ZCTVsrQge9HbmejYjbWk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_gazebo_assets";
  version = "1.0.9-1";
  src = sources.as2_gazebo_assets;
  nativeBuildInputs = [ ament_cmake ament_cmake_pytest ament_cmake_python ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.jinja2 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_core geometry_msgs rclcpp ros_gz_bridge ros_gz_sim sensor_msgs tf2_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
