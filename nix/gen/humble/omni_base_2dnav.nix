{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_bringup,
  omni_base_laser_sensors,
  omni_base_maps,
  ros2launch,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    omni_base_2dnav = substituteSource {
      src = fetchgit {
        name = "omni_base_2dnav-source";
        url = "https://github.com/pal-gbp/omni_base_navigation-release.git";
        rev = "a37d6a1bb936f3608fadbb8e8b5ee515f7ac867e";
        hash = "sha256-4Zn96oVsY5UF0z+9tzgXO/4DljutvlEE9vOOAaA+OlM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "omni_base_2dnav";
  version = "2.0.7-1";
  src = sources.omni_base_2dnav;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav2_bringup omni_base_laser_sensors omni_base_maps ros2launch rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
