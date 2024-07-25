{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  asio,
  asio_cmake_module,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  std_msgs,
  substituteSource,
  udp_msgs,
}:
let
  sources = rec {
    io_context = substituteSource {
      src = fetchgit {
        name = "io_context-source";
        url = "https://github.com/ros2-gbp/transport_drivers-release.git";
        rev = "2530cc7d3f02b66701f9ca718a581f1f93032641";
        hash = "sha256-RINF/bmOZEexBa8eMAkn2J1r1NOrze8SI3fx1t/ywak=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "io_context";
  version = "1.2.0-3";
  src = sources.io_context;
  nativeBuildInputs = [ ament_cmake_auto asio_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ asio rclcpp std_msgs udp_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
