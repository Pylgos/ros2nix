{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  asio,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nlohmann_json,
  openssl,
  rclcpp,
  rclcpp_components,
  resource_retriever,
  ros_environment,
  rosgraph_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  websocketpp,
  zlib,
}:
let
  sources = rec {
    foxglove_bridge = substituteSource {
      src = fetchgit {
        name = "foxglove_bridge-source";
        url = "https://github.com/ros2-gbp/foxglove_bridge-release.git";
        rev = "a4041887f727a49f2f36634c39ae9dc93eed362c";
        hash = "sha256-sHoOCw7W4xLs/4wgqXsIZQtJDKN341E/+fdTtQaQlDQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "foxglove_bridge";
  version = "0.7.7-1";
  src = sources.foxglove_bridge;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ asio nlohmann_json openssl rclcpp rclcpp_components resource_retriever rosgraph_msgs websocketpp zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
