{
  SDL2,
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    sdl2_vendor = substituteSource {
      src = fetchgit {
        name = "sdl2_vendor-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "fa573605fb143351af40aa155816903c88d50ab3";
        hash = "sha256-FPIFbwhynn0Z2eddBdAgdM0oExj1aEQTgF2n59zGr40=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://www.libsdl.org/release/SDL2-2.0.20.tar.gz";
          to = "URL ${sdl2_vendor-vendor_source-SDL2-2-0}";
        }
      ];
    };
    sdl2_vendor-vendor_source-SDL2-2-0 = substituteSource {
      src = fetchzip {
        name = "sdl2_vendor-vendor_source-SDL2-2-0-source";
        url = "https://www.libsdl.org/release/SDL2-2.0.20.tar.gz";
        hash = "sha256-DyBhGqPrQBiCq7gcAZhgD4X0KQ0mT6utCCXhJECpT3c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sdl2_vendor";
  version = "3.3.0-1";
  src = sources.sdl2_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ SDL2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
