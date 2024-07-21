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
        rev = "add2e5a2002981b0b5ff89d4a258cce150e8241f";
        hash = "sha256-Hcyl+RxJjbYOH+rjkk7RIL0EB/KFOhE3Sc3fSG/LplE=";
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
        rev = "6d3672cf3ba437c6c17608a1c960fcfac93040b0";
        hash = "sha256-Fz8xWC55IOB7hAGck+8exu81qb01vqUS1K7izuPmo0A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sdformat_vendor";
  version = "0.0.4-1";
  src = sources.sdformat_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_cmake_vendor gz_math_vendor gz_tools_vendor gz_utils_vendor python3Packages.pybind11 tinyxml-2 urdfdom ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
