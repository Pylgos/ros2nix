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
        rev = "6f8a82e68987507ce64d9284d626a75251821fa6";
        hash = "sha256-8EqJgl2thYD8zb4ms27wam8O0bMlEMvwFnAIgozFBEE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_building_sim_gz_classic_plugins";
  version = "2.1.2-1";
  src = sources.rmf_building_sim_gz_classic_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_dev gazebo_ros menge_vendor opencv qt5.qtbase rclcpp rmf_building_sim_common rmf_fleet_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
