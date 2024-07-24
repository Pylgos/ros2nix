{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  gz_utils_vendor,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    gz_math_vendor = substituteSource {
      src = fetchgit {
        name = "gz_math_vendor-source";
        url = "https://github.com/ros2-gbp/gz_math_vendor-release.git";
        rev = "f1a1f4ddc9755565ace5bf8994fdf198cb6c7de4";
        hash = "sha256-mv5JDoyAF8047mJFHCaW+qEffBjX4EfiyTncYAUaxiY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_math_vendor-vendor_source-gz-math-0}";
        }
      ];
    };
    gz_math_vendor-vendor_source-gz-math-0 = substituteSource {
      src = fetchgit {
        name = "gz_math_vendor-vendor_source-gz-math-0-source";
        url = "https://github.com/gazebosim/gz-math.git";
        rev = "9f5559212059871c9d1e458dcfe623a0c3667110";
        hash = "sha256-W+LAe9hn/LhecxFmmxihv/lNAGvze8w2BDj4rRVfzJo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_math_vendor";
  version = "0.0.5-1";
  src = sources.gz_math_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen gz_cmake_vendor gz_utils_vendor python3Packages.pybind11 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
