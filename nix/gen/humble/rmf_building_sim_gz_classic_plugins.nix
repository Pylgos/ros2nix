{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_dev,
  gazebo_ros,
  menge_vendor,
  opencv,
  qt5,
  rclcpp,
  rmf_building_sim_common,
  rmf_fleet_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_building_sim_gz_classic_plugins = substituteSource {
      src = fetchgit {
        name = "rmf_building_sim_gz_classic_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "d10cf40cab0ab82c32e03fa3504403069c3e9148";
        hash = "sha256-C1wzH+W9KtDM2d8UGbQAL83EBgmBRJa3A4tYo8mGUnw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_building_sim_gz_classic_plugins";
  version = "2.0.2-1";
  src = sources.rmf_building_sim_gz_classic_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_dev gazebo_ros menge_vendor opencv qt5.qtbase rclcpp rmf_building_sim_common rmf_fleet_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
