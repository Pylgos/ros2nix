{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gdal,
  geos,
  git,
  gtest,
  lcov,
  protobuf,
  python3,
  python3Packages,
  substituteSource,
  swig,
  tbb,
  tinyxml-2,
}:
let
  sources = rec {
    fast_gicp-vendor_source-lapack_addons_3-0 = substituteSource {
      src = fetchurl {
        name = "fast_gicp-vendor_source-lapack_addons_3-0-source";
        url = "http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz";
        hash = "sha256-vZntt9xHKapjGQQapStG2/erraGkP3oj/iYm2yTFJDw=";
      };
      substitutions = [
      ];
    };
    fields2cover = substituteSource {
      src = fetchgit {
        name = "fields2cover-source";
        url = "https://github.com/ros2-gbp/fields2cover-release.git";
        rev = "394a661fefadd3f67be22e80c8d3f588779212fc";
        hash = "sha256-M6nTrgKOJ8WBcqrcY99OK9HEHW3JqWnKANPdzd/r1cQ=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/Fields2Cover/spline.git";
          to = "URL ${fields2cover-vendor_source-spline-1}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/Fields2Cover/steering_functions.git";
          to = "URL ${fields2cover-vendor_source-steering_functions-0}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/or-tools.git";
          to = "URL ${fields2cover-vendor_source-or-tools-5}";
        }
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/google/or-tools/releases/download/v9.9/or-tools_amd64_ubuntu-22.04_cpp_v9.9.3963.tar.gz";
          to = "URL ${fields2cover-vendor_source-or-tools_amd64_ubuntu-22-3}";
        }
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/google/or-tools/releases/download/v9.9/or-tools_arm64_debian-11_cpp_v9.9.3963.tar.gz";
          to = "URL ${fields2cover-vendor_source-or-tools_arm64_debian-11_cpp_v9-4}";
        }
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/nlohmann/json/releases/download/v3.11.3/json.tar.xz";
          to = "URL ${fields2cover-vendor_source-json-2}";
        }
      ];
    };
    fields2cover-vendor_source-json-2 = substituteSource {
      src = fetchzip {
        name = "fields2cover-vendor_source-json-2-source";
        url = "https://github.com/nlohmann/json/releases/download/v3.11.3/json.tar.xz";
        hash = "sha256-cnGfiVhXzqfj5Fay823wntWcTnbh8r2SefDLslb1Dh0=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-source";
        url = "https://github.com/google/or-tools.git";
        rev = "3c5c99c278ef3d0ac85cdbd4f008f8c0fd2f3f94";
        hash = "sha256-Ip2mKl+MuzOPaF1a2FTubqT0tA4gzDnD8dR7dLaHHo8=";
      };
      substitutions = [
        {
          path = "cmake/cpp.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${fields2cover-vendor_source-or-tools-5-vendor_source-doxygen-awesome-0}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/ERGO-Code/HiGHS.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-HiGHS-9}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Cbc.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-Cbc-15}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Cgl.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-Cgl-14}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Clp.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-Clp-13}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/CoinUtils.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-CoinUtils-11}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/GLPK.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-GLPK-8}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Osi.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-Osi-12}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/abseil/abseil-cpp.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-abseil-cpp-1}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/google/re2.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-re2-3}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/madler/ZLIB.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-ZLIB-0}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/protocolbuffers/protobuf.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-protobuf-2}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-pybind11-5}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11_abseil.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-pybind11_abseil-6}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11_protobuf.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-pybind11_protobuf-7}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/scipopt/scip.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-scip-10}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://gitlab.com/libeigen/eigen.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-eigen-4}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/googletest.git";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-googletest-16}";
        }
        {
          path = "cmake/dotnet.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${fields2cover-vendor_source-or-tools-5-vendor_source-doxygen-awesome-0}";
        }
        {
          path = "cmake/java.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${fields2cover-vendor_source-or-tools-5-vendor_source-doxygen-awesome-0}";
        }
        {
          path = "cmake/python.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${fields2cover-vendor_source-or-tools-5-vendor_source-doxygen-awesome-0}";
        }
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-Cbc-15 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-Cbc-15-source";
        url = "https://github.com/Mizux/Cbc.git";
        rev = "b01a53da39577380acdb84d8a3577911c5d91a13";
        hash = "sha256-BZbcxscWO29o0haRtO4ND5EPm2v6k23t6bWnrtrG7AQ=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-Cgl-14 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-Cgl-14-source";
        url = "https://github.com/Mizux/Cgl.git";
        rev = "59d95fba6605329d615d44ac7be0be2397210d5a";
        hash = "sha256-lSNsHs6BcGGMs5jnaYTqa+V6xzYshrB5U2AapkNxPR8=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-Clp-13 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-Clp-13-source";
        url = "https://github.com/Mizux/Clp.git";
        rev = "914e0af16285ab6b0514947296213a0e67e80880";
        hash = "sha256-CpWM0t3CBPvuMbWq1fEsagP9kPFxI+VreeHjjH9cwkI=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-CoinUtils-11 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-CoinUtils-11-source";
        url = "https://github.com/Mizux/CoinUtils.git";
        rev = "675cbb8e131f07705544a2e9074355cfa1a319b4";
        hash = "sha256-sR+ZM5mBAFss1NubW2jDg6oaCoPoRxn6YsSmk7xi2xI=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-GLPK-8 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-GLPK-8-source";
        url = "https://github.com/Mizux/GLPK.git";
        rev = "2a3bad935570eb3339792b888a08e61a90db0be0";
        hash = "sha256-3sWQuyWpf62zyrGJwpWdsUBibIwdfiGeivdm3zEkjXk=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-HiGHS-9 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-HiGHS-9-source";
        url = "https://github.com/ERGO-Code/HiGHS.git";
        rev = "21da9b90e0dceeb22ef9e35e5ff2c3ab17dc5232";
        hash = "sha256-Wa5ivUJk0t58FhZD0zy0zxHHj4/p8e9WcxXwu5zenxI=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-Osi-12 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-Osi-12-source";
        url = "https://github.com/Mizux/Osi.git";
        rev = "d2809dd1ab01eb5c766edce7cea2ca2c1c5ecd2a";
        hash = "sha256-/kwsR3bauIp2BNvTLqgoAivEZTLmIkcgUfzzcYB5Ytg=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-ZLIB-0 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-ZLIB-0-source";
        url = "https://github.com/madler/ZLIB.git";
        rev = "04f42ceca40f73e2978b50e93806c2a18c1281fc";
        hash = "sha256-+Y5QRTo87r3xXslF01sbWd4RNMG1pFG/0LCthbCybsQ=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-abseil-cpp-1 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-abseil-cpp-1-source";
        url = "https://github.com/abseil/abseil-cpp.git";
        rev = "2f9e432cce407ce0ae50676696666f33a77d42ac";
        hash = "sha256-D4E11bICKr3Z5RRah7QkfXVsXtuUg32FMmKpiOGjZDM=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-doxygen-awesome-0 = substituteSource {
      src = fetchurl {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-doxygen-awesome-0-source";
        url = "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
        hash = "sha256-HIlS9jhR+Ic9j73/EY/9nZG6QJEjsYFu59zTqNHlWHA=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-eigen-4 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-eigen-4-source";
        url = "https://gitlab.com/libeigen/eigen.git";
        rev = "3147391d946bb4b6c68edd901f2add6ac1f31f8c";
        hash = "sha256-1/4xMetKMDOgZgzz3WMxfHUEpmdAm52RqZvz6i0mLEw=";
      };
      substitutions = [
        {
          path = "lapack/CMakeLists.txt";
          from = "DOWNLOAD \"http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz\"";
          to = "DOWNLOAD file://${fast_gicp-vendor_source-lapack_addons_3-0}";
        }
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-googletest-16 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-googletest-16-source";
        url = "https://github.com/google/googletest.git";
        rev = "f8d7d77c06936315286eb55f8de22cd23c188571";
        hash = "sha256-t0RchAHTJbuI5YW4uyBPykTvcjy90JW9AOPNjIhwh6U=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-protobuf-2 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-protobuf-2-source";
        url = "https://github.com/protocolbuffers/protobuf.git";
        rev = "4a2aef570deb2bfb8927426558701e8bfc26f2a4";
        hash = "sha256-1gdHC+f1T3KOy8A7KlWOjauRHsMKfEXoQiYqZMzzMxI=";
      };
      substitutions = [
        {
          path = "upb/cmake/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/protocolbuffers/utf8_range.git\"";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-protobuf-2-vendor_source-utf8_range-0}";
        }
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-protobuf-2-vendor_source-utf8_range-0 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-protobuf-2-vendor_source-utf8_range-0-source";
        url = "https://github.com/protocolbuffers/utf8_range.git";
        rev = "d863bc33e15cba6d873c878dcca9e6fe52b2f8cb";
        hash = "sha256-1iXa01BVX1wk7craFwC3liLnwT3487qvM93YIdOoEBs=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-pybind11-5 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-pybind11-5-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "8a099e44b3d5f85b20f05828d919d2332a8de841";
        hash = "sha256-sO/Fa+QrAKyq2EYyYMcjPrYI+bdJIrDoj6L3JHoDo3E=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-pybind11_abseil-6 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-pybind11_abseil-6-source";
        url = "https://github.com/pybind/pybind11_abseil.git";
        rev = "52f27398876a3177049977249e004770bd869e61";
        hash = "sha256-I63AVof0Zfm4B0WTS4W35HCGN9MuAR2MAriEFVsvPrA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/abseil/abseil-cpp/archive/refs/tags/20230802.0.tar.gz";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-pybind11_abseil-6-vendor_source-20230802-0}";
        }
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/pybind/pybind11/archive/refs/heads/master.tar.gz";
          to = "URL ${fields2cover-vendor_source-or-tools-5-vendor_source-pybind11_abseil-6-vendor_source-master-1}";
        }
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-pybind11_abseil-6-vendor_source-20230802-0 = substituteSource {
      src = fetchzip {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-pybind11_abseil-6-vendor_source-20230802-0-source";
        url = "https://github.com/abseil/abseil-cpp/archive/refs/tags/20230802.0.tar.gz";
        hash = "sha256-yILAsAERUDMbRWh8t4o6W74YiswvGIHSyBAIuLVbzxY=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-pybind11_abseil-6-vendor_source-master-1 = substituteSource {
      src = fetchzip {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-pybind11_abseil-6-vendor_source-master-1-source";
        url = "https://github.com/pybind/pybind11/archive/refs/heads/master.tar.gz";
        hash = "sha256-TW8zUZErRRoMgQM+ON1npoAD5pDQK1/o99tIMpODAtk=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-pybind11_protobuf-7 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-pybind11_protobuf-7-source";
        url = "https://github.com/pybind/pybind11_protobuf.git";
        rev = "3b11990a99dea5101799e61d98a82c4737d240cc";
        hash = "sha256-saeBxffAbDoHI/YvLatSubpdch9vb5DAfp/Bz3MC8ps=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-re2-3 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-re2-3-source";
        url = "https://github.com/google/re2.git";
        rev = "9665465b69ab699279ef9fb9454559d90fed1d76";
        hash = "sha256-a6yo0zLgb193TDL8akselJuZfYqCjPwQ/FJ7+KexuLE=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools-5-vendor_source-scip-10 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-scip-10-source";
        url = "https://github.com/scipopt/scip.git";
        rev = "61297938717271f462c995b99ab4b217ca1d9499";
        hash = "sha256-Ub0eykyZOlJtqUofTx4a2YcOMiyG6AUX0llxsqJ+YvE=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools_amd64_ubuntu-22-3 = substituteSource {
      src = fetchzip {
        name = "fields2cover-vendor_source-or-tools_amd64_ubuntu-22-3-source";
        url = "https://github.com/google/or-tools/releases/download/v9.9/or-tools_amd64_ubuntu-22.04_cpp_v9.9.3963.tar.gz";
        hash = "sha256-PC2FL81bvEvvu1G1ylGVZdDYndsQCceoE07+0BD+ob4=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-or-tools_arm64_debian-11_cpp_v9-4 = substituteSource {
      src = fetchzip {
        name = "fields2cover-vendor_source-or-tools_arm64_debian-11_cpp_v9-4-source";
        url = "https://github.com/google/or-tools/releases/download/v9.9/or-tools_arm64_debian-11_cpp_v9.9.3963.tar.gz";
        hash = "sha256-26Ekgc9p+qiVj5hNswVmdXy2gTLMQqYTbuwBXTGd6oo=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-spline-1 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-spline-1-source";
        url = "https://github.com/Fields2Cover/spline.git";
        rev = "1b5d4bad29082997076b264de84ca6d46c2ae6ab";
        hash = "sha256-nWaanoqOVzDlxbfWFjT4j6ZQtp76E9tVbNVvx1R2dlM=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source-steering_functions-0 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source-steering_functions-0-source";
        url = "https://github.com/Fields2Cover/steering_functions.git";
        rev = "13e3f5658144b3832fb1eb31a0e2f5a3cbf57db9";
        hash = "sha256-+gGBX6kKKI0G+0AVwvIRyuzFKlCgHp+woiV0jfu0REo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fields2cover";
  version = "2.0.0-11";
  src = sources.fields2cover;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ git gtest python3 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen gdal geos protobuf python3 python3Packages.boost python3Packages.matplotlib python3Packages.tkinter swig tbb tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}