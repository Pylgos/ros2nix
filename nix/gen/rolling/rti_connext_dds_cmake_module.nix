{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rti_connext_dds_cmake_module = substituteSource {
      src = fetchgit {
        name = "rti_connext_dds_cmake_module-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "6d9e71deeb4da1a8e209d7d260fb99c79c71a048";
        hash = "sha256-3ZPhtpnspWseEv9D/zShpnrLZX1cwbDxJYKgFjG9SMg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rti_connext_dds_cmake_module";
  version = "0.24.0-1";
  src = sources.rti_connext_dds_cmake_module;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
