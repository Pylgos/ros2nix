{
  ament_cmake,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  python3,
  python3Packages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mavlink = substituteSource {
      src = fetchgit {
        name = "mavlink-source";
        url = "https://github.com/ros2-gbp/mavlink-gbp-release.git";
        rev = "2cdf892c4865a4503bddc3d4912444ba608f54b2";
        hash = "sha256-eMcLVGZW3EwpEMSzXTtwesNUPH1veBpJQRE0DEAaQC4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mavlink";
  version = "2024.6.6-1";
  src = sources.mavlink;
  nativeBuildInputs = [ ament_cmake cmake ros_environment ];
  propagatedNativeBuildInputs = [ python3 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.future python3Packages.lxml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
