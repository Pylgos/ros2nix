{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  dwb_core,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_util,
  nav_2d_msgs,
  nav_2d_utils,
  pluginlib,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    dwb_plugins = substituteSource {
      src = fetchgit {
        name = "dwb_plugins-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "4c104355a19d5b6d5ae31892c13e5458404e4c74";
        hash = "sha256-kZK4LJjWStEzao9xoZejgi63MvXbaNSzQlnknep7T0Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dwb_plugins";
  version = "1.2.9-1";
  src = sources.dwb_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles dwb_core nav2_common nav2_util nav_2d_msgs nav_2d_utils pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
