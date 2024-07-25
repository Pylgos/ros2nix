{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_geometry,
  substituteSource,
}:
let
  sources = rec {
    vision_opencv = substituteSource {
      src = fetchgit {
        name = "vision_opencv-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
        rev = "8afbf806ebec6e4a2ac946458656aca0b55a6334";
        hash = "sha256-5UkhE8oToscy57WEa7I0yLTgxIElOV0q6cRoVlZLnSQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vision_opencv";
  version = "3.5.0-1";
  src = sources.vision_opencv;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_geometry ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
