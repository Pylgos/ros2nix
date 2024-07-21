{
  buildPackages,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  python3,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    librealsense2-vendor_source-Catch2-0 = substituteSource {
      src = fetchgit {
        name = "librealsense2-vendor_source-Catch2-0-source";
        url = "https://github.com/catchorg/Catch2.git";
        rev = "6e79e682b726f524310d55dec8ddac4e9c52fb5f";
        hash = "sha256-DqGGfNjKPW9HFJrX9arFHyNYjB61uoL6NabZatTWrr0=";
      };
      substitutions = [
      ];
    };
    odri_master_board_sdk = substituteSource {
      src = fetchgit {
        name = "odri_master_board_sdk-source";
        url = "https://github.com/ros2-gbp/odri_master_board_sdk-release.git";
        rev = "89c6951871e6b89f5cd809eb53a14680ea70ea40";
        hash = "sha256-CcSf83I4FBj55ky6BiSf/pINL6ZbZYFZiAFrlketTuQ=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/catchorg/Catch2.git";
          to = "URL ${librealsense2-vendor_source-Catch2-0}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "odri_master_board_sdk";
  version = "1.0.6-5";
  src = sources.odri_master_board_sdk;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake git buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3 python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
