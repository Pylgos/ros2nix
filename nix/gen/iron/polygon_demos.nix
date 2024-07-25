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
        rev = "c06b644592bccd9178c5afa930fceebb7af33e68";
        hash = "sha256-x70C4EJov4YXvVoslWgtJitf3qqvczBaIjNp7jwFOYk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "polygon_demos";
  version = "1.0.2-2";
  src = sources.polygon_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles color_util geometry_msgs polygon_msgs polygon_rviz_plugins polygon_utils rclcpp rviz2 rviz_common rviz_default_plugins ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
