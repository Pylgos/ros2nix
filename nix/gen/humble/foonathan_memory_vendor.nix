{
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_xmllint,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  substituteSource,
}:
let
  sources = rec {
    foonathan_memory_vendor = substituteSource {
      src = fetchgit {
        name = "foonathan_memory_vendor-source";
        url = "https://github.com/ros2-gbp/foonathan_memory_vendor-release.git";
        rev = "1cf70fe6d74f7fc0f536aab4ba0bf7c1cc0d852c";
        hash = "sha256-0DgqmgXZ9PpV/sf51//kHGZGB6L/VNySZf+o8dWcCE4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/foonathan/memory.git";
          to = "URL ${foonathan_memory_vendor-vendor_source-memory-0}";
        }
      ];
    };
    foonathan_memory_vendor-vendor_source-memory-0 = substituteSource {
      src = fetchgit {
        name = "foonathan_memory_vendor-vendor_source-memory-0-source";
        url = "https://github.com/foonathan/memory.git";
        rev = "19ab0759c7f053d88657c0eb86d879493f784d61";
        hash = "sha256-AnSigXKL5b16b9TOGgpRpUc3SJzQfYhNhygm6Y8XLVA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "foonathan_memory_vendor";
  version = "1.2.0-3";
  src = sources.foonathan_memory_vendor;
  nativeBuildInputs = [ git ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
