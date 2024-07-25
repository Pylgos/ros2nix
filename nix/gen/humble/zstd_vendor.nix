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
        rev = "0053da5937169c6beffefca9d06c89c2cce3a3c9";
        hash = "sha256-UKcmwWD88n6ItYw6GLbEVte0KKkAt9Cxc+5cKj7uKNg=";
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
        rev = "10f0e6993f9d2f682da6d04aa2385b7d53cbb4ee";
        hash = "sha256-pGwxFsztrO8E5m7w2Oa/GiiLwr+YKmnpooKjShrKx34=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zstd_vendor";
  version = "0.15.11-1";
  src = sources.zstd_vendor;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ zstd ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
