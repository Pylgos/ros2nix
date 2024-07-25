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
        rev = "796f9af81eb5797e88d35f37e49695d937f44ea4";
        hash = "sha256-N48BvvzUqrRnmZm1t1fuepittJVoE7Q+Q4avHNTEqIA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/prophesee-ai/openeb.git";
          to = "VCS_TYPE path VCS_URL ${openeb_vendor-vendor_source-openeb-0}";
        }
      ];
    };
    openeb_vendor-vendor_source-openeb-0 = substituteSource {
      src = fetchgit {
        name = "openeb_vendor-vendor_source-openeb-0-source";
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
  version = "1.0.2-1";
  src = sources.openeb_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package cmake curl git pkg-config unzip wget ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ffmpeg glew glfw3 hdf5 libusb-compat-0_1 libusb1 opencv openscenegraph protobuf python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
