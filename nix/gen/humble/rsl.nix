{
  buildRosPackage,
  clang,
  doxygen,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  git,
  rclcpp,
  substituteSource,
  tcb_span,
  tl_expected,
}:
let
  sources = rec {
    fields2cover-vendor_source-or-tools-5-vendor_source-doxygen-awesome-0 = substituteSource {
      src = fetchurl {
        name = "fields2cover-vendor_source-or-tools-5-vendor_source-doxygen-awesome-0-source";
        url = "https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
        hash = "sha256-HIlS9jhR+Ic9j73/EY/9nZG6QJEjsYFu59zTqNHlWHA=";
      };
      substitutions = [
      ];
    };
    rsl = substituteSource {
      src = fetchgit {
        name = "rsl-source";
        url = "https://github.com/ros2-gbp/RSL-release.git";
        rev = "4817c58f6c654a6181f6d2f983893f764315fb12";
        hash = "sha256-E8+8s6cFca2isl5g5q2OD85VomBeUfxjFIb3we5RUTA=";
      };
      substitutions = [
        {
          path = "docs/CMakeLists.txt";
          from = "DOWNLOAD\n     https://raw.githubusercontent.com/jothepro/doxygen-awesome-css/v2.1.0/doxygen-awesome.css";
          to = "DOWNLOAD file://${fields2cover-vendor_source-or-tools-5-vendor_source-doxygen-awesome-0}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "rsl";
  version = "1.1.0-1";
  src = sources.rsl;
  nativeBuildInputs = [ doxygen ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen fmt rclcpp tcb_span tl_expected ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
