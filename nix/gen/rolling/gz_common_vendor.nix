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
        rev = "970deddec0bbd88044a66465fb257c09ad4514c9";
        hash = "sha256-hqPxk89gKCD5uqvkLp0SW97jwF9vui4nu8obPM/AtWA=";
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
        rev = "84df3704bfcffb85fa476c29e6181fba55c904dd";
        hash = "sha256-vM+/V2F+Nr/LReqcMAmAbgAyaph/vMZVb0BO0MAUp6I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_common_vendor";
  version = "0.1.1-1";
  src = sources.gz_common_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp gdal gts gz_cmake_vendor gz_math_vendor gz_utils_vendor tinyxml-2 util-linux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
