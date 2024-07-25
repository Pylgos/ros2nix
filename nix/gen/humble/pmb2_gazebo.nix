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
  pal_gazebo_plugins,
  pal_gazebo_worlds,
  pmb2_2dnav,
  pmb2_bringup,
  pmb2_description,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pmb2_gazebo = substituteSource {
      src = fetchgit {
        name = "pmb2_gazebo-source";
        url = "https://github.com/pal-gbp/pmb2_simulation-release.git";
        rev = "6e676f2f41f71f6b36a15c03ed128d398b596d5a";
        hash = "sha256-OFemFslslNt1SVyXOEmoyYV4hPIa5WSC0ToYeRv4TPM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pmb2_gazebo";
  version = "4.0.14-1";
  src = sources.pmb2_gazebo;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_plugins gazebo_ros gazebo_ros2_control launch_pal pal_gazebo_plugins pal_gazebo_worlds pmb2_2dnav pmb2_bringup pmb2_description ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
