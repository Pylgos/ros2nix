{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  freeglut,
  gbenchmark,
  glew,
  gz_cmake_vendor,
  gz_common_vendor,
  gz_fuel_tools_vendor,
  gz_gui_vendor,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_physics_vendor,
  gz_plugin_vendor,
  gz_rendering_vendor,
  gz_sensors_vendor,
  gz_tools_vendor,
  gz_transport_vendor,
  gz_utils_vendor,
  protobuf,
  python3Packages,
  qt5,
  sdformat_vendor,
  substituteSource,
  tinyxml-2,
  util-linux,
  wrapRosQtAppsHook,
  xorg,
}:
let
  sources = rec {
    gz_sim_vendor = substituteSource {
      src = fetchgit {
        name = "gz_sim_vendor-source";
        url = "https://github.com/ros2-gbp/gz_sim_vendor-release.git";
        rev = "32e521b1e6d755f0be80f21d5bf889aa6097e286";
        hash = "sha256-Wt+uY21jWBllaClDEypMjjI5Fq1lqX7YbONJkbE5zcM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_sim_vendor-vendor_source-gz-sim-0}";
        }
      ];
    };
    gz_sim_vendor-vendor_source-gz-sim-0 = substituteSource {
      src = fetchgit {
        name = "gz_sim_vendor-vendor_source-gz-sim-0-source";
        url = "https://github.com/gazebosim/gz-sim.git";
        rev = "dc3fb1124fa58439abaec56f1301bb70a3ec7852";
        hash = "sha256-yvI6CvmSHhWX/lT38T05oYwyEUK98B5bFol/jZLBDNU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_sim_vendor";
  version = "0.0.3-1";
  src = sources.gz_sim_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gbenchmark ];
  buildInputs = [  ];
  propagatedBuildInputs = [ freeglut glew gz_cmake_vendor gz_common_vendor gz_fuel_tools_vendor gz_gui_vendor gz_math_vendor gz_msgs_vendor gz_physics_vendor gz_plugin_vendor gz_rendering_vendor gz_sensors_vendor gz_tools_vendor gz_transport_vendor gz_utils_vendor protobuf python3Packages.pybind11 qt5.qtbase qt5.qtdeclarative sdformat_vendor tinyxml-2 util-linux xorg.libXi xorg.libXmu ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
