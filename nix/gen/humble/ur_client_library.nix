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
        rev = "2dee6f834a735149cffe57fb13ff11c57999fc4f";
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
