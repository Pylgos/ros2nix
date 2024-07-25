{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  generate_parameter_library,
  moveit_core,
  moveit_resources_panda_moveit_config,
  pluginlib,
  rclcpp,
  rsl,
  substituteSource,
  tf2_geometry_msgs,
  tf2_kdl,
  tl_expected,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pick_ik = substituteSource {
      src = fetchgit {
        name = "pick_ik-source";
        url = "https://github.com/ros2-gbp/pick_ik-release.git";
        rev = "0f84171a76bb1da5eb047dfef7bcaf7c27b87cdd";
        hash = "sha256-TKEKv9lclKHQqUyAVLAw2f8hI+p0lV4m8xLdNCeqBYA=";
      };
      substitutions = [
        {
          path = "cmake/FindCatch2.cmake";
          from = "GIT_REPOSITORY https://github.com/catchorg/Catch2.git";
          to = "URL ${pick_ik-vendor_source-Catch2-0}";
        }
      ];
    };
    pick_ik-vendor_source-Catch2-0 = substituteSource {
      src = fetchgit {
        name = "pick_ik-vendor_source-Catch2-0-source";
        url = "https://github.com/catchorg/Catch2.git";
        rev = "7818e2666d5cc7bb1d912acb22b68f6669b74520";
        hash = "sha256-IqTzKPR/RA1uphsr4n5/LfxJNS37I8IFRmMMF/DfBH0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pick_ik";
  version = "1.1.0-3";
  src = sources.pick_ik;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmt generate_parameter_library moveit_core pluginlib rclcpp rsl tf2_geometry_msgs tf2_kdl tl_expected ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}