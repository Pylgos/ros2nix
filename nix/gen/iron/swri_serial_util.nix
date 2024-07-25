{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    swri_serial_util = substituteSource {
      src = fetchgit {
        name = "swri_serial_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "23cea662fe2d2e844a68252bd1a5bd3be61ca19e";
        hash = "sha256-MtfpNlZ7vE6gIf3Fg5rtl/4sDegKFpKiyBrIFCwXJy8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_serial_util";
  version = "3.6.1-1";
  src = sources.swri_serial_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
