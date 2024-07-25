{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_plugins,
  gazebo_ros,
  gazebo_ros2_control,
  irobot_create_common_bringup,
  irobot_create_description,
  irobot_create_gazebo_plugins,
  ros2launch,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    irobot_create_gazebo_bringup = substituteSource {
      src = fetchgit {
        name = "irobot_create_gazebo_bringup-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "259863f06f25276e6ca057d2ee6fda336315e71c";
        hash = "sha256-hq3lkMLK+P/LsqHDswL/HviVpPKwi0/zeQf1zIg2yKE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_gazebo_bringup";
  version = "2.1.0-1";
  src = sources.irobot_create_gazebo_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_plugins gazebo_ros gazebo_ros2_control irobot_create_common_bringup irobot_create_description irobot_create_gazebo_plugins ros2launch ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
