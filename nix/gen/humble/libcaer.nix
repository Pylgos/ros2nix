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
        rev = "0d8bc0a1927052796e61bdaf21bd76ed90e2802b";
        hash = "sha256-odNkkpoKh3vbUuP2b4P+qZttkswDX5FWdRqNcMcs8/c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libcaer";
  version = "1.1.2-2";
  src = sources.libcaer;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libusb1 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
