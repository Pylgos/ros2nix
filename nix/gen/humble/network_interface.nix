{
  ament_cmake_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    network_interface = substituteSource {
      src = fetchgit {
        name = "network_interface-source";
        url = "https://github.com/astuff/network_interface-release.git";
        rev = "4de617ce2a7a38da49620a34fb842022196c862f";
        hash = "sha256-bdi7PiMuO5ObykGE6q/vZ9I8wGKMmCytNkETU3hcC40=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "network_interface";
  version = "2003.1.1-2";
  src = sources.network_interface;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
