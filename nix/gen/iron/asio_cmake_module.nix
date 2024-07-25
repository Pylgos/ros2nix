{
  ament_cmake,
  ament_cmake_gtest,
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
    asio_cmake_module = substituteSource {
      src = fetchgit {
        name = "asio_cmake_module-source";
        url = "https://github.com/ros2-gbp/transport_drivers-release.git";
        rev = "de0f4d9c2410f941807e3e5ef636b91a28449655";
        hash = "sha256-S4As/gOIQQTIqYgblUDPs2pjBDmLPz4Ii2/CTMHhRUs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "asio_cmake_module";
  version = "1.2.0-3";
  src = sources.asio_cmake_module;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
