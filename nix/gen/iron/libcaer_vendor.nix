{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  libusb1,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    libcaer_vendor = substituteSource {
      src = fetchgit {
        name = "libcaer_vendor-source";
        url = "https://github.com/ros2-gbp/libcaer_vendor-release.git";
        rev = "c98e86b2d38f600f41a5b2bd43438d5713915e13";
        hash = "sha256-xTSUG1fpbNJpaeciDh8sp+P9wYzN6uVZ3dmZ6SxgkA0=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://gitlab.com/inivation/dv/libcaer.git";
          to = "VCS_TYPE path VCS_URL ${libcaer_vendor-vendor_source-libcaer-0}";
        }
      ];
    };
    libcaer_vendor-vendor_source-libcaer-0 = substituteSource {
      src = fetchgit {
        name = "libcaer_vendor-vendor_source-libcaer-0-source";
        url = "https://gitlab.com/inivation/dv/libcaer.git";
        rev = "8710e73ceb21d9fb4f74ead62ca3fae42d828997";
        hash = "sha256-aTQw4K7otT7MP6qNediqzgjqbM6Wldg6bzwBTzX34II=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libcaer_vendor";
  version = "1.2.0-1";
  src = sources.libcaer_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libusb1 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
