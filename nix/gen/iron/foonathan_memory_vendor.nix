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
        rev = "fd1d420c72a5c14c9f5790bdb18f45fae0908cc5";
        hash = "sha256-moknmcpjzOWj3p5zfmvZZtNCdikbUAuTQLL7UqRfieY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/foonathan/memory.git";
          to = "URL ${librealsense2-vendor_source-memory-0}";
        }
      ];
    };
    librealsense2-vendor_source-memory-0 = substituteSource {
      src = fetchgit {
        name = "librealsense2-vendor_source-memory-0-source";
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
  version = "1.3.0-4";
  src = sources.foonathan_memory_vendor;
  nativeBuildInputs = [ git ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
