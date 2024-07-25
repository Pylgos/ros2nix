{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher_gui,
  kuka_resources,
  launch_ros,
  launch_testing_ament_cmake,
  robot_state_publisher,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    kuka_quantec_support = substituteSource {
      src = fetchgit {
        name = "kuka_quantec_support-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "ca5badc114dc6dbc96d0425b286298d9844cecea";
        hash = "sha256-PkLr9zFFkzcA0BWkn/EDuZAM7Aa2ACVGZx0svA2cG1w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_quantec_support";
  version = "0.9.0-2";
  src = sources.kuka_quantec_support;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui kuka_resources launch_ros robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
