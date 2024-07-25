{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rmf_demos_assets = substituteSource {
      src = fetchgit {
        name = "rmf_demos_assets-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "26fc620cbddafca3d9f1c8e25d17a4c702a1a5c7";
        hash = "sha256-VsIJqUNdINgbYyJsjQxClBrPuvKaBBu9euUTLv+Ez2o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_demos_assets";
  version = "2.4.0-1";
  src = sources.rmf_demos_assets;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}