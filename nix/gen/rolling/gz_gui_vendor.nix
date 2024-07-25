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
  gz_cmake_vendor,
  gz_common_vendor,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_plugin_vendor,
  gz_rendering_vendor,
  gz_tools_vendor,
  gz_transport_vendor,
  gz_utils_vendor,
  protobuf,
  qt5,
  substituteSource,
  tinyxml-2,
  wrapRosQtAppsHook,
  xorg,
}:
let
  sources = rec {
    gz_gui_vendor = substituteSource {
      src = fetchgit {
        name = "gz_gui_vendor-source";
        url = "https://github.com/ros2-gbp/gz_gui_vendor-release.git";
        rev = "9b12c066872fcf6344cc3546034b84cd555e66a6";
        hash = "sha256-nowEUcbamiLLblLqRg+0ENJQr8e1hwUOgnI81B9vkIc=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_gui_vendor-vendor_source-gz-gui-0}";
        }
      ];
    };
    gz_gui_vendor-vendor_source-gz-gui-0 = substituteSource {
      src = fetchgit {
        name = "gz_gui_vendor-vendor_source-gz-gui-0-source";
        url = "https://github.com/gazebosim/gz-gui.git";
        rev = "ac851e62862a9812a117c2f3913de992003cd7e5";
        hash = "sha256-heYeY6yZrCi8HTrYbgPiJ2/EKpoSfyEE2FNzzGjnTgI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_gui_vendor";
  version = "0.1.0-1";
  src = sources.gz_gui_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_cmake_vendor gz_common_vendor gz_math_vendor gz_msgs_vendor gz_plugin_vendor gz_rendering_vendor gz_tools_vendor gz_transport_vendor gz_utils_vendor protobuf qt5.qtbase qt5.qtdeclarative tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
