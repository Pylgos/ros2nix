{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    mimick_vendor = substituteSource {
      src = fetchgit {
        name = "mimick_vendor-source";
        url = "https://github.com/ros2-gbp/mimick_vendor-release.git";
        rev = "bd698fbac0cdfafe4b959815876288fbdd91ebc3";
        hash = "sha256-/fP7FDLGfreoyZkQShMMUgcfiqhJ/hGtQlJYcMKvVzE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/ros2/Mimick.git";
          to = "VCS_TYPE path VCS_URL ${mimick_vendor-vendor_source-Mimick-0}";
        }
      ];
    };
    mimick_vendor-vendor_source-Mimick-0 = substituteSource {
      src = fetchgit {
        name = "mimick_vendor-vendor_source-Mimick-0-source";
        url = "https://github.com/ros2/Mimick.git";
        rev = "4dbd495e9f3d87a83c3201ef9d851e85f7133db7";
        hash = "sha256-4F3NiFxgwSOH1H5Njv0u78epF+jOzn7bUMcwuhRQznM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mimick_vendor";
  version = "0.8.0-1";
  src = sources.mimick_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
