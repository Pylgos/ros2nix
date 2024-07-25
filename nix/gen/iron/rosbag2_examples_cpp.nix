{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosbag2_cpp,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_examples_cpp = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "2414da9982560aa259b640bc6172240c26508d23";
        hash = "sha256-lrJQVnEXv+gcABvwqC0VQawm1AAVfNWpYdkujPkxKAk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_examples_cpp";
  version = "0.22.6-1";
  src = sources.rosbag2_examples_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclcpp rosbag2_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
