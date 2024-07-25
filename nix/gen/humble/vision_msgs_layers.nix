{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rqt_image_overlay_layer,
  substituteSource,
  vision_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    vision_msgs_layers = substituteSource {
      src = fetchgit {
        name = "vision_msgs_layers-source";
        url = "https://github.com/ros2-gbp/vision_msgs_layers-release.git";
        rev = "c64c4ca97583e1ab6c88fbf684509da0a455a658";
        hash = "sha256-9W1+3cqmKRRcPA7B/3CZRu9TEpO7FvqXZdO/pL9M79o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vision_msgs_layers";
  version = "0.1.0-1";
  src = sources.vision_msgs_layers;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rqt_image_overlay_layer vision_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
