{
  ament_cmake,
  angles,
  buildRosPackage,
  color_util,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  polygon_msgs,
  polygon_rviz_plugins,
  polygon_utils,
  rclcpp,
  rviz2,
  rviz_common,
  rviz_default_plugins,
  substituteSource,
}:
let
  sources = rec {
    polygon_demos = substituteSource {
      src = fetchgit {
        name = "polygon_demos-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "6376a68a6d934f8f5482598ba2a38f5179cce13b";
        hash = "sha256-x70C4EJov4YXvVoslWgtJitf3qqvczBaIjNp7jwFOYk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "polygon_demos";
  version = "1.0.2-3";
  src = sources.polygon_demos;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles color_util geometry_msgs polygon_msgs polygon_rviz_plugins polygon_utils rclcpp rviz2 rviz_common rviz_default_plugins ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}