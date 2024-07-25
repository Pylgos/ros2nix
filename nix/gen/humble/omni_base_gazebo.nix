{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_plugins,
  gazebo_ros,
  gazebo_ros2_control,
  launch_pal,
  omni_base_2dnav,
  omni_base_bringup,
  omni_base_controller_configuration,
  omni_base_description,
  pal_gazebo_plugins,
  pal_gazebo_worlds,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    omni_base_gazebo = substituteSource {
      src = fetchgit {
        name = "omni_base_gazebo-source";
        url = "https://github.com/pal-gbp/omni_base_simulation-release.git";
        rev = "1da580b52a666ee22b764849824e546cb973b0cb";
        hash = "sha256-BxwNl/0zpLDc9nLEhQyKW0GVS3rVaQSCDR10C6cWqM8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "omni_base_gazebo";
  version = "2.0.3-1";
  src = sources.omni_base_gazebo;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_plugins gazebo_ros gazebo_ros2_control launch_pal omni_base_2dnav omni_base_bringup omni_base_controller_configuration omni_base_description pal_gazebo_plugins pal_gazebo_worlds ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
