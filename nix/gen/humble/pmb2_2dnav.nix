{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_bringup,
  pal_maps,
  pmb2_laser_sensors,
  ros2launch,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pmb2_2dnav = substituteSource {
      src = fetchgit {
        name = "pmb2_2dnav-source";
        url = "https://github.com/pal-gbp/pmb2_navigation-gbp.git";
        rev = "227bb8e1ce9a92e229ab6d8191e6b9016bd2b08d";
        hash = "sha256-754W8lREI5Ex3vLbp/9x0D68tB/WMqYwnRf+y//vRW8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pmb2_2dnav";
  version = "4.0.21-1";
  src = sources.pmb2_2dnav;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav2_bringup pal_maps pmb2_laser_sensors ros2launch rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
