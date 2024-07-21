{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  freetype,
  libGL,
  libGLU,
  substituteSource,
  xorg,
}:
let
  sources = rec {
    rviz_ogre_vendor = substituteSource {
      src = fetchgit {
        name = "rviz_ogre_vendor-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "4d4dec1a3a3d4a9c3a39b046f132b23381835a4b";
        hash = "sha256-1DkCwlnSLGJcNPhyfFqcXN6Iu+zp5KnCobzsEDH5/DI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://git.savannah.gnu.org/git/freetype/freetype2.git";
          to = "VCS_TYPE path VCS_URL ${rviz_ogre_vendor-vendor_source0}";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/OGRECave/ogre.git";
          to = "VCS_TYPE path VCS_URL ${rviz_ogre_vendor-vendor_source2}";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/madler/zlib.git";
          to = "VCS_TYPE path VCS_URL ${rviz_ogre_vendor-vendor_source1}";
        }
      ];
    };
    rviz_ogre_vendor-vendor_source0 = substituteSource {
      src = fetchgit {
        name = "rviz_ogre_vendor-vendor_source0-source";
        url = "https://git.savannah.gnu.org/git/freetype/freetype2.git";
        rev = "3f83daeecb1a78d851b660eed025eeba362c0e4a";
        hash = "sha256-UEn5Renp7EK9hTNRLiV7sec70zvY8mrLRwJoZ6aUJEE=";
      };
      substitutions = [
      ];
    };
    rviz_ogre_vendor-vendor_source1 = substituteSource {
      src = fetchgit {
        name = "rviz_ogre_vendor-vendor_source1-source";
        url = "https://github.com/madler/zlib.git";
        rev = "09155eaa2f9270dc4ed1fa13e2b4b2613e6e4851";
        hash = "sha256-eUuXV5zfy+fmiMNdWw5QCqDloBkaxy1tgi7by9nYHNA=";
      };
      substitutions = [
      ];
    };
    rviz_ogre_vendor-vendor_source2 = substituteSource {
      src = fetchgit {
        name = "rviz_ogre_vendor-vendor_source2-source";
        url = "https://github.com/OGRECave/ogre.git";
        rev = "93d7eb5282d31b956f008a53e837bbb820b34454";
        hash = "sha256-Z0ixdSmkV93coBBVZ5R3lPLfVMXRfWsFz/RsSyqPWFY=";
      };
      substitutions = [
        {
          path = "Components/Overlay/CMakeLists.txt";
          from = "DOWNLOAD\n        https://github.com/ocornut/imgui/archive/v1.79.tar.gz";
          to = "DOWNLOAD file://${rviz_ogre_vendor-vendor_source2-vendor_source0}";
        }
      ];
    };
    rviz_ogre_vendor-vendor_source2-vendor_source0 = substituteSource {
      src = fetchurl {
        name = "rviz_ogre_vendor-vendor_source2-vendor_source0-source";
        url = "https://github.com/ocornut/imgui/archive/v1.79.tar.gz";
        hash = "sha256-8ZCFAfbcbbik1XLCklmEf2+IJoSxBIjTqNLaMXRM0KQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_ogre_vendor";
  version = "14.1.2-1";
  src = sources.rviz_ogre_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ freetype libGL libGLU xorg.libX11 xorg.libXaw xorg.libXrandr ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
