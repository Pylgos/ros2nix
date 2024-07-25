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
    librealsense2 = substituteSource {
      src = fetchgit {
        name = "librealsense2-source";
        url = "https://github.com/IntelRealSense/librealsense2-release.git";
        rev = "96c0e76f3a6ff85524cad8e477e47241c5319609";
        hash = "sha256-7r0joxXgs6pfm3I9bcOCY2kI4d7IDMEUBhLuZeIv7uQ=";
      };
      substitutions = [
        {
          path = "CMake/catch2-download.cmake.in";
          from = "GIT_REPOSITORY https://github.com/catchorg/Catch2.git";
          to = "URL ${librealsense2-vendor_source-Catch2-0}";
        }
        {
          path = "CMake/connectivity_check.cmake";
          from = "DOWNLOAD \"https://librealsense.intel.com/Releases/connectivity_check\"";
          to = "DOWNLOAD file://${librealsense2-vendor_source-connectivity_check-0}";
        }
        {
          path = "CMake/external_fastdds.cmake";
          from = "GIT_REPOSITORY https://github.com/eProsima/Fast-DDS.git";
          to = "URL ${librealsense2-vendor_source-Fast-DDS-0}";
        }
        {
          path = "CMake/external_foonathan_memory.cmake";
          from = "GIT_REPOSITORY https://github.com/foonathan/memory.git";
          to = "URL ${librealsense2-vendor_source-memory-0}";
        }
        {
          path = "CMake/external_libcurl.cmake";
          from = "GIT_REPOSITORY \"https://github.com/curl/curl.git\"";
          to = "URL ${librealsense2-vendor_source-curl-0}";
        }
        {
          path = "CMake/external_libusb.cmake";
          from = "GIT_REPOSITORY \"https://github.com/ev-mp/libusb.git\"";
          to = "URL ${librealsense2-vendor_source-libusb-0}";
        }
        {
          path = "CMake/json-download.cmake.in";
          from = "GIT_REPOSITORY \"https://github.com/nlohmann/json.git\"";
          to = "URL ${librealsense2-vendor_source-json-0}";
        }
        {
          path = "CMake/pybind11-download.cmake.in";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11.git\"";
          to = "URL ${librealsense2-vendor_source-pybind11-0}";
        }
        {
          path = "CMake/pybind11-json-download.cmake.in";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11_json.git\"";
          to = "URL ${librealsense2-vendor_source-pybind11_json-0}";
        }
        {
          path = "third-party/glfw/CMake/GenerateMappings.cmake";
          from = "DOWNLOAD \"\${source_url}\"";
          to = "DOWNLOAD file://${librealsense2-vendor_source-gamecontrollerdb-0}";
        }
      ];
    };
    librealsense2-vendor_source-Catch2-0 = substituteSource {
      src = fetchgit {
        name = "librealsense2-vendor_source-Catch2-0-source";
        url = "https://github.com/catchorg/Catch2.git";
        rev = "6e79e682b726f524310d55dec8ddac4e9c52fb5f";
        hash = "sha256-DqGGfNjKPW9HFJrX9arFHyNYjB61uoL6NabZatTWrr0=";
      };
      substitutions = [
      ];
    };
    librealsense2-vendor_source-Fast-DDS-0 = substituteSource {
      src = fetchgit {
        name = "librealsense2-vendor_source-Fast-DDS-0-source";
        url = "https://github.com/eProsima/Fast-DDS.git";
        rev = "ff71eabb0f054a50837638d8b669f1db17243b46";
        hash = "sha256-H1Unfwhu0fWMzck85fEUWOrCPWUHKxbWZEF8ay0Wtak=";
      };
      substitutions = [
      ];
    };
    librealsense2-vendor_source-connectivity_check-0 = substituteSource {
      src = fetchurl {
        name = "librealsense2-vendor_source-connectivity_check-0-source";
        url = "https://librealsense.intel.com/Releases/connectivity_check";
        hash = "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=";
      };
      substitutions = [
      ];
    };
    librealsense2-vendor_source-curl-0 = substituteSource {
      src = fetchgit {
        name = "librealsense2-vendor_source-curl-0-source";
        url = "https://github.com/curl/curl.git";
        rev = "2f33be817cbce6ad7a36f27dd7ada9219f13584c";
        hash = "sha256-sR4Pv5YWcS5/zWUff5f9ASFkx7Fv75WdtpnxiKG4Ulc=";
      };
      substitutions = [
      ];
    };
    librealsense2-vendor_source-gamecontrollerdb-0 = substituteSource {
      src = fetchurl {
        name = "librealsense2-vendor_source-gamecontrollerdb-0-source";
        url = "https://raw.githubusercontent.com/gabomdq/SDL_GameControllerDB/master/gamecontrollerdb.txt";
        hash = "sha256-Dyl1eJi8aNkrg6mOqOhzuYNjcRzEELHqF8mXUWhU+3o=";
      };
      substitutions = [
      ];
    };
    librealsense2-vendor_source-json-0 = substituteSource {
      src = fetchgit {
        name = "librealsense2-vendor_source-json-0-source";
        url = "https://github.com/nlohmann/json.git";
        rev = "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03";
        hash = "sha256-7F0Jon+1oWL7uqet5i1IgHX0fUw/+z0QwEcA3zs5xHg=";
      };
      substitutions = [
      ];
    };
    librealsense2-vendor_source-libusb-0 = substituteSource {
      src = fetchgit {
        name = "librealsense2-vendor_source-libusb-0-source";
        url = "https://github.com/ev-mp/libusb.git";
        rev = "2a7372db54094a406a755f0b8548b614ba8c78ec";
        hash = "sha256-KYM8Aaz4kV7GFiQVy+dgFk6tPvDlJI6iPY5ddt4+OIE=";
      };
      substitutions = [
      ];
    };
    librealsense2-vendor_source-memory-0 = substituteSource {
      src = fetchgit {
        name = "librealsense2-vendor_source-memory-0-source";
        url = "https://github.com/foonathan/memory.git";
        rev = "0f0775770fd1c506fa9c5ad566bd6ba59659db66";
        hash = "sha256-nLBnxPbPKiLCFF2TJgD/eJKJJfzktVBW3SRW2m3WK/s=";
      };
      substitutions = [
      ];
    };
    librealsense2-vendor_source-pybind11-0 = substituteSource {
      src = fetchgit {
        name = "librealsense2-vendor_source-pybind11-0-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "0bd8896a4010f2d91b2340570c24fa08606ec406";
        hash = "sha256-Rlr6Ec6BEujTxQkQ9UP+6u0cYeFsJlj7U346MtRM6QM=";
      };
      substitutions = [
      ];
    };
    librealsense2-vendor_source-pybind11_json-0 = substituteSource {
      src = fetchgit {
        name = "librealsense2-vendor_source-pybind11_json-0-source";
        url = "https://github.com/pybind/pybind11_json.git";
        rev = "b02a2ad597d224c3faee1f05a56d81d4c4453092";
        hash = "sha256-Kl/QflV2bBoH72/LW03K8JDlhBF+DYYXL47A5s1nmTw=";
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
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ git pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ glfw3 libGL libGLU libusb1 openssl udev xorg.libX11 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}