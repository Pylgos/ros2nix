{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  assimp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gdal,
  gts,
  gz_cmake_vendor,
  gz_math_vendor,
  gz_utils_vendor,
  substituteSource,
  tinyxml-2,
  util-linux,
}:
let
  sources = rec {
    gz_common_vendor = substituteSource {
      src = fetchgit {
        name = "gz_common_vendor-source";
        url = "https://github.com/ros2-gbp/gz_common_vendor-release.git";
        rev = "dac2a4f1bbc25a269c0b1a290082ec5eaac46acb";
        hash = "sha256-g+C82uYpNbdkxuiALKrXgHBROl3EqSfzk5y0UrPruWw=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_common_vendor-vendor_source-gz-common-0}";
        }
      ];
    };
    gz_common_vendor-vendor_source-gz-common-0 = substituteSource {
      src = fetchgit {
        name = "gz_common_vendor-vendor_source-gz-common-0-source";
        url = "https://github.com/gazebosim/gz-common.git";
        rev = "c4bfb3b9d03f96b65418076c40bc2c48446c7e7b";
        hash = "sha256-Wc7wUbSg9ltPFWGG/YWDaobktuZOuc8a4Pc1EDNoXrY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_common_vendor";
  version = "0.0.4-1";
  src = sources.gz_common_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp gdal gts gz_cmake_vendor gz_math_vendor gz_utils_vendor tinyxml-2 util-linux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
