{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  sqlite,
  substituteSource,
}:
let
  sources = rec {
    sqlite3_vendor = substituteSource {
      src = fetchgit {
        name = "sqlite3_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "88c49cdd3377769d297d55a9940bb7dc2fbaba53";
        hash = "sha256-fPWiReZHpd4BjKfNTfhyDYP96If/j/FW+Sap/zesAkE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://www.sqlite.org/2022/sqlite-amalgamation-3370200.zip";
          to = "URL ${sqlite3_vendor-vendor_source-sqlite-amalgamation-3370200-0}";
        }
      ];
    };
    sqlite3_vendor-vendor_source-sqlite-amalgamation-3370200-0 = substituteSource {
      src = fetchzip {
        name = "sqlite3_vendor-vendor_source-sqlite-amalgamation-3370200-0-source";
        url = "https://www.sqlite.org/2022/sqlite-amalgamation-3370200.zip";
        hash = "sha256-L7BvZlrl+9AlE42C1PszvjE9byi2qtcbfNiotUYInmc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sqlite3_vendor";
  version = "0.22.6-1";
  src = sources.sqlite3_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ sqlite ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
