{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gps_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  rclpy,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    gps_tools = substituteSource {
      src = fetchgit {
        name = "gps_tools-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "0abc201c53c3e3b0ac8ed53cebdf22f9c34a70d2";
        hash = "sha256-+bW839E0UolKzA4D0kkBoqHgk4d/WmPJZLONWM/hGV0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gps_tools";
  version = "2.0.4-1";
  src = sources.gps_tools;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gps_msgs nav_msgs rclcpp rclcpp_components rclpy sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
