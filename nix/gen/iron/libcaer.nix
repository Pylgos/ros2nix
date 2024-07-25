{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  libusb1,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    libcaer = substituteSource {
      src = fetchgit {
        name = "libcaer-source";
        url = "https://github.com/ros2-gbp/libcaer-release.git";
        rev = "7e6eda3a42cc58c4428f581e06cf2ebc6dce3a5b";
        hash = "sha256-03uHED0CSaYOtbDUhhhpN1VGLki6og+r0pV8XVFLRFY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libcaer";
  version = "1.2.2-1";
  src = sources.libcaer;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libusb1 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
