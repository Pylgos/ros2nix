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
  gz_math_vendor,
  gz_tools_vendor,
  gz_utils_vendor,
  libxml2,
  python3Packages,
  substituteSource,
  tinyxml-2,
  urdfdom,
}:
let
  sources = rec {
    sdformat_vendor = substituteSource {
      src = fetchgit {
        name = "sdformat_vendor-source";
        url = "https://github.com/ros2-gbp/sdformat_vendor-release.git";
        rev = "f92ee04d69bfa685472464f2210caf9643233b96";
        hash = "sha256-QMK97zN1pPht/DPGUv1cvwMLHeqEom3kxcUsDFyorpE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sdformat_vendor-vendor_source-sdformat-0}";
        }
      ];
    };
    sdformat_vendor-vendor_source-sdformat-0 = substituteSource {
      src = fetchgit {
        name = "sdformat_vendor-vendor_source-sdformat-0-source";
        url = "https://github.com/gazebosim/sdformat.git";
        rev = "6f1c36502f1085836ab9876e26afac3238f26820";
        hash = "sha256-ua8diQBZGjr/oqblOSefzvs169pb6QmySYukj4eeqyg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sdformat_vendor";
  version = "0.1.1-1";
  src = sources.sdformat_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_cmake_vendor gz_math_vendor gz_tools_vendor gz_utils_vendor python3Packages.pybind11 tinyxml-2 urdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
