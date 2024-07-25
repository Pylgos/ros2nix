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
        rev = "4612473f8c91c0485f3a31ee7adc632c2f7b9204";
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
