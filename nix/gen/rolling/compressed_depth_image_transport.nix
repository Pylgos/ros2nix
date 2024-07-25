{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  substituteSource,
}:
let
  sources = rec {
    compressed_depth_image_transport = substituteSource {
      src = fetchgit {
        name = "compressed_depth_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "3668da3aa11292013e0781437b7a12ebeead7fed";
        hash = "sha256-kpp3wHHQZkLto7sfY8eZlB/NZH7UMhemr7H2DGQfSgA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "compressed_depth_image_transport";
  version = "4.0.0-1";
  src = sources.compressed_depth_image_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
