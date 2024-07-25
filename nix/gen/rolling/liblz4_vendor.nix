{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    liblz4_vendor = substituteSource {
      src = fetchgit {
        name = "liblz4_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "f8fc1fdf67fba0663a2e0f07891fd05ff5467d35";
        hash = "sha256-SUqvo5Ugf2letlZvB9loFvL8oCPRgmwoBH0sHSioqQ0=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/lz4/lz4.git";
          to = "VCS_TYPE path VCS_URL ${liblz4_vendor-vendor_source-lz4-0}";
        }
      ];
    };
    liblz4_vendor-vendor_source-lz4-0 = substituteSource {
      src = fetchgit {
        name = "liblz4_vendor-vendor_source-lz4-0-source";
        url = "https://github.com/lz4/lz4.git";
        rev = "5ff839680134437dbf4678f3d0c7b371d84f4964";
        hash = "sha256-YiMCD3vvrG+oxBUghSrCmP2LAfAGZrEaKz0YoaQJhpI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "liblz4_vendor";
  version = "0.28.0-1";
  src = sources.liblz4_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}