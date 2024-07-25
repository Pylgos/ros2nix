{
  ament_cmake,
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
        rev = "19fccbe3ed7b05b3e7c47d4fa10b54feca867174";
        hash = "sha256-+5qTjk3aZ0qAsKiM7xM25+C///3YOYaJqk4asyD/KfI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "compressed_depth_image_transport";
  version = "3.1.0-1";
  src = sources.compressed_depth_image_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
