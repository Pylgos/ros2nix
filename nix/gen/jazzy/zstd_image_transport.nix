{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  substituteSource,
  zlib,
}:
let
  sources = rec {
    zstd_image_transport = substituteSource {
      src = fetchgit {
        name = "zstd_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "a41debc5378078af711e2f5068bcac5a59a9faab";
        hash = "sha256-PRNU4i/9CZjLK+jMkRkB/40VWLK7sx0Mu6j7qyLcjXE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zstd_image_transport";
  version = "4.0.0-2";
  src = sources.zstd_image_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ image_transport zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
