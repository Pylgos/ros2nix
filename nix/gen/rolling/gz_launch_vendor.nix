{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  binutils,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gflags,
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
  gz_sim_vendor,
  gz_tools_vendor,
  gz_transport_vendor,
  libwebsockets,
  libyaml,
  sdformat_vendor,
  substituteSource,
  tinyxml-2,
  util-linux,
  wrapRosQtAppsHook,
  xorg,
}:
let
  sources = rec {
    gz_launch_vendor = substituteSource {
      src = fetchgit {
        name = "gz_launch_vendor-source";
        url = "https://github.com/ros2-gbp/gz_launch_vendor-release.git";
        rev = "7cfc7bd6fd31787d1ceabcf37b4db54061d0b43f";
        hash = "sha256-/VvcqMIzZQ+pLHRj1/GsqK6JM9oDd5KcbdOtVQnuRj0=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_launch_vendor-vendor_source-gz-launch-0}";
        }
      ];
    };
    gz_launch_vendor-vendor_source-gz-launch-0 = substituteSource {
      src = fetchgit {
        name = "gz_launch_vendor-vendor_source-gz-launch-0-source";
        url = "https://github.com/gazebosim/gz-launch.git";
        rev = "1317511d365d1b2c312c86f9062b8a4b7bfdc132";
        hash = "sha256-En3V8i/Ie8+KnSHGlm9Bap7REdLhYBaVHVbOM+/Pzno=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_launch_vendor";
  version = "0.1.0-1";
  src = sources.gz_launch_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ binutils gflags gz_cmake_vendor gz_common_vendor gz_fuel_tools_vendor gz_gui_vendor gz_math_vendor gz_msgs_vendor gz_physics_vendor gz_plugin_vendor gz_rendering_vendor gz_sensors_vendor gz_sim_vendor gz_tools_vendor gz_transport_vendor libwebsockets libyaml sdformat_vendor tinyxml-2 util-linux xorg.libXi xorg.libXmu ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
