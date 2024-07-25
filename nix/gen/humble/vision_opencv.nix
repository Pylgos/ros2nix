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
        rev = "8364932004c41f4adb1aa21eb65acdb98f723557";
        hash = "sha256-epbel3Hxg9Q9tWVLF7QtxHcIVPP8B2wwO3QD9+v+WUw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vision_opencv";
  version = "3.2.1-1";
  src = sources.vision_opencv;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_geometry ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
