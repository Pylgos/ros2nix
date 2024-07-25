{
  ament_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  freetype,
  git,
  libGL,
  libGLU,
  pkg-config,
  substituteSource,
  xorg,
}:
let
  sources = rec {
    rviz_ogre_vendor = substituteSource {
      src = fetchgit {
        name = "rviz_ogre_vendor-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "1959f9d4650c74d5de9a064b8341bde981bccf22";
        hash = "sha256-dPflSQQ/RDW3/HJ/EPbPjzMB60gkxWLpF+xx15a64Ww=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://git.savannah.gnu.org/cgit/freetype/freetype2.git/snapshot/freetype2-VER-2-6-5.tar.gz";
          to = "URL ${rviz_ogre_vendor-vendor_source-freetype2-VER-2-6-5-0}";
        }
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/OGRECave/ogre/archive/v1.12.10.zip";
          to = "URL ${rviz_ogre_vendor-vendor_source-v1-2}";
        }
        {
          path = "CMakeLists.txt";
          from = "URL https://www.zlib.net/fossils/zlib-1.2.11.tar.gz";
          to = "URL ${rviz_ogre_vendor-vendor_source-zlib-1-1}";
        }
      ];
    };
    rviz_ogre_vendor-vendor_source-freetype2-VER-2-6-5-0 = substituteSource {
      src = fetchzip {
        name = "rviz_ogre_vendor-vendor_source-freetype2-VER-2-6-5-0-source";
        url = "https://git.savannah.gnu.org/cgit/freetype/freetype2.git/snapshot/freetype2-VER-2-6-5.tar.gz";
        hash = "sha256-I7eevQ4bSEyHVgr0cqp3UMESqwV2VG+wSQfgE9BqOvw=";
      };
      substitutions = [
      ];
    };
    rviz_ogre_vendor-vendor_source-v1-2 = substituteSource {
      src = fetchzip {
        name = "rviz_ogre_vendor-vendor_source-v1-2-source";
        url = "https://github.com/OGRECave/ogre/archive/v1.12.10.zip";
        hash = "sha256-Z0ixdSmkV93coBBVZ5R3lPLfVMXRfWsFz/RsSyqPWFY=";
      };
      substitutions = [
        {
          path = "Components/Overlay/CMakeLists.txt";
          from = "DOWNLOAD\n        https://github.com/ocornut/imgui/archive/v1.79.tar.gz";
          to = "DOWNLOAD file://${rviz_ogre_vendor-vendor_source-v1-2-vendor_source-v1-0}";
        }
      ];
    };
    rviz_ogre_vendor-vendor_source-v1-2-vendor_source-v1-0 = substituteSource {
      src = fetchurl {
        name = "rviz_ogre_vendor-vendor_source-v1-2-vendor_source-v1-0-source";
        url = "https://github.com/ocornut/imgui/archive/v1.79.tar.gz";
        hash = "sha256-8ZCFAfbcbbik1XLCklmEf2+IJoSxBIjTqNLaMXRM0KQ=";
      };
      substitutions = [
      ];
    };
    rviz_ogre_vendor-vendor_source-zlib-1-1 = substituteSource {
      src = fetchzip {
        name = "rviz_ogre_vendor-vendor_source-zlib-1-1-source";
        url = "https://www.zlib.net/fossils/zlib-1.2.11.tar.gz";
        hash = "sha256-AQIoy96jcdmKs/F4GVqDFXxcZ7c66GF+yalHg3ALEyU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_ogre_vendor";
  version = "12.4.7-1";
  src = sources.rviz_ogre_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ git pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ freetype libGL libGLU xorg.libX11 xorg.libXaw xorg.libXrandr ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
