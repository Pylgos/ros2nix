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
    swri_prefix_tools = substituteSource {
      src = fetchgit {
        name = "swri_prefix_tools-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "f39ac7ef37a60a4ec336bd33524908e65536a2ca";
        hash = "sha256-jIsfgQqTk62YMgEfLgaJB6ee4pZm5iTGxeQZ1Vi07zY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_prefix_tools";
  version = "3.6.1-1";
  src = sources.swri_prefix_tools;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.psutil ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
