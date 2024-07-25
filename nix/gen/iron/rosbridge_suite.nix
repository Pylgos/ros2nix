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
        rev = "be714ae5933c0abec46f0cf5b1bb5aed84633e7d";
        hash = "sha256-MWpailueIvylSaPCRcXsKgmzpatxkZq+HsJMGXnMUPs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbridge_suite";
  version = "1.3.2-1";
  src = sources.rosbridge_suite;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosapi rosbridge_library rosbridge_server ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
