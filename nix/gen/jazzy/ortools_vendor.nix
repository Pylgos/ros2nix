{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  substituteSource,
}:
let
  sources = rec {
    fields2cover-vendor_source5 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source5-source";
        url = "https://github.com/google/or-tools.git";
        rev = "3c5c99c278ef3d0ac85cdbd4f008f8c0fd2f3f94";
        hash = "sha256-Ip2mKl+MuzOPaF1a2FTubqT0tA4gzDnD8dR7dLaHHo8=";
      };
      substitutions = [
        {
          path = "cmake/cpp.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${ortools_vendor-vendor_source0-vendor_source0}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/ERGO-Code/HiGHS.git\"";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source9}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Cbc.git\"";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source15}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Cgl.git\"";
          to = "URL ${fields2cover-vendor_source5-vendor_source14}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Clp.git\"";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source13}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/CoinUtils.git\"";
          to = "URL ${fields2cover-vendor_source5-vendor_source11}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/GLPK.git\"";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source8}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/Mizux/Osi.git\"";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source12}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/abseil/abseil-cpp.git\"";
          to = "URL ${fields2cover-vendor_source5-vendor_source1}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/google/re2.git\"";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source3}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/madler/ZLIB.git\"";
          to = "URL ${fields2cover-vendor_source5-vendor_source0}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/protocolbuffers/protobuf.git\"";
          to = "URL ${fields2cover-vendor_source5-vendor_source2}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11.git\"";
          to = "URL ${pybind11_vendor-vendor_source0}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11_abseil.git\"";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source6}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/pybind/pybind11_protobuf.git\"";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source7}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/scipopt/scip.git\"";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source10}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://gitlab.com/libeigen/eigen.git\"";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source4}";
        }
        {
          path = "cmake/dependencies/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/googletest.git";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source16}";
        }
        {
          path = "cmake/dotnet.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${ortools_vendor-vendor_source0-vendor_source0}";
        }
        {
          path = "cmake/java.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${ortools_vendor-vendor_source0-vendor_source0}";
        }
        {
          path = "cmake/python.cmake";
          from = "DOWNLOAD\n      https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${ortools_vendor-vendor_source0-vendor_source0}";
        }
      ];
    };
    fields2cover-vendor_source5-vendor_source0 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source5-vendor_source0-source";
        url = "https://github.com/madler/ZLIB.git";
        rev = "04f42ceca40f73e2978b50e93806c2a18c1281fc";
        hash = "sha256-+Y5QRTo87r3xXslF01sbWd4RNMG1pFG/0LCthbCybsQ=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source5-vendor_source1 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source5-vendor_source1-source";
        url = "https://github.com/abseil/abseil-cpp.git";
        rev = "2f9e432cce407ce0ae50676696666f33a77d42ac";
        hash = "sha256-D4E11bICKr3Z5RRah7QkfXVsXtuUg32FMmKpiOGjZDM=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source5-vendor_source11 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source5-vendor_source11-source";
        url = "https://github.com/Mizux/CoinUtils.git";
        rev = "675cbb8e131f07705544a2e9074355cfa1a319b4";
        hash = "sha256-sR+ZM5mBAFss1NubW2jDg6oaCoPoRxn6YsSmk7xi2xI=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source5-vendor_source14 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source5-vendor_source14-source";
        url = "https://github.com/Mizux/Cgl.git";
        rev = "59d95fba6605329d615d44ac7be0be2397210d5a";
        hash = "sha256-lSNsHs6BcGGMs5jnaYTqa+V6xzYshrB5U2AapkNxPR8=";
      };
      substitutions = [
      ];
    };
    fields2cover-vendor_source5-vendor_source2 = substituteSource {
      src = fetchgit {
        name = "fields2cover-vendor_source5-vendor_source2-source";
        url = "https://github.com/protocolbuffers/protobuf.git";
        rev = "4a2aef570deb2bfb8927426558701e8bfc26f2a4";
        hash = "sha256-1gdHC+f1T3KOy8A7KlWOjauRHsMKfEXoQiYqZMzzMxI=";
      };
      substitutions = [
        {
          path = "upb/cmake/CMakeLists.txt";
          from = "GIT_REPOSITORY \"https://github.com/protocolbuffers/utf8_range.git\"";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source2-vendor_source0}";
        }
      ];
    };
    gtsam-vendor_source0 = substituteSource {
      src = fetchurl {
        name = "gtsam-vendor_source0-source";
        url = "http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz";
        hash = "sha256-vZntt9xHKapjGQQapStG2/erraGkP3oj/iYm2yTFJDw=";
      };
      substitutions = [
      ];
    };
    ortools_vendor = substituteSource {
      src = fetchgit {
        name = "ortools_vendor-source";
        url = "https://github.com/ros2-gbp/ortools_vendor-release.git";
        rev = "87e2a82f7ef8300503e749a1647146e94baff921";
        hash = "sha256-yvm3NB4vC9QcixufG3FnSuEdpj75/eiLD2tzhd7gh5s=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/google/or-tools.git";
          to = "VCS_TYPE path VCS_URL ${fields2cover-vendor_source5}";
        }
      ];
    };
    ortools_vendor-vendor_source0-vendor_source0 = substituteSource {
      src = fetchurl {
        name = "ortools_vendor-vendor_source0-vendor_source0-source";
        url = "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
        hash = "sha256-HIlS9jhR+Ic9j73/EY/9nZG6QJEjsYFu59zTqNHlWHA=";
      };
      substitutions = [
      ];
    };
    ortools_vendor-vendor_source0-vendor_source10 = substituteSource {
      src = fetchgit {
        name = "ortools_vendor-vendor_source0-vendor_source10-source";
        url = "https://github.com/scipopt/scip.git";
        rev = "61297938717271f462c995b99ab4b217ca1d9499";
        hash = "sha256-Ub0eykyZOlJtqUofTx4a2YcOMiyG6AUX0llxsqJ+YvE=";
      };
      substitutions = [
      ];
    };
    ortools_vendor-vendor_source0-vendor_source12 = substituteSource {
      src = fetchgit {
        name = "ortools_vendor-vendor_source0-vendor_source12-source";
        url = "https://github.com/Mizux/Osi.git";
        rev = "d2809dd1ab01eb5c766edce7cea2ca2c1c5ecd2a";
        hash = "sha256-/kwsR3bauIp2BNvTLqgoAivEZTLmIkcgUfzzcYB5Ytg=";
      };
      substitutions = [
      ];
    };
    ortools_vendor-vendor_source0-vendor_source13 = substituteSource {
      src = fetchgit {
        name = "ortools_vendor-vendor_source0-vendor_source13-source";
        url = "https://github.com/Mizux/Clp.git";
        rev = "914e0af16285ab6b0514947296213a0e67e80880";
        hash = "sha256-CpWM0t3CBPvuMbWq1fEsagP9kPFxI+VreeHjjH9cwkI=";
      };
      substitutions = [
      ];
    };
    ortools_vendor-vendor_source0-vendor_source15 = substituteSource {
      src = fetchgit {
        name = "ortools_vendor-vendor_source0-vendor_source15-source";
        url = "https://github.com/Mizux/Cbc.git";
        rev = "b01a53da39577380acdb84d8a3577911c5d91a13";
        hash = "sha256-BZbcxscWO29o0haRtO4ND5EPm2v6k23t6bWnrtrG7AQ=";
      };
      substitutions = [
      ];
    };
    ortools_vendor-vendor_source0-vendor_source16 = substituteSource {
      src = fetchgit {
        name = "ortools_vendor-vendor_source0-vendor_source16-source";
        url = "https://github.com/google/googletest.git";
        rev = "f8d7d77c06936315286eb55f8de22cd23c188571";
        hash = "sha256-t0RchAHTJbuI5YW4uyBPykTvcjy90JW9AOPNjIhwh6U=";
      };
      substitutions = [
      ];
    };
    ortools_vendor-vendor_source0-vendor_source2-vendor_source0 = substituteSource {
      src = fetchgit {
        name = "ortools_vendor-vendor_source0-vendor_source2-vendor_source0-source";
        url = "https://github.com/protocolbuffers/utf8_range.git";
        rev = "d863bc33e15cba6d873c878dcca9e6fe52b2f8cb";
        hash = "sha256-1iXa01BVX1wk7craFwC3liLnwT3487qvM93YIdOoEBs=";
      };
      substitutions = [
      ];
    };
    ortools_vendor-vendor_source0-vendor_source3 = substituteSource {
      src = fetchgit {
        name = "ortools_vendor-vendor_source0-vendor_source3-source";
        url = "https://github.com/google/re2.git";
        rev = "9665465b69ab699279ef9fb9454559d90fed1d76";
        hash = "sha256-a6yo0zLgb193TDL8akselJuZfYqCjPwQ/FJ7+KexuLE=";
      };
      substitutions = [
      ];
    };
    ortools_vendor-vendor_source0-vendor_source4 = substituteSource {
      src = fetchgit {
        name = "ortools_vendor-vendor_source0-vendor_source4-source";
        url = "https://gitlab.com/libeigen/eigen.git";
        rev = "3147391d946bb4b6c68edd901f2add6ac1f31f8c";
        hash = "sha256-1/4xMetKMDOgZgzz3WMxfHUEpmdAm52RqZvz6i0mLEw=";
      };
      substitutions = [
        {
          path = "lapack/CMakeLists.txt";
          from = "DOWNLOAD \"http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz\"";
          to = "DOWNLOAD file://${gtsam-vendor_source0}";
        }
      ];
    };
    ortools_vendor-vendor_source0-vendor_source6 = substituteSource {
      src = fetchgit {
        name = "ortools_vendor-vendor_source0-vendor_source6-source";
        url = "https://github.com/pybind/pybind11_abseil.git";
        rev = "52f27398876a3177049977249e004770bd869e61";
        hash = "sha256-I63AVof0Zfm4B0WTS4W35HCGN9MuAR2MAriEFVsvPrA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/abseil/abseil-cpp/archive/refs/tags/20230802.0.tar.gz";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source6-vendor_source0}";
        }
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/pybind/pybind11/archive/refs/heads/master.tar.gz";
          to = "URL ${ortools_vendor-vendor_source0-vendor_source6-vendor_source1}";
        }
      ];
    };
    ortools_vendor-vendor_source0-vendor_source6-vendor_source0 = substituteSource {
      src = fetchzip {
        name = "ortools_vendor-vendor_source0-vendor_source6-vendor_source0-source";
        url = "https://github.com/abseil/abseil-cpp/archive/refs/tags/20230802.0.tar.gz";
        hash = "sha256-yILAsAERUDMbRWh8t4o6W74YiswvGIHSyBAIuLVbzxY=";
      };
      substitutions = [
      ];
    };
    ortools_vendor-vendor_source0-vendor_source6-vendor_source1 = substituteSource {
      src = fetchzip {
        name = "ortools_vendor-vendor_source0-vendor_source6-vendor_source1-source";
        url = "https://github.com/pybind/pybind11/archive/refs/heads/master.tar.gz";
        hash = "sha256-6D7ccD3EL2bWtR/6hV0FnofcsqU+BFlwV4TMPsO3RCM=";
      };
      substitutions = [
      ];
    };
    ortools_vendor-vendor_source0-vendor_source7 = substituteSource {
      src = fetchgit {
        name = "ortools_vendor-vendor_source0-vendor_source7-source";
        url = "https://github.com/pybind/pybind11_protobuf.git";
        rev = "3b11990a99dea5101799e61d98a82c4737d240cc";
        hash = "sha256-saeBxffAbDoHI/YvLatSubpdch9vb5DAfp/Bz3MC8ps=";
      };
      substitutions = [
      ];
    };
    ortools_vendor-vendor_source0-vendor_source8 = substituteSource {
      src = fetchgit {
        name = "ortools_vendor-vendor_source0-vendor_source8-source";
        url = "https://github.com/Mizux/GLPK.git";
        rev = "2a3bad935570eb3339792b888a08e61a90db0be0";
        hash = "sha256-3sWQuyWpf62zyrGJwpWdsUBibIwdfiGeivdm3zEkjXk=";
      };
      substitutions = [
      ];
    };
    ortools_vendor-vendor_source0-vendor_source9 = substituteSource {
      src = fetchgit {
        name = "ortools_vendor-vendor_source0-vendor_source9-source";
        url = "https://github.com/ERGO-Code/HiGHS.git";
        rev = "21da9b90e0dceeb22ef9e35e5ff2c3ab17dc5232";
        hash = "sha256-Wa5ivUJk0t58FhZD0zy0zxHHj4/p8e9WcxXwu5zenxI=";
      };
      substitutions = [
      ];
    };
    pybind11_vendor-vendor_source0 = substituteSource {
      src = fetchgit {
        name = "pybind11_vendor-vendor_source0-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "8a099e44b3d5f85b20f05828d919d2332a8de841";
        hash = "sha256-sO/Fa+QrAKyq2EYyYMcjPrYI+bdJIrDoj6L3JHoDo3E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ortools_vendor";
  version = "9.9.0-6";
  src = sources.ortools_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
