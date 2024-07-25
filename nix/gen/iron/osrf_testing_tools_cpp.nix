{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    osrf_testing_tools_cpp = substituteSource {
      src = fetchgit {
        name = "osrf_testing_tools_cpp-source";
        url = "https://github.com/ros2-gbp/osrf_testing_tools_cpp-release.git";
        rev = "f422bd33ce6536c1f269a50839a5c68e2fce6f58";
        hash = "sha256-1kOPdymAbt+CvcRbAAVfjlfiIrv5YpHWv8X0FopuLG4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "osrf_testing_tools_cpp";
  version = "1.6.0-1";
  src = sources.osrf_testing_tools_cpp;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
