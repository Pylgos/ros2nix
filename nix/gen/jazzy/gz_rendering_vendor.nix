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
  glew,
  gz_cmake_vendor,
  gz_common_vendor,
  gz_math_vendor,
  gz_ogre_next_vendor,
  gz_plugin_vendor,
  gz_utils_vendor,
  ogre1_9,
  substituteSource,
  util-linux,
  vulkan-loader,
  xorg,
}:
let
  sources = rec {
    gz_rendering_vendor = substituteSource {
      src = fetchgit {
        name = "gz_rendering_vendor-source";
        url = "https://github.com/ros2-gbp/gz_rendering_vendor-release.git";
        rev = "e89bd74f9f586eb6ac4b972c65f04c9309c290fa";
        hash = "sha256-X41BHiRkFFVoA5Ua52e6ClR9giYlS2y92qiH7B4EIQk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_rendering_vendor-vendor_source-gz-rendering-0}";
        }
      ];
    };
    gz_rendering_vendor-vendor_source-gz-rendering-0 = substituteSource {
      src = fetchgit {
        name = "gz_rendering_vendor-vendor_source-gz-rendering-0-source";
        url = "https://github.com/gazebosim/gz-rendering.git";
        rev = "df019bb4c01956f0431abd9417d0c178fe56f8ac";
        hash = "sha256-TI/lGK7dRc6z/nlBKfK7gjKFNCMhgFLFJA+YuVB7Oc8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_rendering_vendor";
  version = "0.0.3-1";
  src = sources.gz_rendering_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ freeglut glew gz_cmake_vendor gz_common_vendor gz_math_vendor gz_ogre_next_vendor gz_plugin_vendor gz_utils_vendor ogre1_9 util-linux vulkan-loader xorg.libXi xorg.libXmu ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
