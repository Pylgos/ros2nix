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
        rev = "446ac182791f3c0ab3817f3b503c38954e6a0133";
        hash = "sha256-LmTgr8JI5jo23rCSvEeq6WSeCvLx/dmYpqtNx0hZ7lE=";
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
        rev = "0f0775770fd1c506fa9c5ad566bd6ba59659db66";
        hash = "sha256-nLBnxPbPKiLCFF2TJgD/eJKJJfzktVBW3SRW2m3WK/s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "foonathan_memory_vendor";
  version = "1.3.1-3";
  src = sources.foonathan_memory_vendor;
  nativeBuildInputs = [ git ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}