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
        rev = "93a04595382b5fef7174e699c40363c187f5cf03";
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
