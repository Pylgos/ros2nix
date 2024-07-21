{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  cmake,
  curl,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg,
  git,
  glew,
  glfw3,
  gtest,
  hdf5,
  libusb-compat-0_1,
  libusb1,
  opencv,
  openscenegraph,
  pkg-config,
  protobuf,
  python3Packages,
  substituteSource,
  unzip,
  wget,
}:
let
  sources = rec {
    openeb_vendor = substituteSource {
      src = fetchgit {
        name = "openeb_vendor-source";
        url = "https://github.com/ros2-gbp/openeb_vendor-release.git";
        rev = "22386ba13272c88122433d96beb7e66c5eafe49b";
        hash = "sha256-FrogLrgo3JfoRC+Si2YPRBLgLBwzDer0agYmaVr6Q8o=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/prophesee-ai/openeb.git";
          to = "VCS_TYPE path VCS_URL ${openeb_vendor-vendor_source0}";
        }
      ];
    };
    openeb_vendor-vendor_source0 = substituteSource {
      src = fetchgit {
        name = "openeb_vendor-vendor_source0-source";
        url = "https://github.com/prophesee-ai/openeb.git";
        rev = "112dd6eee7ce11e97d6f8994a87c9d6324538a3c";
        hash = "sha256-Q0ZbldyxOYysii+ObizUQS5FvMANXbOaX0K7JsvwDU0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "openeb_vendor";
  version = "1.3.2-1";
  src = sources.openeb_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package cmake curl git pkg-config unzip wget ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ffmpeg glew glfw3 hdf5 libusb-compat-0_1 libusb1 opencv openscenegraph protobuf python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
