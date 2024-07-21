{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  glfw3,
  libGL,
  libGLU,
  libusb1,
  openssl,
  pkg-config,
  substituteSource,
  udev,
  xorg,
}:
let
  sources = rec {
    foonathan_memory_vendor-vendor_source0 = substituteSource {
      src = fetchgit {
        name = "foonathan_memory_vendor-vendor_source0-source";
        url = "https://github.com/foonathan/memory.git";
        rev = "0f0775770fd1c506fa9c5ad566bd6ba59659db66";
        hash = "sha256-nLBnxPbPKiLCFF2TJgD/eJKJJfzktVBW3SRW2m3WK/s=";
      };
      substitutions = [
      ];
    };
    librealsense2 = substituteSource {
      src = fetchgit {
        name = "librealsense2-source";
        url = "https://github.com/IntelRealSense/librealsense2-release.git";
        rev = "9b999a96567dc0721be20811b3f715c0c33227d1";
        hash = "sha256-tI3pz5+/WaOQ2PifY/4auyUraj3cReWbBOFBn7k6Hok=";
      };
      substitutions = [
        {
          path = "CMake/catch2-download.cmake.in";
          from = "GIT_REPOSITORY https://github.com/catchorg/Catch2.git";
          to = "URL ${odri_master_board_sdk-vendor_source0}";
        }
        {
          path = "CMake/connectivity_check.cmake";
          from = "DOWNLOAD \"https://librealsense.intel.com/Releases/connectivity_check\"";
          to = "DOWNLOAD file://${librealsense2-vendor_source0}";
        }
        {
          path = "CMake/external_fastdds.cmake";
          from = "GIT_REPOSITORY https://github.com/eProsima/Fast-DDS.git";
          to = "URL ${librealsense2-vendor_source0}";
        }
        {
          path = "CMake/external_foonathan_memory.cmake";
          from = "GIT_REPOSITORY https://github.com/foonathan/memory.git";
          to = "URL ${foonathan_memory_vendor-vendor_source0}";
        }
        {
          path = "CMake/external_libcurl.cmake";
          from = "GIT_REPOSITORY \"https://github.com/curl/curl.git\"";
          to = "URL ${librealsense2-vendor_source0}";
        }
        {
          path = "CMake/external_libusb.cmake";
          from = "GIT_REPOSITORY \"https://github.com/ev-mp/libusb.git\"";
          to = "URL ${librealsense2-vendor_source0}";
        }
        {
          path = "CMake/json-download.cmake.in";
          from = "GIT_REPOSITORY \"https://github.com/nlohmann/json.git\"";
          to = "URL ${librealsense2-vendor_source0}";
        }
        {
          path = "CMake/pybind11-download.cmake.in";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11.git\"";
          to = "URL ${librealsense2-vendor_source0}";
        }
        {
          path = "CMake/pybind11-json-download.cmake.in";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11_json.git\"";
          to = "URL ${librealsense2-vendor_source0}";
        }
        {
          path = "third-party/glfw/CMake/GenerateMappings.cmake";
          from = "DOWNLOAD \"\${source_url}\"";
          to = "DOWNLOAD file://${librealsense2-vendor_source0}";
        }
      ];
    };
    librealsense2-vendor_source0 = substituteSource {
      src = fetchurl {
        name = "librealsense2-vendor_source0-source";
        url = "https://raw.githubusercontent.com/gabomdq/SDL_GameControllerDB/master/gamecontrollerdb.txt";
        hash = "sha256-503gvcBDasNM51wI3gwzpt5H6u3KXEJtXagvQe0hits=";
      };
      substitutions = [
      ];
    };
    odri_master_board_sdk-vendor_source0 = substituteSource {
      src = fetchgit {
        name = "odri_master_board_sdk-vendor_source0-source";
        url = "https://github.com/catchorg/Catch2.git";
        rev = "6e79e682b726f524310d55dec8ddac4e9c52fb5f";
        hash = "sha256-DqGGfNjKPW9HFJrX9arFHyNYjB61uoL6NabZatTWrr0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "librealsense2";
  version = "2.55.1-1";
  src = sources.librealsense2;
  nativeBuildInputs = [ cmake git pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ libusb1 openssl udev ];
  propagatedBuildInputs = [ glfw3 libGL libGLU xorg.libX11 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
