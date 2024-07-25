{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  substituteSource,
  zstd,
}:
let
  sources = rec {
    zstd_vendor = substituteSource {
      src = fetchgit {
        name = "zstd_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "1b818bbe53159ce1600afedb156ae18d6ee1dbc7";
        hash = "sha256-2HsmENSerIbkA80VfY3ybWyilPrBhOgwRClqAH8qdXk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/facebook/zstd.git";
          to = "URL ${zstd_vendor-vendor_source-zstd-0}";
        }
      ];
    };
    zstd_vendor-vendor_source-zstd-0 = substituteSource {
      src = fetchgit {
        name = "zstd_vendor-vendor_source-zstd-0-source";
        url = "https://github.com/facebook/zstd.git";
        rev = "97a3da1df009d4dc67251de0c4b1c9d7fe286fc1";
        hash = "sha256-HN6Ykx3a7EykXC6yhB6DcDkGtN35Qf0qWZn2cl98HwU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zstd_vendor";
  version = "0.22.6-1";
  src = sources.zstd_vendor;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ zstd ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
