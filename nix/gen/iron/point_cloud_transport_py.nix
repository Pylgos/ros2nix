{
  ament_cmake_python,
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  point_cloud_transport,
  pybind11_vendor,
  python_cmake_module,
  rclcpp,
  rpyutils,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    point_cloud_transport_py = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_py-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport-release.git";
        rev = "71cc0065688933547b8d4a65dab1a7604512d822";
        hash = "sha256-hlgF4EszFZ6/czXd6TPDTB0RZpVID0fVrS5LiMYx99E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_transport_py";
  version = "2.0.6-1";
  src = sources.point_cloud_transport_py;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros python_cmake_module ];
  propagatedNativeBuildInputs = [ rpyutils ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib point_cloud_transport pybind11_vendor rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
