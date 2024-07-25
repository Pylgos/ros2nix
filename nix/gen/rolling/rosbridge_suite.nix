{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosapi,
  rosbridge_library,
  rosbridge_server,
  substituteSource,
}:
let
  sources = rec {
    rosbridge_suite = substituteSource {
      src = fetchgit {
        name = "rosbridge_suite-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "4ef1885bc1236d00835567dc1c9e1ee677c59d13";
        hash = "sha256-MWpailueIvylSaPCRcXsKgmzpatxkZq+HsJMGXnMUPs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbridge_suite";
  version = "1.3.2-2";
  src = sources.rosbridge_suite;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosapi rosbridge_library rosbridge_server ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
