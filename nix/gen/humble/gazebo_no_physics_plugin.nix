{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_ros,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    gazebo_no_physics_plugin = substituteSource {
      src = fetchgit {
        name = "gazebo_no_physics_plugin-source";
        url = "https://github.com/ros2-gbp/gazebo_no_physics_plugin-release.git";
        rev = "c25ba6596689ae642412614a9aeb00dd0102e042";
        hash = "sha256-Vjp7RR3jEbWGoMF4WTMHwle8VgMnkm65KpWvaDGWqNY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_no_physics_plugin";
  version = "0.1.1-2";
  src = sources.gazebo_no_physics_plugin;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_ros rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
