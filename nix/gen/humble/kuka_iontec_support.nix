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
    kuka_iontec_support = substituteSource {
      src = fetchgit {
        name = "kuka_iontec_support-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "f49c0e33fb51efc21b037da2ff05a21186924fdb";
        hash = "sha256-+Ttv3tauTbklqZ2jx1ucN83nTXrTIslZmWcjnhiOcPw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_iontec_support";
  version = "0.9.0-2";
  src = sources.kuka_iontec_support;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui kuka_resources launch_ros robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
