{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  composition_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rcl_interfaces,
  rclcpp_components,
  rclpy,
  ros2cli,
  ros2node,
  ros2param,
  ros2pkg,
  substituteSource,
}:
let
  sources = rec {
    ros2component = substituteSource {
      src = fetchgit {
        name = "ros2component-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "bb290d03b0273ce898c755d5a6dbbc3378cdf3a7";
        hash = "sha256-PNzy2zGaqhSvcj+FEpSVFx0WYJCfBDoNAQGP30maQFo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2component";
  version = "0.34.0-1";
  src = sources.ros2component;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ composition_interfaces rcl_interfaces rclcpp_components rclpy ros2cli ros2node ros2param ros2pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
