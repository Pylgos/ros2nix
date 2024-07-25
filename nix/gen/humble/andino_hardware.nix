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
    andino_hardware = substituteSource {
      src = fetchgit {
        name = "andino_hardware-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "d53c25cb821880d1927334b11fb0a888f2157e61";
        hash = "sha256-ol/cNgLOX+aLzcUFpARvctrWZK/ye7aD9dm60FopQ5c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "andino_hardware";
  version = "0.1.0-1";
  src = sources.andino_hardware;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
