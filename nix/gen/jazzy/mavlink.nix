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
        rev = "1ebc30fddf3bc7bc55237f144a262f09f9240c90";
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
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake cmake python3 ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.future python3Packages.lxml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
