{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_msgs,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    turtlebot4_cpp_tutorials = substituteSource {
      src = fetchgit {
        name = "turtlebot4_cpp_tutorials-source";
        url = "https://github.com/ros2-gbp/turtlebot4_tutorials-release.git";
        rev = "e62c275f51a351f2e3b4a8a2722490dc13765805";
        hash = "sha256-Q+4zteIz7BFWaYhq6n/KHwjisNVp3dBej6K9/A9SfiU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_cpp_tutorials";
  version = "1.0.1-1";
  src = sources.turtlebot4_cpp_tutorials;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ irobot_create_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
