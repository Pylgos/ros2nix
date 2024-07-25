{
  ament_cmake_auto,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_planar_move_plugin,
  joint_state_publisher_gui,
  launch,
  launch_pal,
  launch_param_builder,
  launch_ros,
  launch_testing_ament_cmake,
  pal_urdf_utils,
  realsense2_description,
  rviz2,
  substituteSource,
  urdf_test,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    omni_base_description = substituteSource {
      src = fetchgit {
        name = "omni_base_description-source";
        url = "https://github.com/pal-gbp/omni_base_robot-release.git";
        rev = "1abe68a5ed0bcfb97daa27ae4624976695b39a69";
        hash = "sha256-jgjHoQPr+y1ZqRfBA+sTZkEvUM8EMX8dI7ziBIw2mlU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "omni_base_description";
  version = "2.0.18-1";
  src = sources.omni_base_description;
  nativeBuildInputs = [ ament_cmake_auto ament_cmake_python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_planar_move_plugin joint_state_publisher_gui launch_pal launch_param_builder launch_ros pal_urdf_utils realsense2_description rviz2 xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
