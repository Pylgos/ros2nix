{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu_complementary_filter,
  imu_filter_madgwick,
  rviz_imu_plugin,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    imu_tools = substituteSource {
      src = fetchgit {
        name = "imu_tools-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "041044c2bd2f2f528ecc01ebf4b754b586baf122";
        hash = "sha256-sHoAl+cZacCjp1mSpqicVfhS+MZrLIE3WiUG4wmg6c8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_tools";
  version = "2.1.4-1";
  src = sources.imu_tools;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ imu_complementary_filter imu_filter_madgwick rviz_imu_plugin ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
