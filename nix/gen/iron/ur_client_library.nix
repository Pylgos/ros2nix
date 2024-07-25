{
  ament_cmake,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ur_client_library = substituteSource {
      src = fetchgit {
        name = "ur_client_library-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_Client_Library-release.git";
        rev = "cb204e409925c8048ad23bdd5d8fb7e8b5ac3b28";
        hash = "sha256-ZtZ7wH2xmYhDXoGeeIA30rqkhK9iiy0RK2bOZDD27kY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_client_library";
  version = "1.3.7-1";
  src = sources.ur_client_library;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
