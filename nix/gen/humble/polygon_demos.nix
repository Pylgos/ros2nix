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
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    polygon_demos = substituteSource {
      src = fetchgit {
        name = "polygon_demos-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "8d8e6e477e755b5c4b04f6c48071bb05f73f8c92";
        hash = "sha256-x70C4EJov4YXvVoslWgtJitf3qqvczBaIjNp7jwFOYk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "polygon_demos";
  version = "1.0.2-1";
  src = sources.polygon_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles color_util geometry_msgs polygon_msgs polygon_rviz_plugins polygon_utils rclcpp rviz2 rviz_common rviz_default_plugins ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
