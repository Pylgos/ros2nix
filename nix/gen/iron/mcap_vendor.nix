{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  substituteSource,
  zstd_vendor,
}:
let
  sources = rec {
    mcap_vendor = substituteSource {
      src = fetchgit {
        name = "mcap_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "cc458a5369c82f488bb96cc5d24a026af4bea01b";
        hash = "sha256-PI0Q+pu0C8yh61plKy3cbjEXaXcBorKC9o2tghSR36E=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/lz4/lz4.git";
          to = "URL ${mcap_vendor-vendor_source-lz4-1}";
        }
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v0.8.0.tar.gz";
          to = "URL ${mcap_vendor-vendor_source-v0-0}";
        }
      ];
    };
    mcap_vendor-vendor_source-lz4-1 = substituteSource {
      src = fetchgit {
        name = "mcap_vendor-vendor_source-lz4-1-source";
        url = "https://github.com/lz4/lz4.git";
        rev = "d44371841a2f1728a3f36839fd4b7e872d0927d3";
        hash = "sha256-f7GZgOzUrkAfw1mqwlIKQQqDvkvIahGlHvq6AL+aAvA=";
      };
      substitutions = [
      ];
    };
    mcap_vendor-vendor_source-v0-0 = substituteSource {
      src = fetchzip {
        name = "mcap_vendor-vendor_source-v0-0-source";
        url = "https://github.com/foxglove/mcap/archive/refs/tags/releases/cpp/v0.8.0.tar.gz";
        hash = "sha256-cbUuXSRtYKGw0kIObCayG8q8EGaRn8PTls3ZvaxKblw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mcap_vendor";
  version = "0.22.6-1";
  src = sources.mcap_vendor;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ zstd_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
