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
        rev = "715a95da11f360379ee294ae1c2b64e7e457c8df";
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
