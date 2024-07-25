{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_xmllint = substituteSource {
      src = fetchgit {
        name = "ament_cmake_xmllint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "22ecb99f41f2495b117e5efb123de8a24becb5a1";
        hash = "sha256-jhK0uDsb04nxcvNVUyJp/sAJHiLz4wFQr5NjLnPb1nY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_xmllint";
  version = "0.12.11-1";
  src = sources.ament_cmake_xmllint;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_xmllint ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
