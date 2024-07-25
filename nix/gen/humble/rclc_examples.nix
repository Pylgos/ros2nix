{
  ament_cmake_ros,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rcl,
  rclc,
  rclc_lifecycle,
  rclc_parameter,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rclc_examples = substituteSource {
      src = fetchgit {
        name = "rclc_examples-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "d20a175c5c5a25b569270206a34eb9ff89623094";
        hash = "sha256-iXasJ5GWD/mGuALQR0YKTJ55YEdH1xKUaUWSy0JzBGw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclc_examples";
  version = "4.0.2-3";
  src = sources.rclc_examples;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces lifecycle_msgs rcl rclc rclc_lifecycle rclc_parameter std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
