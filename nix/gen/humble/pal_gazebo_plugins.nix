{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  control_toolbox,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_dev,
  gazebo_msgs,
  gazebo_ros,
  nav_msgs,
  rclcpp,
  std_msgs,
  substituteSource,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    pal_gazebo_plugins = substituteSource {
      src = fetchgit {
        name = "pal_gazebo_plugins-source";
        url = "https://github.com/pal-gbp/pal_gazebo_plugins-release.git";
        rev = "0581b20d9be71e58bd9e0e5531f78ff87e310d80";
        hash = "sha256-GL/et5m0X5qTLUqg84MSOT7SVZgWLTnpoPOYdYvUXoA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_gazebo_plugins";
  version = "4.0.5-1";
  src = sources.pal_gazebo_plugins;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_toolbox gazebo_dev gazebo_msgs gazebo_ros nav_msgs rclcpp std_msgs tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
